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

class resp_task {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.msgType = null;
      this.agvId = null;
      this.timestamp = null;
      this.taskId = null;
      this.subTaskIndex = null;
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
      if (initObj.hasOwnProperty('taskId')) {
        this.taskId = initObj.taskId
      }
      else {
        this.taskId = 0;
      }
      if (initObj.hasOwnProperty('subTaskIndex')) {
        this.subTaskIndex = initObj.subTaskIndex
      }
      else {
        this.subTaskIndex = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type resp_task
    // Serialize message field [msgType]
    bufferOffset = _serializer.string(obj.msgType, buffer, bufferOffset);
    // Serialize message field [agvId]
    bufferOffset = _serializer.string(obj.agvId, buffer, bufferOffset);
    // Serialize message field [timestamp]
    bufferOffset = _serializer.int64(obj.timestamp, buffer, bufferOffset);
    // Serialize message field [taskId]
    bufferOffset = _serializer.int32(obj.taskId, buffer, bufferOffset);
    // Serialize message field [subTaskIndex]
    bufferOffset = _serializer.int32(obj.subTaskIndex, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type resp_task
    let len;
    let data = new resp_task(null);
    // Deserialize message field [msgType]
    data.msgType = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [agvId]
    data.agvId = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [timestamp]
    data.timestamp = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [taskId]
    data.taskId = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [subTaskIndex]
    data.subTaskIndex = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.msgType);
    length += _getByteLength(object.agvId);
    return length + 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mqtt_comm/resp_task';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f2056e3d4cb90d20081cfa1340bb02a1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string msgType
    string agvId
    int64 timestamp
    # recvtask_value value
    int32 taskId
    int32 subTaskIndex
    
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new resp_task(null);
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

    if (msg.taskId !== undefined) {
      resolved.taskId = msg.taskId;
    }
    else {
      resolved.taskId = 0
    }

    if (msg.subTaskIndex !== undefined) {
      resolved.subTaskIndex = msg.subTaskIndex;
    }
    else {
      resolved.subTaskIndex = 0
    }

    return resolved;
    }
};

module.exports = resp_task;
