// Auto-generated. Do not edit!

// (in-package mqtt_commx.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let path_point = require('./path_point.js');

//-----------------------------------------------------------

class controls {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.msgType = null;
      this.agvId = null;
      this.timestamp = null;
      this.taskId = null;
      this.taskType = null;
      this.targetName = null;
      this.targetX = null;
      this.targetY = null;
      this.targetHA = null;
      this.cargoLength = null;
      this.cargoWidth = null;
      this.cargoWeight = null;
      this.cargoId = null;
      this.wheelBase = null;
      this.subtaskCount = null;
      this.subtaskIndex = null;
      this.subtaskAction = null;
      this.pathLength = null;
      this.path = null;
      this.value = null;
      this.channelId = null;
      this.cmd = null;
      this.timeSec = null;
      this.addr = null;
      this.cmdId = null;
      this.ctrlType = null;
      this.stopPosX = null;
      this.stopPosY = null;
      this.stopPosHA = null;
      this.lightStatus = null;
      this.lightType = null;
      this.lightLeftTime = null;
      this.intersectionId = null;
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
      if (initObj.hasOwnProperty('taskType')) {
        this.taskType = initObj.taskType
      }
      else {
        this.taskType = 0;
      }
      if (initObj.hasOwnProperty('targetName')) {
        this.targetName = initObj.targetName
      }
      else {
        this.targetName = '';
      }
      if (initObj.hasOwnProperty('targetX')) {
        this.targetX = initObj.targetX
      }
      else {
        this.targetX = 0.0;
      }
      if (initObj.hasOwnProperty('targetY')) {
        this.targetY = initObj.targetY
      }
      else {
        this.targetY = 0.0;
      }
      if (initObj.hasOwnProperty('targetHA')) {
        this.targetHA = initObj.targetHA
      }
      else {
        this.targetHA = 0.0;
      }
      if (initObj.hasOwnProperty('cargoLength')) {
        this.cargoLength = initObj.cargoLength
      }
      else {
        this.cargoLength = 0.0;
      }
      if (initObj.hasOwnProperty('cargoWidth')) {
        this.cargoWidth = initObj.cargoWidth
      }
      else {
        this.cargoWidth = 0.0;
      }
      if (initObj.hasOwnProperty('cargoWeight')) {
        this.cargoWeight = initObj.cargoWeight
      }
      else {
        this.cargoWeight = 0.0;
      }
      if (initObj.hasOwnProperty('cargoId')) {
        this.cargoId = initObj.cargoId
      }
      else {
        this.cargoId = '';
      }
      if (initObj.hasOwnProperty('wheelBase')) {
        this.wheelBase = initObj.wheelBase
      }
      else {
        this.wheelBase = 0.0;
      }
      if (initObj.hasOwnProperty('subtaskCount')) {
        this.subtaskCount = initObj.subtaskCount
      }
      else {
        this.subtaskCount = 0;
      }
      if (initObj.hasOwnProperty('subtaskIndex')) {
        this.subtaskIndex = initObj.subtaskIndex
      }
      else {
        this.subtaskIndex = 0;
      }
      if (initObj.hasOwnProperty('subtaskAction')) {
        this.subtaskAction = initObj.subtaskAction
      }
      else {
        this.subtaskAction = 0;
      }
      if (initObj.hasOwnProperty('pathLength')) {
        this.pathLength = initObj.pathLength
      }
      else {
        this.pathLength = 0;
      }
      if (initObj.hasOwnProperty('path')) {
        this.path = initObj.path
      }
      else {
        this.path = [];
      }
      if (initObj.hasOwnProperty('value')) {
        this.value = initObj.value
      }
      else {
        this.value = 0;
      }
      if (initObj.hasOwnProperty('channelId')) {
        this.channelId = initObj.channelId
      }
      else {
        this.channelId = 0;
      }
      if (initObj.hasOwnProperty('cmd')) {
        this.cmd = initObj.cmd
      }
      else {
        this.cmd = 0;
      }
      if (initObj.hasOwnProperty('timeSec')) {
        this.timeSec = initObj.timeSec
      }
      else {
        this.timeSec = 0;
      }
      if (initObj.hasOwnProperty('addr')) {
        this.addr = initObj.addr
      }
      else {
        this.addr = '';
      }
      if (initObj.hasOwnProperty('cmdId')) {
        this.cmdId = initObj.cmdId
      }
      else {
        this.cmdId = 0;
      }
      if (initObj.hasOwnProperty('ctrlType')) {
        this.ctrlType = initObj.ctrlType
      }
      else {
        this.ctrlType = '';
      }
      if (initObj.hasOwnProperty('stopPosX')) {
        this.stopPosX = initObj.stopPosX
      }
      else {
        this.stopPosX = 0.0;
      }
      if (initObj.hasOwnProperty('stopPosY')) {
        this.stopPosY = initObj.stopPosY
      }
      else {
        this.stopPosY = 0.0;
      }
      if (initObj.hasOwnProperty('stopPosHA')) {
        this.stopPosHA = initObj.stopPosHA
      }
      else {
        this.stopPosHA = 0.0;
      }
      if (initObj.hasOwnProperty('lightStatus')) {
        this.lightStatus = initObj.lightStatus
      }
      else {
        this.lightStatus = 0;
      }
      if (initObj.hasOwnProperty('lightType')) {
        this.lightType = initObj.lightType
      }
      else {
        this.lightType = 0;
      }
      if (initObj.hasOwnProperty('lightLeftTime')) {
        this.lightLeftTime = initObj.lightLeftTime
      }
      else {
        this.lightLeftTime = 0;
      }
      if (initObj.hasOwnProperty('intersectionId')) {
        this.intersectionId = initObj.intersectionId
      }
      else {
        this.intersectionId = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type controls
    // Serialize message field [msgType]
    bufferOffset = _serializer.string(obj.msgType, buffer, bufferOffset);
    // Serialize message field [agvId]
    bufferOffset = _serializer.string(obj.agvId, buffer, bufferOffset);
    // Serialize message field [timestamp]
    bufferOffset = _serializer.int64(obj.timestamp, buffer, bufferOffset);
    // Serialize message field [taskId]
    bufferOffset = _serializer.int32(obj.taskId, buffer, bufferOffset);
    // Serialize message field [taskType]
    bufferOffset = _serializer.int32(obj.taskType, buffer, bufferOffset);
    // Serialize message field [targetName]
    bufferOffset = _serializer.string(obj.targetName, buffer, bufferOffset);
    // Serialize message field [targetX]
    bufferOffset = _serializer.float64(obj.targetX, buffer, bufferOffset);
    // Serialize message field [targetY]
    bufferOffset = _serializer.float64(obj.targetY, buffer, bufferOffset);
    // Serialize message field [targetHA]
    bufferOffset = _serializer.float64(obj.targetHA, buffer, bufferOffset);
    // Serialize message field [cargoLength]
    bufferOffset = _serializer.float64(obj.cargoLength, buffer, bufferOffset);
    // Serialize message field [cargoWidth]
    bufferOffset = _serializer.float64(obj.cargoWidth, buffer, bufferOffset);
    // Serialize message field [cargoWeight]
    bufferOffset = _serializer.float64(obj.cargoWeight, buffer, bufferOffset);
    // Serialize message field [cargoId]
    bufferOffset = _serializer.string(obj.cargoId, buffer, bufferOffset);
    // Serialize message field [wheelBase]
    bufferOffset = _serializer.float64(obj.wheelBase, buffer, bufferOffset);
    // Serialize message field [subtaskCount]
    bufferOffset = _serializer.int32(obj.subtaskCount, buffer, bufferOffset);
    // Serialize message field [subtaskIndex]
    bufferOffset = _serializer.int32(obj.subtaskIndex, buffer, bufferOffset);
    // Serialize message field [subtaskAction]
    bufferOffset = _serializer.int32(obj.subtaskAction, buffer, bufferOffset);
    // Serialize message field [pathLength]
    bufferOffset = _serializer.int32(obj.pathLength, buffer, bufferOffset);
    // Serialize message field [path]
    // Serialize the length for message field [path]
    bufferOffset = _serializer.uint32(obj.path.length, buffer, bufferOffset);
    obj.path.forEach((val) => {
      bufferOffset = path_point.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [value]
    bufferOffset = _serializer.int32(obj.value, buffer, bufferOffset);
    // Serialize message field [channelId]
    bufferOffset = _serializer.int32(obj.channelId, buffer, bufferOffset);
    // Serialize message field [cmd]
    bufferOffset = _serializer.int32(obj.cmd, buffer, bufferOffset);
    // Serialize message field [timeSec]
    bufferOffset = _serializer.int32(obj.timeSec, buffer, bufferOffset);
    // Serialize message field [addr]
    bufferOffset = _serializer.string(obj.addr, buffer, bufferOffset);
    // Serialize message field [cmdId]
    bufferOffset = _serializer.int32(obj.cmdId, buffer, bufferOffset);
    // Serialize message field [ctrlType]
    bufferOffset = _serializer.string(obj.ctrlType, buffer, bufferOffset);
    // Serialize message field [stopPosX]
    bufferOffset = _serializer.float64(obj.stopPosX, buffer, bufferOffset);
    // Serialize message field [stopPosY]
    bufferOffset = _serializer.float64(obj.stopPosY, buffer, bufferOffset);
    // Serialize message field [stopPosHA]
    bufferOffset = _serializer.float64(obj.stopPosHA, buffer, bufferOffset);
    // Serialize message field [lightStatus]
    bufferOffset = _serializer.int32(obj.lightStatus, buffer, bufferOffset);
    // Serialize message field [lightType]
    bufferOffset = _serializer.int32(obj.lightType, buffer, bufferOffset);
    // Serialize message field [lightLeftTime]
    bufferOffset = _serializer.int32(obj.lightLeftTime, buffer, bufferOffset);
    // Serialize message field [intersectionId]
    bufferOffset = _serializer.int32(obj.intersectionId, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type controls
    let len;
    let data = new controls(null);
    // Deserialize message field [msgType]
    data.msgType = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [agvId]
    data.agvId = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [timestamp]
    data.timestamp = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [taskId]
    data.taskId = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [taskType]
    data.taskType = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [targetName]
    data.targetName = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [targetX]
    data.targetX = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [targetY]
    data.targetY = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [targetHA]
    data.targetHA = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [cargoLength]
    data.cargoLength = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [cargoWidth]
    data.cargoWidth = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [cargoWeight]
    data.cargoWeight = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [cargoId]
    data.cargoId = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [wheelBase]
    data.wheelBase = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [subtaskCount]
    data.subtaskCount = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [subtaskIndex]
    data.subtaskIndex = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [subtaskAction]
    data.subtaskAction = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [pathLength]
    data.pathLength = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [path]
    // Deserialize array length for message field [path]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.path = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.path[i] = path_point.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [value]
    data.value = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [channelId]
    data.channelId = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [cmd]
    data.cmd = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [timeSec]
    data.timeSec = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [addr]
    data.addr = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [cmdId]
    data.cmdId = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [ctrlType]
    data.ctrlType = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [stopPosX]
    data.stopPosX = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [stopPosY]
    data.stopPosY = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [stopPosHA]
    data.stopPosHA = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [lightStatus]
    data.lightStatus = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [lightType]
    data.lightType = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [lightLeftTime]
    data.lightLeftTime = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [intersectionId]
    data.intersectionId = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.msgType);
    length += _getByteLength(object.agvId);
    length += _getByteLength(object.targetName);
    length += _getByteLength(object.cargoId);
    length += 28 * object.path.length;
    length += _getByteLength(object.addr);
    length += _getByteLength(object.ctrlType);
    return length + 176;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mqtt_commx/controls';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0c5cf398ee743496bb1cfd81aefc4c97';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string msgType
    string agvId
    int64 timestamp
    
    #task
    int32 taskId
    int32 taskType 
    string targetName 
    float64 targetX
    float64 targetY
    float64 targetHA
    float64 cargoLength
    float64 cargoWidth
    float64 cargoWeight
    string cargoId
    float64 wheelBase
    int32 subtaskCount
    int32 subtaskIndex
    int32 subtaskAction
    int32 pathLength
    path_point[] path
    
    # sync
    int32 value
    
    # video
    int32 channelId
    int32 cmd       
    int32 timeSec
    string addr
    
    # ctrl
    int32 cmdId
    string ctrlType
    float64 stopPosX
    float64 stopPosY
    float64 stopPosHA 
    int32 lightStatus
    int32 lightType
    int32 lightLeftTime
    int32 intersectionId
    
    
    
    
    
    
    ================================================================================
    MSG: mqtt_commx/path_point
    float32 vehSpeed
    float64 pointX
    float64 pointY
    float64 pointHA
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new controls(null);
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

    if (msg.taskType !== undefined) {
      resolved.taskType = msg.taskType;
    }
    else {
      resolved.taskType = 0
    }

    if (msg.targetName !== undefined) {
      resolved.targetName = msg.targetName;
    }
    else {
      resolved.targetName = ''
    }

    if (msg.targetX !== undefined) {
      resolved.targetX = msg.targetX;
    }
    else {
      resolved.targetX = 0.0
    }

    if (msg.targetY !== undefined) {
      resolved.targetY = msg.targetY;
    }
    else {
      resolved.targetY = 0.0
    }

    if (msg.targetHA !== undefined) {
      resolved.targetHA = msg.targetHA;
    }
    else {
      resolved.targetHA = 0.0
    }

    if (msg.cargoLength !== undefined) {
      resolved.cargoLength = msg.cargoLength;
    }
    else {
      resolved.cargoLength = 0.0
    }

    if (msg.cargoWidth !== undefined) {
      resolved.cargoWidth = msg.cargoWidth;
    }
    else {
      resolved.cargoWidth = 0.0
    }

    if (msg.cargoWeight !== undefined) {
      resolved.cargoWeight = msg.cargoWeight;
    }
    else {
      resolved.cargoWeight = 0.0
    }

    if (msg.cargoId !== undefined) {
      resolved.cargoId = msg.cargoId;
    }
    else {
      resolved.cargoId = ''
    }

    if (msg.wheelBase !== undefined) {
      resolved.wheelBase = msg.wheelBase;
    }
    else {
      resolved.wheelBase = 0.0
    }

    if (msg.subtaskCount !== undefined) {
      resolved.subtaskCount = msg.subtaskCount;
    }
    else {
      resolved.subtaskCount = 0
    }

    if (msg.subtaskIndex !== undefined) {
      resolved.subtaskIndex = msg.subtaskIndex;
    }
    else {
      resolved.subtaskIndex = 0
    }

    if (msg.subtaskAction !== undefined) {
      resolved.subtaskAction = msg.subtaskAction;
    }
    else {
      resolved.subtaskAction = 0
    }

    if (msg.pathLength !== undefined) {
      resolved.pathLength = msg.pathLength;
    }
    else {
      resolved.pathLength = 0
    }

    if (msg.path !== undefined) {
      resolved.path = new Array(msg.path.length);
      for (let i = 0; i < resolved.path.length; ++i) {
        resolved.path[i] = path_point.Resolve(msg.path[i]);
      }
    }
    else {
      resolved.path = []
    }

    if (msg.value !== undefined) {
      resolved.value = msg.value;
    }
    else {
      resolved.value = 0
    }

    if (msg.channelId !== undefined) {
      resolved.channelId = msg.channelId;
    }
    else {
      resolved.channelId = 0
    }

    if (msg.cmd !== undefined) {
      resolved.cmd = msg.cmd;
    }
    else {
      resolved.cmd = 0
    }

    if (msg.timeSec !== undefined) {
      resolved.timeSec = msg.timeSec;
    }
    else {
      resolved.timeSec = 0
    }

    if (msg.addr !== undefined) {
      resolved.addr = msg.addr;
    }
    else {
      resolved.addr = ''
    }

    if (msg.cmdId !== undefined) {
      resolved.cmdId = msg.cmdId;
    }
    else {
      resolved.cmdId = 0
    }

    if (msg.ctrlType !== undefined) {
      resolved.ctrlType = msg.ctrlType;
    }
    else {
      resolved.ctrlType = ''
    }

    if (msg.stopPosX !== undefined) {
      resolved.stopPosX = msg.stopPosX;
    }
    else {
      resolved.stopPosX = 0.0
    }

    if (msg.stopPosY !== undefined) {
      resolved.stopPosY = msg.stopPosY;
    }
    else {
      resolved.stopPosY = 0.0
    }

    if (msg.stopPosHA !== undefined) {
      resolved.stopPosHA = msg.stopPosHA;
    }
    else {
      resolved.stopPosHA = 0.0
    }

    if (msg.lightStatus !== undefined) {
      resolved.lightStatus = msg.lightStatus;
    }
    else {
      resolved.lightStatus = 0
    }

    if (msg.lightType !== undefined) {
      resolved.lightType = msg.lightType;
    }
    else {
      resolved.lightType = 0
    }

    if (msg.lightLeftTime !== undefined) {
      resolved.lightLeftTime = msg.lightLeftTime;
    }
    else {
      resolved.lightLeftTime = 0
    }

    if (msg.intersectionId !== undefined) {
      resolved.intersectionId = msg.intersectionId;
    }
    else {
      resolved.intersectionId = 0
    }

    return resolved;
    }
};

module.exports = controls;
