// Auto-generated. Do not edit!

// (in-package mqtt_commx.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let fault_info = require('./fault_info.js');

//-----------------------------------------------------------

class fault_info_array {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.fault_info_data = null;
      this.timestamp = null;
    }
    else {
      if (initObj.hasOwnProperty('fault_info_data')) {
        this.fault_info_data = initObj.fault_info_data
      }
      else {
        this.fault_info_data = [];
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
    // Serializes a message object of type fault_info_array
    // Serialize message field [fault_info_data]
    // Serialize the length for message field [fault_info_data]
    bufferOffset = _serializer.uint32(obj.fault_info_data.length, buffer, bufferOffset);
    obj.fault_info_data.forEach((val) => {
      bufferOffset = fault_info.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [timestamp]
    bufferOffset = _serializer.int64(obj.timestamp, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type fault_info_array
    let len;
    let data = new fault_info_array(null);
    // Deserialize message field [fault_info_data]
    // Deserialize array length for message field [fault_info_data]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.fault_info_data = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.fault_info_data[i] = fault_info.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [timestamp]
    data.timestamp = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.fault_info_data.forEach((val) => {
      length += fault_info.getMessageSize(val);
    });
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mqtt_commx/fault_info_array';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3b519e6234e93bf86de021428c1d9d96';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    fault_info[] fault_info_data
    int64 timestamp
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
    const resolved = new fault_info_array(null);
    if (msg.fault_info_data !== undefined) {
      resolved.fault_info_data = new Array(msg.fault_info_data.length);
      for (let i = 0; i < resolved.fault_info_data.length; ++i) {
        resolved.fault_info_data[i] = fault_info.Resolve(msg.fault_info_data[i]);
      }
    }
    else {
      resolved.fault_info_data = []
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

module.exports = fault_info_array;
