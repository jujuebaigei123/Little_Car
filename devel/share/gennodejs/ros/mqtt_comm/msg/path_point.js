// Auto-generated. Do not edit!

// (in-package mqtt_comm.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let path_point_action = require('./path_point_action.js');

//-----------------------------------------------------------

class path_point {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.vehSpeed = null;
      this.pointX = null;
      this.pointY = null;
      this.pointHA = null;
      this.actEnable = null;
      this.caption = null;
      this.actions = null;
      this.if_point1 = null;
      this.if_point2 = null;
    }
    else {
      if (initObj.hasOwnProperty('vehSpeed')) {
        this.vehSpeed = initObj.vehSpeed
      }
      else {
        this.vehSpeed = 0.0;
      }
      if (initObj.hasOwnProperty('pointX')) {
        this.pointX = initObj.pointX
      }
      else {
        this.pointX = 0.0;
      }
      if (initObj.hasOwnProperty('pointY')) {
        this.pointY = initObj.pointY
      }
      else {
        this.pointY = 0.0;
      }
      if (initObj.hasOwnProperty('pointHA')) {
        this.pointHA = initObj.pointHA
      }
      else {
        this.pointHA = 0.0;
      }
      if (initObj.hasOwnProperty('actEnable')) {
        this.actEnable = initObj.actEnable
      }
      else {
        this.actEnable = false;
      }
      if (initObj.hasOwnProperty('caption')) {
        this.caption = initObj.caption
      }
      else {
        this.caption = '';
      }
      if (initObj.hasOwnProperty('actions')) {
        this.actions = initObj.actions
      }
      else {
        this.actions = [];
      }
      if (initObj.hasOwnProperty('if_point1')) {
        this.if_point1 = initObj.if_point1
      }
      else {
        this.if_point1 = [];
      }
      if (initObj.hasOwnProperty('if_point2')) {
        this.if_point2 = initObj.if_point2
      }
      else {
        this.if_point2 = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type path_point
    // Serialize message field [vehSpeed]
    bufferOffset = _serializer.float32(obj.vehSpeed, buffer, bufferOffset);
    // Serialize message field [pointX]
    bufferOffset = _serializer.float64(obj.pointX, buffer, bufferOffset);
    // Serialize message field [pointY]
    bufferOffset = _serializer.float64(obj.pointY, buffer, bufferOffset);
    // Serialize message field [pointHA]
    bufferOffset = _serializer.float64(obj.pointHA, buffer, bufferOffset);
    // Serialize message field [actEnable]
    bufferOffset = _serializer.bool(obj.actEnable, buffer, bufferOffset);
    // Serialize message field [caption]
    bufferOffset = _serializer.string(obj.caption, buffer, bufferOffset);
    // Serialize message field [actions]
    // Serialize the length for message field [actions]
    bufferOffset = _serializer.uint32(obj.actions.length, buffer, bufferOffset);
    obj.actions.forEach((val) => {
      bufferOffset = path_point_action.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [if_point1]
    bufferOffset = _arraySerializer.float32(obj.if_point1, buffer, bufferOffset, null);
    // Serialize message field [if_point2]
    bufferOffset = _arraySerializer.float32(obj.if_point2, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type path_point
    let len;
    let data = new path_point(null);
    // Deserialize message field [vehSpeed]
    data.vehSpeed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pointX]
    data.pointX = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pointY]
    data.pointY = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pointHA]
    data.pointHA = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [actEnable]
    data.actEnable = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [caption]
    data.caption = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [actions]
    // Deserialize array length for message field [actions]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.actions = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.actions[i] = path_point_action.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [if_point1]
    data.if_point1 = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [if_point2]
    data.if_point2 = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.caption);
    object.actions.forEach((val) => {
      length += path_point_action.getMessageSize(val);
    });
    length += 4 * object.if_point1.length;
    length += 4 * object.if_point2.length;
    return length + 45;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mqtt_comm/path_point';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8db6d631c8eb6e7558d6959de9b84eeb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new path_point(null);
    if (msg.vehSpeed !== undefined) {
      resolved.vehSpeed = msg.vehSpeed;
    }
    else {
      resolved.vehSpeed = 0.0
    }

    if (msg.pointX !== undefined) {
      resolved.pointX = msg.pointX;
    }
    else {
      resolved.pointX = 0.0
    }

    if (msg.pointY !== undefined) {
      resolved.pointY = msg.pointY;
    }
    else {
      resolved.pointY = 0.0
    }

    if (msg.pointHA !== undefined) {
      resolved.pointHA = msg.pointHA;
    }
    else {
      resolved.pointHA = 0.0
    }

    if (msg.actEnable !== undefined) {
      resolved.actEnable = msg.actEnable;
    }
    else {
      resolved.actEnable = false
    }

    if (msg.caption !== undefined) {
      resolved.caption = msg.caption;
    }
    else {
      resolved.caption = ''
    }

    if (msg.actions !== undefined) {
      resolved.actions = new Array(msg.actions.length);
      for (let i = 0; i < resolved.actions.length; ++i) {
        resolved.actions[i] = path_point_action.Resolve(msg.actions[i]);
      }
    }
    else {
      resolved.actions = []
    }

    if (msg.if_point1 !== undefined) {
      resolved.if_point1 = msg.if_point1;
    }
    else {
      resolved.if_point1 = []
    }

    if (msg.if_point2 !== undefined) {
      resolved.if_point2 = msg.if_point2;
    }
    else {
      resolved.if_point2 = []
    }

    return resolved;
    }
};

module.exports = path_point;
