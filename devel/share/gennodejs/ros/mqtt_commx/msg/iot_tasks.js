// Auto-generated. Do not edit!

// (in-package mqtt_commx.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let cmd_Header = require('./cmd_Header.js');

//-----------------------------------------------------------

class iot_tasks {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.taskId = null;
      this.taskType = null;
      this.target = null;
      this.sub_target = null;
      this.targetX = null;
      this.targetY = null;
      this.targetHA = null;
      this.cargoLength = null;
      this.cargoWidth = null;
      this.cargoHeight = null;
      this.cargoId = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new cmd_Header();
      }
      if (initObj.hasOwnProperty('taskId')) {
        this.taskId = initObj.taskId
      }
      else {
        this.taskId = '';
      }
      if (initObj.hasOwnProperty('taskType')) {
        this.taskType = initObj.taskType
      }
      else {
        this.taskType = 0;
      }
      if (initObj.hasOwnProperty('target')) {
        this.target = initObj.target
      }
      else {
        this.target = '';
      }
      if (initObj.hasOwnProperty('sub_target')) {
        this.sub_target = initObj.sub_target
      }
      else {
        this.sub_target = '';
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
      if (initObj.hasOwnProperty('cargoHeight')) {
        this.cargoHeight = initObj.cargoHeight
      }
      else {
        this.cargoHeight = 0.0;
      }
      if (initObj.hasOwnProperty('cargoId')) {
        this.cargoId = initObj.cargoId
      }
      else {
        this.cargoId = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type iot_tasks
    // Serialize message field [header]
    bufferOffset = cmd_Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [taskId]
    bufferOffset = _serializer.string(obj.taskId, buffer, bufferOffset);
    // Serialize message field [taskType]
    bufferOffset = _serializer.int32(obj.taskType, buffer, bufferOffset);
    // Serialize message field [target]
    bufferOffset = _serializer.string(obj.target, buffer, bufferOffset);
    // Serialize message field [sub_target]
    bufferOffset = _serializer.string(obj.sub_target, buffer, bufferOffset);
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
    // Serialize message field [cargoHeight]
    bufferOffset = _serializer.float64(obj.cargoHeight, buffer, bufferOffset);
    // Serialize message field [cargoId]
    bufferOffset = _serializer.string(obj.cargoId, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type iot_tasks
    let len;
    let data = new iot_tasks(null);
    // Deserialize message field [header]
    data.header = cmd_Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [taskId]
    data.taskId = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [taskType]
    data.taskType = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [target]
    data.target = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [sub_target]
    data.sub_target = _deserializer.string(buffer, bufferOffset);
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
    // Deserialize message field [cargoHeight]
    data.cargoHeight = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [cargoId]
    data.cargoId = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += cmd_Header.getMessageSize(object.header);
    length += _getByteLength(object.taskId);
    length += _getByteLength(object.target);
    length += _getByteLength(object.sub_target);
    length += _getByteLength(object.cargoId);
    return length + 68;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mqtt_commx/iot_tasks';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e19a52af0fdaf396449227820a086c35';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    cmd_Header header
    
    
    #task
    string taskId         #任务号
    int32 taskType        #任务类型
    string target         #任务大区
    string sub_target     #车位号
    float64 targetX       #目标x
    float64 targetY       #目标y
    float64 targetHA      #目标航相角
    
    float64 cargoLength   #商品车长宽高
    float64 cargoWidth
    float64 cargoHeight
    
    string cargoId        #商品车射频码
    
    
    
    
    
    
    
    
    
    
    ================================================================================
    MSG: mqtt_commx/cmd_Header
    string trace_id
    string trans_id
    string che_id
    string timestamp
    string version
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new iot_tasks(null);
    if (msg.header !== undefined) {
      resolved.header = cmd_Header.Resolve(msg.header)
    }
    else {
      resolved.header = new cmd_Header()
    }

    if (msg.taskId !== undefined) {
      resolved.taskId = msg.taskId;
    }
    else {
      resolved.taskId = ''
    }

    if (msg.taskType !== undefined) {
      resolved.taskType = msg.taskType;
    }
    else {
      resolved.taskType = 0
    }

    if (msg.target !== undefined) {
      resolved.target = msg.target;
    }
    else {
      resolved.target = ''
    }

    if (msg.sub_target !== undefined) {
      resolved.sub_target = msg.sub_target;
    }
    else {
      resolved.sub_target = ''
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

    if (msg.cargoHeight !== undefined) {
      resolved.cargoHeight = msg.cargoHeight;
    }
    else {
      resolved.cargoHeight = 0.0
    }

    if (msg.cargoId !== undefined) {
      resolved.cargoId = msg.cargoId;
    }
    else {
      resolved.cargoId = ''
    }

    return resolved;
    }
};

module.exports = iot_tasks;
