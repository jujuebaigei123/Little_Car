// Auto-generated. Do not edit!

// (in-package car_ctr.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class car_ctr {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.enable = null;
      this.turnmode = null;
      this.speed = null;
      this.angle = null;
    }
    else {
      if (initObj.hasOwnProperty('enable')) {
        this.enable = initObj.enable
      }
      else {
        this.enable = 0;
      }
      if (initObj.hasOwnProperty('turnmode')) {
        this.turnmode = initObj.turnmode
      }
      else {
        this.turnmode = 0;
      }
      if (initObj.hasOwnProperty('speed')) {
        this.speed = initObj.speed
      }
      else {
        this.speed = 0.0;
      }
      if (initObj.hasOwnProperty('angle')) {
        this.angle = initObj.angle
      }
      else {
        this.angle = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type car_ctr
    // Serialize message field [enable]
    bufferOffset = _serializer.int32(obj.enable, buffer, bufferOffset);
    // Serialize message field [turnmode]
    bufferOffset = _serializer.int32(obj.turnmode, buffer, bufferOffset);
    // Serialize message field [speed]
    bufferOffset = _serializer.float32(obj.speed, buffer, bufferOffset);
    // Serialize message field [angle]
    bufferOffset = _serializer.float32(obj.angle, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type car_ctr
    let len;
    let data = new car_ctr(null);
    // Deserialize message field [enable]
    data.enable = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [turnmode]
    data.turnmode = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [speed]
    data.speed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [angle]
    data.angle = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'car_ctr/car_ctr';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '730d29df159fab35648f2f22bf88d85e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 enable
    int32 turnmode    #  0-阿克曼    1-斜行  2-横移模式  4-自转模式  x-差速模式  
    float32 speed
    float32 angle
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new car_ctr(null);
    if (msg.enable !== undefined) {
      resolved.enable = msg.enable;
    }
    else {
      resolved.enable = 0
    }

    if (msg.turnmode !== undefined) {
      resolved.turnmode = msg.turnmode;
    }
    else {
      resolved.turnmode = 0
    }

    if (msg.speed !== undefined) {
      resolved.speed = msg.speed;
    }
    else {
      resolved.speed = 0.0
    }

    if (msg.angle !== undefined) {
      resolved.angle = msg.angle;
    }
    else {
      resolved.angle = 0.0
    }

    return resolved;
    }
};

module.exports = car_ctr;
