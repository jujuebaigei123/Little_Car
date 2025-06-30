#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# Date: 2024/7/17

import paho.mqtt.client as mqtt
import rospy, tf
import json
from tf.transformations import euler_from_quaternion
from gps.msg import MyGPS_msg
from std_msgs.msg import Float64
import math
actor = None



actor=rospy.get_param('/simple_pub/actor',None)
print(actor)
msg_dict={"vel": 0, 
          "remainpath": None,
          "passedpath": 0,
          "actor":actor,
          "path_point":{
                    "x":None,
                    "y":None,
                    "heading":None,
                    "vel":None
        }
    }

def gps_callback(msg:MyGPS_msg):
    msg_dict["vel"]=msg.Vel

def remainpath_callback(msg:Float64):
    msg_dict["remainpath"]=msg.data   

def passedpath_callback(msg:Float64):
    msg_dict["passedpath"]=msg.data 
    
rospy.init_node('mqtt_to_ros_publisher')
rospy.Subscriber('/gps_base/GPS_Base', MyGPS_msg, gps_callback)
rospy.Subscriber('/local_path_plan/remainpath', Float64, remainpath_callback)
rospy.Subscriber('/local_path_plan/passedpath', Float64, passedpath_callback)
Car_ID=rospy.get_param('/Car_ID',"Car000")

# MQTT连接参数12
mqtt_broker = rospy.get_param('/broker',"192.168.2.115")
mqtt_port = 1883
mqtt_topic = "wsk/test/"+Car_ID

def on_connect(client, userdata, flags, rc):
    if rc == 0:
        print(Car_ID+" Connected to MQTT Broker!\n")
    else:
        print(Car_ID+" Failed to connect, return code %d\n", rc)

client = mqtt.Client()
client.on_connect = on_connect
client.connect(mqtt_broker, mqtt_port, 60)
client.loop_start()

def get_current_pose():
    """获取当前位姿 (x, y, heading)"""
    listener = tf.TransformListener()
    try:
        # 等待获取 base_link 到 map 的坐标变换信息
        listener.waitForTransform('map', 'base_link', rospy.Time(0), rospy.Duration(0.1))
        (trans, rot) = listener.lookupTransform('map', 'base_link', rospy.Time(0))
        roll, pitch, yaw = euler_from_quaternion(rot)
        return {
            "x": trans[0],
            "y": trans[1],
            "heading": yaw*180/math.pi
        }

    except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException, tf.Exception) as e:
        rospy.logwarn("Failed to get transform: %s", str(e))
        return None  
    
def timer_callback(event):
    msg_dict["id"]=Car_ID
    # 获取当前位姿
    current_pose  = get_current_pose()
    if current_pose is None:
        return
    msg_dict["path_point"]["x"]=current_pose["x"]
    msg_dict["path_point"]["y"]=current_pose["y"]
    msg_dict["path_point"]["heading"]=current_pose["heading"]
    msg_dict["path_point"]["vel"]=msg_dict["vel"]
    msg_json=json.dumps(msg_dict)
    client.publish(mqtt_topic, msg_json)  

# 设置定时器，每隔一定时间触发回调函数
rate = rospy.Rate(0.2)  # 每秒钟触发一次定时器回调函数
rospy.Timer(rospy.Duration(1.0 / rate.sleep_dur.to_sec()), timer_callback)
rospy.spin()

client.loop_stop()
client.disconnect()
