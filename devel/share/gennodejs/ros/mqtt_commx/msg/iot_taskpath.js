// Auto-generated. Do not edit!

// (in-package mqtt_commx.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let cmd_Header = require('./cmd_Header.js');
let iot_path_point = require('./iot_path_point.js');

//-----------------------------------------------------------

class iot_taskpath {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.taskId = null;
      this.navi_id = null;
      this.seq_num = null;
      this.route_direction = null;
      this.dest_type = null;
      this.path = null;
      this.route_update = null;
      this.is_final_navi = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new cmd_Header();
      }
      if (initObj.hasOwnProperty('taskId')) {
        this.taskId = initObj.taskId
      }
      else {
        this.taskId = '';
      }
      if (initObj.hasOwnProperty('navi_id')) {
        this.navi_id = initObj.navi_id
      }
      else {
        this.navi_id = '';
      }
      if (initObj.hasOwnProperty('seq_num')) {
        this.seq_num = initObj.seq_num
      }
      else {
        this.seq_num = 0;
      }
      if (initObj.hasOwnProperty('route_direction')) {
        this.route_direction = initObj.route_direction
      }
      else {
        this.route_direction = 0;
      }
      if (initObj.hasOwnProperty('dest_type')) {
        this.dest_type = initObj.dest_type
      }
      else {
        this.dest_type = 0;
      }
      if (initObj.hasOwnProperty('path')) {
        this.path = initObj.path
      }
      else {
        this.path = [];
      }
      if (initObj.hasOwnProperty('route_update')) {
        this.route_update = initObj.route_update
      }
      else {
        this.route_update = false;
      }
      if (initObj.hasOwnProperty('is_final_navi')) {
        this.is_final_navi = initObj.is_final_navi
      }
      else {
        this.is_final_navi = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type iot_taskpath
    // Serialize message field [header]
    bufferOffset = cmd_Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [taskId]
    bufferOffset = _serializer.string(obj.taskId, buffer, bufferOffset);
    // Serialize message field [navi_id]
    bufferOffset = _serializer.string(obj.navi_id, buffer, bufferOffset);
    // Serialize message field [seq_num]
    bufferOffset = _serializer.int32(obj.seq_num, buffer, bufferOffset);
    // Serialize message field [route_direction]
    bufferOffset = _serializer.int32(obj.route_direction, buffer, bufferOffset);
    // Serialize message field [dest_type]
    bufferOffset = _serializer.int32(obj.dest_type, buffer, bufferOffset);
    // Serialize message field [path]
    // Serialize the length for message field [path]
    bufferOffset = _serializer.uint32(obj.path.length, buffer, bufferOffset);
    obj.path.forEach((val) => {
      bufferOffset = iot_path_point.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [route_update]
    bufferOffset = _serializer.bool(obj.route_update, buffer, bufferOffset);
    // Serialize message field [is_final_navi]
    bufferOffset = _serializer.bool(obj.is_final_navi, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type iot_taskpath
    let len;
    let data = new iot_taskpath(null);
    // Deserialize message field [header]
    data.header = cmd_Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [taskId]
    data.taskId = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [navi_id]
    data.navi_id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [seq_num]
    data.seq_num = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [route_direction]
    data.route_direction = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [dest_type]
    data.dest_type = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [path]
    // Deserialize array length for message field [path]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.path = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.path[i] = iot_path_point.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [route_update]
    data.route_update = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [is_final_navi]
    data.is_final_navi = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += cmd_Header.getMessageSize(object.header);
    length += _getByteLength(object.taskId);
    length += _getByteLength(object.navi_id);
    object.path.forEach((val) => {
      length += iot_path_point.getMessageSize(val);
    });
    return length + 26;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mqtt_commx/iot_taskpath';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b090287600ee4263cb79e16674b501c4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    cmd_Header header
    
    #task
    string taskId             #作业任务的id
    string navi_id            #导航任务编号
    int32 seq_num             #顺序号
    int32 route_direction     #路径方向
    int32 dest_type           #目的地类型
    iot_path_point[] path         #路径
    bool route_update       
    bool is_final_navi
    
    
    
    
    
    
    
    
    
    ================================================================================
    MSG: mqtt_commx/cmd_Header
    string trace_id
    string trans_id
    string che_id
    string timestamp
    string version
    ================================================================================
    MSG: mqtt_commx/iot_path_point
    int32 direction
    int32 type
    int32 driving_direction
    string id
    float32 speed_vmax
    float32 vmax_dev
    int32 lane_type
    
    float64 pointX
    float64 pointY
    float64 pointHA
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new iot_taskpath(null);
    if (msg.header !== undefined) {
      resolved.header = cmd_Header.Resolve(msg.header)
    }
    else {
      resolved.header = new cmd_Header()
    }

    if (msg.taskId !== undefined) {
      resolved.taskId = msg.taskId;
    }
    else {
      resolved.taskId = ''
    }

    if (msg.navi_id !== undefined) {
      resolved.navi_id = msg.navi_id;
    }
    else {
      resolved.navi_id = ''
    }

    if (msg.seq_num !== undefined) {
      resolved.seq_num = msg.seq_num;
    }
    else {
      resolved.seq_num = 0
    }

    if (msg.route_direction !== undefined) {
      resolved.route_direction = msg.route_direction;
    }
    else {
      resolved.route_direction = 0
    }

    if (msg.dest_type !== undefined) {
      resolved.dest_type = msg.dest_type;
    }
    else {
      resolved.dest_type = 0
    }

    if (msg.path !== undefined) {
      resolved.path = new Array(msg.path.length);
      for (let i = 0; i < resolved.path.length; ++i) {
        resolved.path[i] = iot_path_point.Resolve(msg.path[i]);
      }
    }
    else {
      resolved.path = []
    }

    if (msg.route_update !== undefined) {
      resolved.route_update = msg.route_update;
    }
    else {
      resolved.route_update = false
    }

    if (msg.is_final_navi !== undefined) {
      resolved.is_final_navi = msg.is_final_navi;
    }
    else {
      resolved.is_final_navi = false
    }

    return resolved;
    }
};

module.exports = iot_taskpath;
