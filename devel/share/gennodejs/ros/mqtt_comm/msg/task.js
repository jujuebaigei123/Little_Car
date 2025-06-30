// Auto-generated. Do not edit!

// (in-package mqtt_comm.msg)


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
      this.taskId = null;
      this.cmd = null;
      this.subcmd = null;
      this.final_path = null;
      this.only_akm = null;
      this.accordingPathdir = null;
      this.path = null;
    }
    else {
      if (initObj.hasOwnProperty('stamp')) {
        this.stamp = initObj.stamp
      }
      else {
        this.stamp = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('taskId')) {
        this.taskId = initObj.taskId
      }
      else {
        this.taskId = '';
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
      if (initObj.hasOwnProperty('final_path')) {
        this.final_path = initObj.final_path
      }
      else {
        this.final_path = false;
      }
      if (initObj.hasOwnProperty('only_akm')) {
        this.only_akm = initObj.only_akm
      }
      else {
        this.only_akm = false;
      }
      if (initObj.hasOwnProperty('accordingPathdir')) {
        this.accordingPathdir = initObj.accordingPathdir
      }
      else {
        this.accordingPathdir = false;
      }
      if (initObj.hasOwnProperty('path')) {
        this.path = initObj.path
      }
      else {
        this.path = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type task
    // Serialize message field [stamp]
    bufferOffset = _serializer.time(obj.stamp, buffer, bufferOffset);
    // Serialize message field [taskId]
    bufferOffset = _serializer.string(obj.taskId, buffer, bufferOffset);
    // Serialize message field [cmd]
    bufferOffset = _serializer.string(obj.cmd, buffer, bufferOffset);
    // Serialize message field [subcmd]
    bufferOffset = _serializer.string(obj.subcmd, buffer, bufferOffset);
    // Serialize message field [final_path]
    bufferOffset = _serializer.bool(obj.final_path, buffer, bufferOffset);
    // Serialize message field [only_akm]
    bufferOffset = _serializer.bool(obj.only_akm, buffer, bufferOffset);
    // Serialize message field [accordingPathdir]
    bufferOffset = _serializer.bool(obj.accordingPathdir, buffer, bufferOffset);
    // Serialize message field [path]
    // Serialize the length for message field [path]
    bufferOffset = _serializer.uint32(obj.path.length, buffer, bufferOffset);
    obj.path.forEach((val) => {
      bufferOffset = path_point.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type task
    let len;
    let data = new task(null);
    // Deserialize message field [stamp]
    data.stamp = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [taskId]
    data.taskId = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [cmd]
    data.cmd = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [subcmd]
    data.subcmd = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [final_path]
    data.final_path = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [only_akm]
    data.only_akm = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [accordingPathdir]
    data.accordingPathdir = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [path]
    // Deserialize array length for message field [path]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.path = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.path[i] = path_point.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.taskId);
    length += _getByteLength(object.cmd);
    length += _getByteLength(object.subcmd);
    object.path.forEach((val) => {
      length += path_point.getMessageSize(val);
    });
    return length + 27;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mqtt_comm/task';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '56ba4c02399269a508181e421f1e9b96';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    time stamp
    string taskId
    string cmd
    string subcmd
    bool final_path
    bool only_akm
    bool accordingPathdir
    path_point[] path
    
    
    
    ================================================================================
    MSG: mqtt_comm/path_point
    float32 vehSpeed
    float64 pointX
    float64 pointY
    float64 pointHA
    bool actEnable
    string caption
    path_point_action[] actions
    float32[] if_point1
    float32[] if_point2
    
    
    
    ================================================================================
    MSG: mqtt_comm/path_point_action
    string caption
    float32[] params
    
    
    
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

    if (msg.taskId !== undefined) {
      resolved.taskId = msg.taskId;
    }
    else {
      resolved.taskId = ''
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

    if (msg.final_path !== undefined) {
      resolved.final_path = msg.final_path;
    }
    else {
      resolved.final_path = false
    }

    if (msg.only_akm !== undefined) {
      resolved.only_akm = msg.only_akm;
    }
    else {
      resolved.only_akm = false
    }

    if (msg.accordingPathdir !== undefined) {
      resolved.accordingPathdir = msg.accordingPathdir;
    }
    else {
      resolved.accordingPathdir = false
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

    return resolved;
    }
};

module.exports = task;
