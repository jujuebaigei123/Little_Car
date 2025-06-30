#!/usr/bin/env python3

import json, random, time, os, rospy, tf, math, tf2_ros, tf2_geometry_msgs
from sys import argv
from paho.mqtt import client as mqtt_client
from visualization_msgs.msg import Marker
from geometry_msgs.msg import PoseStamped, Quaternion
from data_comm.msg import car_state
from nav_msgs.msg import Path
from mqtt_comm.msg import task, path_point
from std_msgs.msg import Int32

che_id=os.getenv("agvId")
n=che_id.find("agv")
che_id=che_id[n:100]

err_count=0
agv_num=15
vehicle_dict={}

car_state_msg={
        "id": f"{che_id}",
        "map_x": -1,
        "map_y": -1,
        "heading": -1,
        "ctrmode": 0,
        "path": []   #[{"x": 0.0, "y": 1.0}, {"x": 1.0, "y": 2.0}]
    }

def car_state_callback(msg):
    car_state_msg["ctrmode"]=msg.ctrmode
     

def taskpath_callback(msg):  #  nav_msgs::Path
    # print(msg.poses) 
    points=[]
    for p in msg.poses:
        x=p.pose.position.x
        y=p.pose.position.y
        yaw=getYawfromOrientation(p.pose.orientation)*180/math.pi 
        item={"x": x, "y": y, "yaw": yaw}
        points.append(item)
    car_state_msg["path"]=points    


def getYawfromOrientation(orientation):
    quaternion = ( orientation.x, orientation.y, orientation.z, orientation.w )
    roll, pitch, yaw = tf.transformations.euler_from_quaternion(quaternion)
    return yaw
    

# def get_position(): 
#     global err_count

#     tf_buffer = tf2_ros.Buffer()
#     tf_listener = tf2_ros.TransformListener(tf_buffer)
    
#     ps_base = PoseStamped()
#     ps_base.header.frame_id = 'base_link'
#     ps_base.header.stamp = rospy.Time.now(); 
#     ps_base.pose.orientation.w = 1.0   
    
#     try:
#         transform = tf_buffer.lookup_transform('map', "base_link", rospy.Time(0), rospy.Duration(0.5))
#         ps_map = tf2_geometry_msgs.do_transform_pose(ps_base, transform)
#     except (tf2_ros.LookupException, tf2_ros.ConnectivityException, tf2_ros.ExtrapolationException) as e:
#         rospy.logwarn("TF Exception: {}".format(e))
#         err_count+=1
#         return

#     car_state_msg["map_x"]=ps_map.pose.position.x
#     car_state_msg["map_y"]=ps_map.pose.position.y
#     car_state_msg["heading"]=getYawfromOrientation(ps_map.pose.orientation)*180/math.pi

def carmarker_callback(msg): 
    car_state_msg["map_x"]=msg.pose.position.x
    car_state_msg["map_y"]=msg.pose.position.y
    car_state_msg["heading"]=getYawfromOrientation(msg.pose.orientation)*180/math.pi


def getpathpoint(msg)->path_point:
    point=path_point()
    if "vehSpeed" in msg.keys(): point.vehSpeed = msg["vehSpeed"]
    if "pointX" in msg.keys(): point.pointX = msg["pointX"]
    if "pointY" in msg.keys(): point.pointY = msg["pointY"]
    if "pointHA" in msg.keys(): point.pointHA = msg["pointHA"]
    if "lane_type" in msg.keys(): point.lane_type = msg["lane_type"]
    return point

def getpathpoint(msg)->PoseStamped:
    point=PoseStamped()
    point.pose.position.z=0
    if "x" in msg.keys(): point.pose.position.x = msg["x"]
    if "y" in msg.keys(): point.pose.position.y = msg["y"]
    if "yaw" in msg.keys(): 
        quat = tf.transformations.quaternion_from_euler(0.0, 0.0, msg["yaw"]*math.pi/180)
        orientation=Quaternion()
        orientation.x=quat[0]; orientation.y=quat[1]; orientation.z=quat[2]; orientation.w=quat[3]
        # print(orientation)
        point.pose.orientation=orientation
    
    return point

def on_message(client, userdata, msg:mqtt_client.MQTTMessage):
    # print(msg.topic)
    message = msg.payload.decode("utf-8")
    try:
        if msg.topic=="/agv_cmd":
            json_data = json.loads(message)
            ros_msg=task()
            if "id" not in json_data.keys() or json_data["id"]!=che_id : return

            if "cmd" in json_data.keys(): ros_msg.cmd = json_data["cmd"]
            if "subcmd" in json_data.keys(): ros_msg.subcmd = json_data["subcmd"]
            if "final_path" in json_data.keys(): ros_msg.final_path = json_data["final_path"]
            if "path" in json_data.keys():
                points=json_data["path"]
                for p in points: ros_msg.poses.append(getpathpoint(p))
            # task_pub.publish(ros_msg)

        elif msg.topic=="/system_cmd":
            json_data = json.loads(message)
            ros_msg=Int32()
            if "id" not in json_data.keys() or (json_data["id"]!=che_id and json_data["id"]!="") : return

            if "data" in json_data.keys(): ros_msg.data = json_data["data"]
            system_pub.publish(ros_msg) 

        elif msg.topic=="/agv_state":
            json_data = json.loads(message)
            ros_msg=Path()
            ros_msg.header.stamp=rospy.Time.now()
            ros_msg.header.frame_id="map"
            if "id" in json_data.keys() : 
                id=int(json_data["id"][3:100])-1
                if id>=agv_num-1: id=agv_num-1
                points=json_data["path"]
                # print(len(points))
                pose=PoseStamped()
                for p in points: 
                    pose=getpathpoint(p)
                    pose.header=ros_msg.header
                    ros_msg.poses.append(pose)
                allagv_path_pubs[id].publish(ros_msg)      
            
            
    except ValueError as e:
        rospy.logerr("Failed to parse MQTT message as JSON: %s", str(e))

   

def connect_mqtt():
    def on_connect(client, userdata, flags, rc):
        if rc == 0:
            print("Connected to MQTT Broker!\n")
        else:
            print("Failed to connect, return code %d\n", rc)
 
    client_id = f'python-mqtt-{random.randint(0, 1000)}' 
    broker = '128.128.2.15'
    port = 1883
    
    global client
    client = mqtt_client.Client(client_id)
    client.on_message = on_message
    client.on_connect = on_connect
    client.connect(broker, port)
    client.subscribe("/agv_cmd")
    client.subscribe("/system_cmd")
    client.subscribe("/agv_state")
     
 
def publish():
    msg= json.dumps(car_state_msg)
    client.publish("/agv_state", msg)
    # print(msg)

def timer_callback(event):
    publish()
    
def run():
    rospy.init_node('mqtt_to_ros')
    rospy.Subscriber('/car_marker', Marker, carmarker_callback)
    rospy.Subscriber('/can_comm/car_state', car_state, car_state_callback)
    rospy.Subscriber('/local_path_plan/taskpath', Path, taskpath_callback)
    global task_pub, system_pub, allagv_path_pubs
    task_pub = rospy.Publisher('/task_cmd', task, queue_size=10)
    system_pub = rospy.Publisher('/system_update', Int32, queue_size=10)
    allagv_path_pubs=[]
    for i in range(agv_num):
        allagv_path_pubs.append(rospy.Publisher(f'/agv_path{i+1}', Path, queue_size=10))
    
    connect_mqtt()
    client.loop_start()

    rate = rospy.Rate(0.4)  # 每秒钟触发一次定时器回调函数
    rospy.Timer(rospy.Duration(1.0/rate.sleep_dur.to_sec()), timer_callback)
    # rospy.spin()
    while err_count<2:
        # print(err_count)
        time.sleep(1)

    client.loop_stop()
    client.disconnect()
 
 
if __name__ == '__main__':
    run()