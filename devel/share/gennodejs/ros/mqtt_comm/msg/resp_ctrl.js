// Auto-generated. Do not edit!

// (in-package mqtt_comm.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class resp_ctrl {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.msgType = null;
      this.agvId = null;
      this.timestamp = null;
      this.cmdId = null;
      this.value = null;
      this.ctrlType = null;
    }
    else {
      if (initObj.hasOwnProperty('msgType')) {
        this.msgType = initObj.msgType
      }
      else {
        this.msgType = '';
      }
      if (initObj.hasOwnProperty('agvId')) {
        this.agvId = initObj.agvId
      }
      else {
        this.agvId = '';
      }
      if (initObj.hasOwnProperty('timestamp')) {
        this.timestamp = initObj.timestamp
      }
      else {
        this.timestamp = 0;
      }
      if (initObj.hasOwnProperty('cmdId')) {
        this.cmdId = initObj.cmdId
      }
      else {
        this.cmdId = 0;
      }
      if (initObj.hasOwnProperty('value')) {
        this.value = initObj.value
      }
      else {
        this.value = 0;
      }
      if (initObj.hasOwnProperty('ctrlType')) {
        this.ctrlType = initObj.ctrlType
      }
      else {
        this.ctrlType = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type resp_ctrl
    // Serialize message field [msgType]
    bufferOffset = _serializer.string(obj.msgType, buffer, bufferOffset);
    // Serialize message field [agvId]
    bufferOffset = _serializer.string(obj.agvId, buffer, bufferOffset);
    // Serialize message field [timestamp]
    bufferOffset = _serializer.int64(obj.timestamp, buffer, bufferOffset);
    // Serialize message field [cmdId]
    bufferOffset = _serializer.int32(obj.cmdId, buffer, bufferOffset);
    // Serialize message field [value]
    bufferOffset = _serializer.int32(obj.value, buffer, bufferOffset);
    // Serialize message field [ctrlType]
    bufferOffset = _serializer.string(obj.ctrlType, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type resp_ctrl
    let len;
    let data = new resp_ctrl(null);
    // Deserialize message field [msgType]
    data.msgType = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [agvId]
    data.agvId = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [timestamp]
    data.timestamp = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [cmdId]
    data.cmdId = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [value]
    data.value = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [ctrlType]
    data.ctrlType = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.msgType);
    length += _getByteLength(object.agvId);
    length += _getByteLength(object.ctrlType);
    return length + 28;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mqtt_comm/resp_ctrl';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2f21ac2d8dc240a3fa431fbec8909886';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string msgType
    string agvId
    int64 timestamp
    int32 cmdId
    int32 value
    string ctrlType
    
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new resp_ctrl(null);
    if (msg.msgType !== undefined) {
      resolved.msgType = msg.msgType;
    }
    else {
      resolved.msgType = ''
    }

    if (msg.agvId !== undefined) {
      resolved.agvId = msg.agvId;
    }
    else {
      resolved.agvId = ''
    }

    if (msg.timestamp !== undefined) {
      resolved.timestamp = msg.timestamp;
    }
    else {
      resolved.timestamp = 0
    }

    if (msg.cmdId !== undefined) {
      resolved.cmdId = msg.cmdId;
    }
    else {
      resolved.cmdId = 0
    }

    if (msg.value !== undefined) {
      resolved.value = msg.value;
    }
    else {
      resolved.value = 0
    }

    if (msg.ctrlType !== undefined) {
      resolved.ctrlType = msg.ctrlType;
    }
    else {
      resolved.ctrlType = ''
    }

    return resolved;
    }
};

module.exports = resp_ctrl;
