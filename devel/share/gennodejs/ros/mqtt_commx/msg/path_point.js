// Auto-generated. Do not edit!

// (in-package mqtt_commx.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class path_point {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.pointX = null;
      this.pointY = null;
      this.pointHA = null;
      this.vehSpeed = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = '';
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
      if (initObj.hasOwnProperty('vehSpeed')) {
        this.vehSpeed = initObj.vehSpeed
      }
      else {
        this.vehSpeed = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type path_point
    // Serialize message field [id]
    bufferOffset = _serializer.string(obj.id, buffer, bufferOffset);
    // Serialize message field [pointX]
    bufferOffset = _serializer.float64(obj.pointX, buffer, bufferOffset);
    // Serialize message field [pointY]
    bufferOffset = _serializer.float64(obj.pointY, buffer, bufferOffset);
    // Serialize message field [pointHA]
    bufferOffset = _serializer.float64(obj.pointHA, buffer, bufferOffset);
    // Serialize message field [vehSpeed]
    bufferOffset = _serializer.float32(obj.vehSpeed, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type path_point
    let len;
    let data = new path_point(null);
    // Deserialize message field [id]
    data.id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [pointX]
    data.pointX = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pointY]
    data.pointY = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pointHA]
    data.pointHA = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [vehSpeed]
    data.vehSpeed = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.id);
    return length + 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mqtt_commx/path_point';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8408613975c254abac6a9cd9adbad530';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string id
    float64 pointX
    float64 pointY
    float64 pointHA
    float32 vehSpeed
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new path_point(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = ''
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

    if (msg.vehSpeed !== undefined) {
      resolved.vehSpeed = msg.vehSpeed;
    }
    else {
      resolved.vehSpeed = 0.0
    }

    return resolved;
    }
};

module.exports = path_point;
