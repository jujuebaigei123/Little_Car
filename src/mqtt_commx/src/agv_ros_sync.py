#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# Date: 2024/7/17

import logging
import time, math

import paho.mqtt.client as mqtt
import rospy
from std_msgs.msg import String
from mqtt_comm.msg import (
    iot_act_status,
    act_status,
    fault_info,
    Point,
    cmd_Header,
)
import json

# MQTT连接参数
mqtt_broker = "172.200.1.21"
mqtt_port = 1883
mqtt_topic = "from/v1/devicedata/status/request/+"

rospy.init_node('mqtt_to_ros_publisher')
pub = rospy.Publisher('/iot_act_status', iot_act_status, queue_size=10)

vehicle_dict: dict = {}

utmx_zero=rospy.get_param('/gps_base/utmx_zero', 0)
utmy_zero=rospy.get_param('/gps_base/utmy_zero', 0)

def on_message(client, userdata, msg: mqtt.MQTTMessage):
    message = msg.payload.decode("utf-8")
    # rospy.loginfo("Received MQTT message: %s", message)
    try:
        json_data = json.loads(message)
        vehicle_dict[msg.topic.split('/')[-1]] = json_data
    except ValueError as e:
        rospy.logerr("Failed to parse MQTT message as JSON: %s", str(e))
        logging.exception(e)


def _fault_json_to_rosmsg(data) -> []:
    if "faults" in data.keys():
        faults = []
        for fault_dict in data["faults"]:
            fault = fault_info()
            fault.code = int(fault_dict["code"])
            fault.desc = fault_dict["desc"]
            faults.append(fault)
        return faults
    else:
        return []


def _point_json_to_rosmsg(data) -> Point:
    point = Point()
    point.x = data["point"]["x"]
    point.y = data["point"]["y"]
    point.yaw = data["point"]["yaw"]
    point.z = data["point"]["z"]

    point.x -= utmx_zero
    point.y -= utmy_zero
    point.yaw *=180/math.pi
    if point.yaw>=180:  
        point.yaw-=360
    elif point.yaw<-180:
        point.yaw+=360

    # rospy.loginfo(point)
    return point


def _header_json_to_rosmsg(data) -> cmd_Header:
    header = cmd_Header()
    if "header" in data.keys():
        header = cmd_Header()
        if "trace_id" in data["header"]:
            header.trace_id = data["header"]["trace_id"]
        if "trans_id" in data["header"]:
            header.trans_id = data["header"]["trans_id"]
        if "che_id" in data["header"]:
            header.che_id = data["header"]["che_id"]
        if "timestamp" in data["header"]:
            header.timestamp = str(data["header"]["timestamp"])
        if "version" in data["header"]:
            header.version = data["header"]["version"]
    return header


def _pub_iot_status_to_ros():
    contents = list(vehicle_dict.values())
    iot_status_msg = iot_act_status()
    iot_status_msg.all_status = []
    for data_req in contents:
        msg = act_status()

        # #####################
        # header
        # #####################
        msg.header = _header_json_to_rosmsg(data_req)

        # #####################
        # faults
        # #####################
        msg.faults = _fault_json_to_rosmsg(data_req)

        # #####################
        # faults
        # #####################
        msg.point = _point_json_to_rosmsg(data_req)

        # #####################
        # task info
        # #####################
        if "task_id" in data_req.keys(): msg.task_id = data_req["task_id"]
        if "task_mode" in data_req.keys(): msg.task_mode = data_req["task_mode"]
        if "task_type" in data_req.keys(): msg.task_type = data_req["task_type"]
        if "act_type" in data_req.keys(): msg.act_type = data_req["act_type"]
        if "motion_mode" in data_req.keys(): msg.motion_mode = data_req["motion_mode"]
        if "operational_status" in data_req.keys(): msg.operational_status = data_req["operational_status"]
        if "vin" in data_req.keys(): msg.vin = data_req["vin"]
        if "chassis_total_hour" in data_req.keys(): msg.chassis_total_hour = data_req["chassis_total_hour"]
        if "distance_to_target" in data_req.keys(): msg.distance_to_target = data_req["distance_to_target"]
        if "drv_direction" in data_req.keys(): msg.drv_direction = data_req["drv_direction"]
        if "empty" in data_req.keys(): msg.empty = data_req["empty"]
        if "estop" in data_req.keys(): msg.estop = data_req["estop"]
        if "firm_error_status" in data_req.keys(): msg.firm_error_status = data_req["firm_error_status"]
        if "frame_ts" in data_req.keys(): msg.frame_ts = data_req["frame_ts"]
        if "gear" in data_req.keys(): msg.gear = data_req["gear"]
        if "in_high_voltage" in data_req.keys(): msg.in_high_voltage = data_req["in_high_voltage"]
        if "is_charging" in data_req.keys(): msg.is_charging = data_req["is_charging"]
        if "mileage" in data_req.keys(): msg.mileage = data_req["mileage"]
        if "navi_id" in data_req.keys(): msg.navi_id = data_req["navi_id"]
        if "platform_state" in data_req.keys(): msg.platform_state = data_req["platform_state"]
        if "soc" in data_req.keys(): msg.soc = data_req["soc"]
        if "soh" in data_req.keys(): msg.soh = data_req["soh"]
        if "speed" in data_req.keys(): msg.speed = data_req["speed"]
        if "state_flow" in data_req.keys(): msg.state_flow = data_req["state_flow"]
        if "sub_target" in data_req.keys(): msg.sub_target = data_req["sub_target"]
        if "target" in data_req.keys(): msg.target = data_req["target"]
        if "turn_light" in data_req.keys(): msg.turn_light = data_req["turn_light"]
        if "vehicle_error_status" in data_req.keys(): msg.vehicle_error_status = data_req["vehicle_error_status"]
        
        if not (len(msg.faults)>=5 and abs(msg.speed)<0.1):
            iot_status_msg.all_status.append(msg)
        # if msg.header.che_id=='A014':
        #     rospy.loginfo(msg.point)

    iot_status_msg.timestamp = int(time.time())
    # rospy.loginfo(f"Send:{iot_status_msg}")

    return iot_status_msg

   
def timer_callback(event):
    iot_act_status=_pub_iot_status_to_ros()
    pub.publish(iot_act_status)
    # rospy.loginfo(f"Send:{vehicle_dict}")


client = mqtt.Client()

client.on_message = on_message

client.connect(mqtt_broker, mqtt_port, 60)

client.subscribe(mqtt_topic)

client.loop_start()

# 设置定时器，每隔一定时间触发回调函数
rate = rospy.Rate(0.2)  # 每秒钟触发一次定时器回调函数
rospy.Timer(rospy.Duration(1.0 / rate.sleep_dur.to_sec()), timer_callback)

rospy.spin()
client.loop_stop()
client.disconnect()
