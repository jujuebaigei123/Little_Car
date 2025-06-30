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

class fault_info {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.desc = null;
      this.code = null;
      this.level = null;
    }
    else {
      if (initObj.hasOwnProperty('desc')) {
        this.desc = initObj.desc
      }
      else {
        this.desc = '';
      }
      if (initObj.hasOwnProperty('code')) {
        this.code = initObj.code
      }
      else {
        this.code = 0;
      }
      if (initObj.hasOwnProperty('level')) {
        this.level = initObj.level
      }
      else {
        this.level = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type fault_info
    // Serialize message field [desc]
    bufferOffset = _serializer.string(obj.desc, buffer, bufferOffset);
    // Serialize message field [code]
    bufferOffset = _serializer.int64(obj.code, buffer, bufferOffset);
    // Serialize message field [level]
    bufferOffset = _serializer.int32(obj.level, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type fault_info
    let len;
    let data = new fault_info(null);
    // Deserialize message field [desc]
    data.desc = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [code]
    data.code = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [level]
    data.level = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.desc);
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mqtt_commx/fault_info';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '95e3250e1d1ef52a3c756cce9a37436a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new fault_info(null);
    if (msg.desc !== undefined) {
      resolved.desc = msg.desc;
    }
    else {
      resolved.desc = ''
    }

    if (msg.code !== undefined) {
      resolved.code = msg.code;
    }
    else {
      resolved.code = 0
    }

    if (msg.level !== undefined) {
      resolved.level = msg.level;
    }
    else {
      resolved.level = 0
    }

    return resolved;
    }
};

module.exports = fault_info;
