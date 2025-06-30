// Auto-generated. Do not edit!

// (in-package mqtt_commx.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let act_status = require('./act_status.js');

//-----------------------------------------------------------

class iot_act_status {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.all_status = null;
      this.timestamp = null;
    }
    else {
      if (initObj.hasOwnProperty('all_status')) {
        this.all_status = initObj.all_status
      }
      else {
        this.all_status = [];
      }
      if (initObj.hasOwnProperty('timestamp')) {
        this.timestamp = initObj.timestamp
      }
      else {
        this.timestamp = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type iot_act_status
    // Serialize message field [all_status]
    // Serialize the length for message field [all_status]
    bufferOffset = _serializer.uint32(obj.all_status.length, buffer, bufferOffset);
    obj.all_status.forEach((val) => {
      bufferOffset = act_status.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [timestamp]
    bufferOffset = _serializer.int64(obj.timestamp, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type iot_act_status
    let len;
    let data = new iot_act_status(null);
    // Deserialize message field [all_status]
    // Deserialize array length for message field [all_status]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.all_status = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.all_status[i] = act_status.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [timestamp]
    data.timestamp = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.all_status.forEach((val) => {
      length += act_status.getMessageSize(val);
    });
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mqtt_commx/iot_act_status';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cd9100d9e84b9bf263922df0a9c28149';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    act_status[]  all_status
    int64 timestamp
    ================================================================================
    MSG: mqtt_commx/act_status
    cmd_Header header
    Point point
    fault_info[]  faults
    
    int64 act_type
    int64 chassis_total_hour
    float64 distance_to_target
    int64 drv_direction
    bool empty
    bool estop
    int64 firm_error_status
    int64 frame_ts
    int64 gear
    bool in_high_voltage    # 取车状态
    bool is_charging
    int64 mileage
    int64 motion_mode
    string navi_id
    int64 operational_status
    int64 platform_state
    int64 soc
    int64 soh
    float64 speed
    int64 state_flow
    string sub_target
    string target
    string task_id
    int64 task_mode
    int64 task_type
    int64 turn_light
    int64 vehicle_error_status
    string vin
    
    ================================================================================
    MSG: mqtt_commx/cmd_Header
    string trace_id
    string trans_id
    string che_id
    string timestamp
    string version
    ================================================================================
    MSG: mqtt_commx/Point
    float64 x
    float64 y
    float64 yaw
    float64 z
    
    ================================================================================
    MSG: mqtt_commx/fault_info
    string desc
    int64 code
    int32 level
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new iot_act_status(null);
    if (msg.all_status !== undefined) {
      resolved.all_status = new Array(msg.all_status.length);
      for (let i = 0; i < resolved.all_status.length; ++i) {
        resolved.all_status[i] = act_status.Resolve(msg.all_status[i]);
      }
    }
    else {
      resolved.all_status = []
    }

    if (msg.timestamp !== undefined) {
      resolved.timestamp = msg.timestamp;
    }
    else {
      resolved.timestamp = 0
    }

    return resolved;
    }
};

module.exports = iot_act_status;
