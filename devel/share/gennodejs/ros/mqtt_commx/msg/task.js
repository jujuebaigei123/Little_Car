// Auto-generated. Do not edit!

// (in-package mqtt_commx.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let path_point = require('./path_point.js');

//-----------------------------------------------------------

class task {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.stamp = null;
      this.cmd = null;
      this.subcmd = null;
      this.path = null;
      this.final_path = null;
      this.task_id = null;
    }
    else {
      if (initObj.hasOwnProperty('stamp')) {
        this.stamp = initObj.stamp
      }
      else {
        this.stamp = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('cmd')) {
        this.cmd = initObj.cmd
      }
      else {
        this.cmd = '';
      }
      if (initObj.hasOwnProperty('subcmd')) {
        this.subcmd = initObj.subcmd
      }
      else {
        this.subcmd = '';
      }
      if (initObj.hasOwnProperty('path')) {
        this.path = initObj.path
      }
      else {
        this.path = [];
      }
      if (initObj.hasOwnProperty('final_path')) {
        this.final_path = initObj.final_path
      }
      else {
        this.final_path = false;
      }
      if (initObj.hasOwnProperty('task_id')) {
        this.task_id = initObj.task_id
      }
      else {
        this.task_id = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type task
    // Serialize message field [stamp]
    bufferOffset = _serializer.time(obj.stamp, buffer, bufferOffset);
    // Serialize message field [cmd]
    bufferOffset = _serializer.string(obj.cmd, buffer, bufferOffset);
    // Serialize message field [subcmd]
    bufferOffset = _serializer.string(obj.subcmd, buffer, bufferOffset);
    // Serialize message field [path]
    // Serialize the length for message field [path]
    bufferOffset = _serializer.uint32(obj.path.length, buffer, bufferOffset);
    obj.path.forEach((val) => {
      bufferOffset = path_point.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [final_path]
    bufferOffset = _serializer.bool(obj.final_path, buffer, bufferOffset);
    // Serialize message field [task_id]
    bufferOffset = _serializer.string(obj.task_id, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type task
    let len;
    let data = new task(null);
    // Deserialize message field [stamp]
    data.stamp = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [cmd]
    data.cmd = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [subcmd]
    data.subcmd = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [path]
    // Deserialize array length for message field [path]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.path = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.path[i] = path_point.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [final_path]
    data.final_path = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [task_id]
    data.task_id = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.cmd);
    length += _getByteLength(object.subcmd);
    length += 28 * object.path.length;
    length += _getByteLength(object.task_id);
    return length + 25;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mqtt_commx/task';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bde58ca2fd96754ea94604b71e597ab7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    time stamp         #时间戳
    string cmd         #任务
    string subcmd      #交通信号灯、控制状态
    path_point[] path  #路径
    bool final_path
    string task_id
    
    
    
    ================================================================================
    MSG: mqtt_commx/path_point
    float32 vehSpeed
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
    const resolved = new task(null);
    if (msg.stamp !== undefined) {
      resolved.stamp = msg.stamp;
    }
    else {
      resolved.stamp = {secs: 0, nsecs: 0}
    }

    if (msg.cmd !== undefined) {
      resolved.cmd = msg.cmd;
    }
    else {
      resolved.cmd = ''
    }

    if (msg.subcmd !== undefined) {
      resolved.subcmd = msg.subcmd;
    }
    else {
      resolved.subcmd = ''
    }

    if (msg.path !== undefined) {
      resolved.path = new Array(msg.path.length);
      for (let i = 0; i < resolved.path.length; ++i) {
        resolved.path[i] = path_point.Resolve(msg.path[i]);
      }
    }
    else {
      resolved.path = []
    }

    if (msg.final_path !== undefined) {
      resolved.final_path = msg.final_path;
    }
    else {
      resolved.final_path = false
    }

    if (msg.task_id !== undefined) {
      resolved.task_id = msg.task_id;
    }
    else {
      resolved.task_id = ''
    }

    return resolved;
    }
};

module.exports = task;
