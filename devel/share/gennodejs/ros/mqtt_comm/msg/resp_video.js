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

class resp_video {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.agvId = null;
      this.msgType = null;
      this.timestamp = null;
      this.result = null;
    }
    else {
      if (initObj.hasOwnProperty('agvId')) {
        this.agvId = initObj.agvId
      }
      else {
        this.agvId = '';
      }
      if (initObj.hasOwnProperty('msgType')) {
        this.msgType = initObj.msgType
      }
      else {
        this.msgType = '';
      }
      if (initObj.hasOwnProperty('timestamp')) {
        this.timestamp = initObj.timestamp
      }
      else {
        this.timestamp = 0;
      }
      if (initObj.hasOwnProperty('result')) {
        this.result = initObj.result
      }
      else {
        this.result = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type resp_video
    // Serialize message field [agvId]
    bufferOffset = _serializer.string(obj.agvId, buffer, bufferOffset);
    // Serialize message field [msgType]
    bufferOffset = _serializer.string(obj.msgType, buffer, bufferOffset);
    // Serialize message field [timestamp]
    bufferOffset = _serializer.int64(obj.timestamp, buffer, bufferOffset);
    // Serialize message field [result]
    bufferOffset = _serializer.int32(obj.result, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type resp_video
    let len;
    let data = new resp_video(null);
    // Deserialize message field [agvId]
    data.agvId = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [msgType]
    data.msgType = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [timestamp]
    data.timestamp = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [result]
    data.result = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.agvId);
    length += _getByteLength(object.msgType);
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mqtt_comm/resp_video';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a8df69503833d0a76a10ba40c1b67964';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string agvId 
    string msgType
    int64 timestamp
    int32 result 
    
    
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new resp_video(null);
    if (msg.agvId !== undefined) {
      resolved.agvId = msg.agvId;
    }
    else {
      resolved.agvId = ''
    }

    if (msg.msgType !== undefined) {
      resolved.msgType = msg.msgType;
    }
    else {
      resolved.msgType = ''
    }

    if (msg.timestamp !== undefined) {
      resolved.timestamp = msg.timestamp;
    }
    else {
      resolved.timestamp = 0
    }

    if (msg.result !== undefined) {
      resolved.result = msg.result;
    }
    else {
      resolved.result = 0
    }

    return resolved;
    }
};

module.exports = resp_video;
