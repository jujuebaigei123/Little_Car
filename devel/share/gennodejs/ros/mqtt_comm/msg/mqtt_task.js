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

class mqtt_task {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.msgType = null;
      this.timestamp = null;
      this.taskId = null;
      this.pathId = null;
      this.workIds = null;
    }
    else {
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
      if (initObj.hasOwnProperty('taskId')) {
        this.taskId = initObj.taskId
      }
      else {
        this.taskId = '';
      }
      if (initObj.hasOwnProperty('pathId')) {
        this.pathId = initObj.pathId
      }
      else {
        this.pathId = '';
      }
      if (initObj.hasOwnProperty('workIds')) {
        this.workIds = initObj.workIds
      }
      else {
        this.workIds = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type mqtt_task
    // Serialize message field [msgType]
    bufferOffset = _serializer.string(obj.msgType, buffer, bufferOffset);
    // Serialize message field [timestamp]
    bufferOffset = _serializer.int64(obj.timestamp, buffer, bufferOffset);
    // Serialize message field [taskId]
    bufferOffset = _serializer.string(obj.taskId, buffer, bufferOffset);
    // Serialize message field [pathId]
    bufferOffset = _serializer.string(obj.pathId, buffer, bufferOffset);
    // Serialize message field [workIds]
    bufferOffset = _serializer.string(obj.workIds, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type mqtt_task
    let len;
    let data = new mqtt_task(null);
    // Deserialize message field [msgType]
    data.msgType = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [timestamp]
    data.timestamp = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [taskId]
    data.taskId = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [pathId]
    data.pathId = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [workIds]
    data.workIds = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.msgType);
    length += _getByteLength(object.taskId);
    length += _getByteLength(object.pathId);
    length += _getByteLength(object.workIds);
    return length + 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mqtt_comm/mqtt_task';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5572e97389f79226a529e1c9cb1b09e6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string msgType
    int64 timestamp
    string taskId
    string pathId
    string workIds
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new mqtt_task(null);
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

    if (msg.taskId !== undefined) {
      resolved.taskId = msg.taskId;
    }
    else {
      resolved.taskId = ''
    }

    if (msg.pathId !== undefined) {
      resolved.pathId = msg.pathId;
    }
    else {
      resolved.pathId = ''
    }

    if (msg.workIds !== undefined) {
      resolved.workIds = msg.workIds;
    }
    else {
      resolved.workIds = ''
    }

    return resolved;
    }
};

module.exports = mqtt_task;
