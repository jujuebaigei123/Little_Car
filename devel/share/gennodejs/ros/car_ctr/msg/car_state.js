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

class car_state {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.enable = null;
      this.ctrmode = null;
      this.turnmode = null;
      this.speed = null;
      this.errcode = null;
    }
    else {
      if (initObj.hasOwnProperty('enable')) {
        this.enable = initObj.enable
      }
      else {
        this.enable = false;
      }
      if (initObj.hasOwnProperty('ctrmode')) {
        this.ctrmode = initObj.ctrmode
      }
      else {
        this.ctrmode = 0;
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
        this.speed = new Array(4).fill(0);
      }
      if (initObj.hasOwnProperty('errcode')) {
        this.errcode = initObj.errcode
      }
      else {
        this.errcode = new Array(8).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type car_state
    // Serialize message field [enable]
    bufferOffset = _serializer.bool(obj.enable, buffer, bufferOffset);
    // Serialize message field [ctrmode]
    bufferOffset = _serializer.int32(obj.ctrmode, buffer, bufferOffset);
    // Serialize message field [turnmode]
    bufferOffset = _serializer.int32(obj.turnmode, buffer, bufferOffset);
    // Check that the constant length array field [speed] has the right length
    if (obj.speed.length !== 4) {
      throw new Error('Unable to serialize array field speed - length must be 4')
    }
    // Serialize message field [speed]
    bufferOffset = _arraySerializer.float32(obj.speed, buffer, bufferOffset, 4);
    // Check that the constant length array field [errcode] has the right length
    if (obj.errcode.length !== 8) {
      throw new Error('Unable to serialize array field errcode - length must be 8')
    }
    // Serialize message field [errcode]
    bufferOffset = _arraySerializer.int32(obj.errcode, buffer, bufferOffset, 8);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type car_state
    let len;
    let data = new car_state(null);
    // Deserialize message field [enable]
    data.enable = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [ctrmode]
    data.ctrmode = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [turnmode]
    data.turnmode = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [speed]
    data.speed = _arrayDeserializer.float32(buffer, bufferOffset, 4)
    // Deserialize message field [errcode]
    data.errcode = _arrayDeserializer.int32(buffer, bufferOffset, 8)
    return data;
  }

  static getMessageSize(object) {
    return 57;
  }

  static datatype() {
    // Returns string type for a message object
    return 'car_ctr/car_state';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cb22e40eb79ad4fa4ade5e4b0b7218d3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool enable
    int32 ctrmode
    int32 turnmode    # 0-阿克曼  1-差速模式  2-自转模式  3-横移模式  4-斜行    
    float32[4] speed
    int32[8] errcode
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new car_state(null);
    if (msg.enable !== undefined) {
      resolved.enable = msg.enable;
    }
    else {
      resolved.enable = false
    }

    if (msg.ctrmode !== undefined) {
      resolved.ctrmode = msg.ctrmode;
    }
    else {
      resolved.ctrmode = 0
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
      resolved.speed = new Array(4).fill(0)
    }

    if (msg.errcode !== undefined) {
      resolved.errcode = msg.errcode;
    }
    else {
      resolved.errcode = new Array(8).fill(0)
    }

    return resolved;
    }
};

module.exports = car_state;
