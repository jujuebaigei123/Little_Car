#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# Date: 2024/7/17

import paho.mqtt.client as mqtt
import rospy, tf
import json
from nav_msgs.msg import Path
from geometry_msgs.msg import PoseStamped, Quaternion
from std_msgs.msg import Float64
from mqtt_commx.msg import path_point
Car_ID=rospy.get_param('/Car_ID',"Car000")
# MQTT连接参数
mqtt_broker = rospy.get_param('/broker',"192.168.2.115")
mqtt_port = 1883
mqtt_topic = "wsk/test/+"
agv_dict={}

def on_message(client, userdata, msg: mqtt.MQTTMessage):
    message = msg.payload.decode("utf-8")
    global agv_dict
    # rospy.loginfo("Received MQTT message: %s", msg.topic)
    try:
        json_data = json.loads(message)
        # print(len(json_data["his_path"]))
        topic_name=msg.topic.split('/')[-1]
        if topic_name=='command':
            rospy.set_param('/pathtrack/run_enable', json_data['enabled'])    
        else: 
            agv_dict[topic_name] = json_data

    except ValueError as e:
        rospy.logerr("Failed to parse MQTT message as JSON: %s", str(e))

def on_connect(client, userdata, flags, rc):
    if rc == 0:
        print(Car_ID+" Connected to MQTT Broker!\n")
    else:
        print(Car_ID+" Failed to connect, return code %d\n", rc)

client = mqtt.Client()
client.on_connect = on_connect
client.on_message = on_message
client.connect(mqtt_broker, mqtt_port, 60)
client.subscribe(mqtt_topic)
client.loop_start()

def timer_callback(event):
    arrive_flag=True

    for key, value in agv_dict.items():
        if value['remainpath'] > 0.005 :
            arrive_flag=False
    rospy.set_param("/arrive_flag", arrive_flag)

    avg_remaintime=0
    avg_taskprogress = 0
    leader_taskprogress=0
    remaintime_count=0
    taskprogress_count = 0
    current_progress=0
    # 路径点信息
    pose = path_point()
    for key, value in agv_dict.items():
        if value['vel']>0.1 and value['remainpath']>0.1:
            # value['vel']=0.1
            avg_remaintime += value['remainpath']/value['vel']
            remaintime_count += 1
        if value['passedpath']>0.1 or value['remainpath']>0.1:
            # print(f'passedpath:{value["passedpath"]},remainpath:{value["remainpath"]}')
            avg_taskprogress += value["passedpath"]/(value["passedpath"]+value["remainpath"])    
            taskprogress_count += 1
            # print(f'taskprogress_count:{taskprogress_count}')
            # print(f"{key}: {value['remainpath']/value['vel']}")
        if value['path_point'] and (value['actor'] == "leader"):
            pose.pointX = value['path_point']['x']
            pose.pointY = value['path_point']['y']
            pose.pointHA = value['path_point']['heading']
            pose.vehSpeed = value['path_point']['vel']
            # print(f"x:{pose.pointX},y:{pose.pointY},ha:{pose.pointHA},vel:{pose.vehSpeed}")

    if remaintime_count>0:
        avg_remaintime /= remaintime_count
    if taskprogress_count > 0:
        avg_taskprogress /= taskprogress_count

    # print(f'leader_progress:{leader_taskprogress}')
    avg_remaintime_pub.publish(avg_remaintime)
    avg_taskprogress_pub.publish(avg_taskprogress)
    pose_pub.publish(pose)
rospy.init_node('mqtt_to_ros_publisher')
path_pub = rospy.Publisher('/'+Car_ID+'/his_path', Path, queue_size=10)   
avg_remaintime_pub = rospy.Publisher('/avg_remaintime', Float64, queue_size=10)      
avg_taskprogress_pub = rospy.Publisher('/avg_taskprogress', Float64, queue_size=10)   
pose_pub = rospy.Publisher('/leader_pose', path_point, queue_size=10)
# 设置定时器，每隔一定时间触发回调函数
rospy.Timer(rospy.Duration(0.2), timer_callback)
rospy.spin()

client.loop_stop()
client.disconnect()
