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

class resp_agvstate {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.msgType = null;
      this.timestamp = null;
      this.version = null;
      this.mileage = null;
      this.batterySOH = null;
      this.batterySOC = null;
      this.batteryVoltage = null;
      this.batteryCurrent = null;
      this.batterytemperature = null;
      this.charge_state = null;
      this.vehSpeed = null;
      this.pointHA = null;
      this.pointX = null;
      this.pointY = null;
      this.workPointid = null;
      this.steerControlMode = null;
      this.vehCtrlMode = null;
      this.autoDriveEnable = null;
      this.pitchAngle = null;
      this.azimuthAngle = null;
      this.taskId = null;
      this.taskStatus = null;
      this.errCode = null;
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
      if (initObj.hasOwnProperty('version')) {
        this.version = initObj.version
      }
      else {
        this.version = '';
      }
      if (initObj.hasOwnProperty('mileage')) {
        this.mileage = initObj.mileage
      }
      else {
        this.mileage = 0.0;
      }
      if (initObj.hasOwnProperty('batterySOH')) {
        this.batterySOH = initObj.batterySOH
      }
      else {
        this.batterySOH = 0.0;
      }
      if (initObj.hasOwnProperty('batterySOC')) {
        this.batterySOC = initObj.batterySOC
      }
      else {
        this.batterySOC = 0.0;
      }
      if (initObj.hasOwnProperty('batteryVoltage')) {
        this.batteryVoltage = initObj.batteryVoltage
      }
      else {
        this.batteryVoltage = 0.0;
      }
      if (initObj.hasOwnProperty('batteryCurrent')) {
        this.batteryCurrent = initObj.batteryCurrent
      }
      else {
        this.batteryCurrent = 0.0;
      }
      if (initObj.hasOwnProperty('batterytemperature')) {
        this.batterytemperature = initObj.batterytemperature
      }
      else {
        this.batterytemperature = 0;
      }
      if (initObj.hasOwnProperty('charge_state')) {
        this.charge_state = initObj.charge_state
      }
      else {
        this.charge_state = 0;
      }
      if (initObj.hasOwnProperty('vehSpeed')) {
        this.vehSpeed = initObj.vehSpeed
      }
      else {
        this.vehSpeed = 0.0;
      }
      if (initObj.hasOwnProperty('pointHA')) {
        this.pointHA = initObj.pointHA
      }
      else {
        this.pointHA = 0.0;
      }
      if (initObj.hasOwnProperty('pointX')) {
        this.pointX = initObj.pointX
      }
      else {
        this.pointX = 0.0;
      }
      if (initObj.hasOwnProperty('pointY')) {
        this.pointY = initObj.pointY
      }
      else {
        this.pointY = 0.0;
      }
      if (initObj.hasOwnProperty('workPointid')) {
        this.workPointid = initObj.workPointid
      }
      else {
        this.workPointid = '';
      }
      if (initObj.hasOwnProperty('steerControlMode')) {
        this.steerControlMode = initObj.steerControlMode
      }
      else {
        this.steerControlMode = 0;
      }
      if (initObj.hasOwnProperty('vehCtrlMode')) {
        this.vehCtrlMode = initObj.vehCtrlMode
      }
      else {
        this.vehCtrlMode = 0;
      }
      if (initObj.hasOwnProperty('autoDriveEnable')) {
        this.autoDriveEnable = initObj.autoDriveEnable
      }
      else {
        this.autoDriveEnable = 0;
      }
      if (initObj.hasOwnProperty('pitchAngle')) {
        this.pitchAngle = initObj.pitchAngle
      }
      else {
        this.pitchAngle = 0.0;
      }
      if (initObj.hasOwnProperty('azimuthAngle')) {
        this.azimuthAngle = initObj.azimuthAngle
      }
      else {
        this.azimuthAngle = 0.0;
      }
      if (initObj.hasOwnProperty('taskId')) {
        this.taskId = initObj.taskId
      }
      else {
        this.taskId = '';
      }
      if (initObj.hasOwnProperty('taskStatus')) {
        this.taskStatus = initObj.taskStatus
      }
      else {
        this.taskStatus = 0;
      }
      if (initObj.hasOwnProperty('errCode')) {
        this.errCode = initObj.errCode
      }
      else {
        this.errCode = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type resp_agvstate
    // Serialize message field [msgType]
    bufferOffset = _serializer.string(obj.msgType, buffer, bufferOffset);
    // Serialize message field [timestamp]
    bufferOffset = _serializer.int64(obj.timestamp, buffer, bufferOffset);
    // Serialize message field [version]
    bufferOffset = _serializer.string(obj.version, buffer, bufferOffset);
    // Serialize message field [mileage]
    bufferOffset = _serializer.float64(obj.mileage, buffer, bufferOffset);
    // Serialize message field [batterySOH]
    bufferOffset = _serializer.float64(obj.batterySOH, buffer, bufferOffset);
    // Serialize message field [batterySOC]
    bufferOffset = _serializer.float64(obj.batterySOC, buffer, bufferOffset);
    // Serialize message field [batteryVoltage]
    bufferOffset = _serializer.float64(obj.batteryVoltage, buffer, bufferOffset);
    // Serialize message field [batteryCurrent]
    bufferOffset = _serializer.float64(obj.batteryCurrent, buffer, bufferOffset);
    // Serialize message field [batterytemperature]
    bufferOffset = _serializer.int32(obj.batterytemperature, buffer, bufferOffset);
    // Serialize message field [charge_state]
    bufferOffset = _serializer.int32(obj.charge_state, buffer, bufferOffset);
    // Serialize message field [vehSpeed]
    bufferOffset = _serializer.float32(obj.vehSpeed, buffer, bufferOffset);
    // Serialize message field [pointHA]
    bufferOffset = _serializer.float32(obj.pointHA, buffer, bufferOffset);
    // Serialize message field [pointX]
    bufferOffset = _serializer.float64(obj.pointX, buffer, bufferOffset);
    // Serialize message field [pointY]
    bufferOffset = _serializer.float64(obj.pointY, buffer, bufferOffset);
    // Serialize message field [workPointid]
    bufferOffset = _serializer.string(obj.workPointid, buffer, bufferOffset);
    // Serialize message field [steerControlMode]
    bufferOffset = _serializer.int32(obj.steerControlMode, buffer, bufferOffset);
    // Serialize message field [vehCtrlMode]
    bufferOffset = _serializer.int32(obj.vehCtrlMode, buffer, bufferOffset);
    // Serialize message field [autoDriveEnable]
    bufferOffset = _serializer.int32(obj.autoDriveEnable, buffer, bufferOffset);
    // Serialize message field [pitchAngle]
    bufferOffset = _serializer.float32(obj.pitchAngle, buffer, bufferOffset);
    // Serialize message field [azimuthAngle]
    bufferOffset = _serializer.float32(obj.azimuthAngle, buffer, bufferOffset);
    // Serialize message field [taskId]
    bufferOffset = _serializer.string(obj.taskId, buffer, bufferOffset);
    // Serialize message field [taskStatus]
    bufferOffset = _serializer.int32(obj.taskStatus, buffer, bufferOffset);
    // Serialize message field [errCode]
    bufferOffset = _serializer.string(obj.errCode, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type resp_agvstate
    let len;
    let data = new resp_agvstate(null);
    // Deserialize message field [msgType]
    data.msgType = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [timestamp]
    data.timestamp = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [version]
    data.version = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [mileage]
    data.mileage = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [batterySOH]
    data.batterySOH = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [batterySOC]
    data.batterySOC = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [batteryVoltage]
    data.batteryVoltage = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [batteryCurrent]
    data.batteryCurrent = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [batterytemperature]
    data.batterytemperature = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [charge_state]
    data.charge_state = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [vehSpeed]
    data.vehSpeed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pointHA]
    data.pointHA = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pointX]
    data.pointX = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pointY]
    data.pointY = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [workPointid]
    data.workPointid = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [steerControlMode]
    data.steerControlMode = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [vehCtrlMode]
    data.vehCtrlMode = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [autoDriveEnable]
    data.autoDriveEnable = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [pitchAngle]
    data.pitchAngle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [azimuthAngle]
    data.azimuthAngle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [taskId]
    data.taskId = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [taskStatus]
    data.taskStatus = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [errCode]
    data.errCode = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.msgType);
    length += _getByteLength(object.version);
    length += _getByteLength(object.workPointid);
    length += _getByteLength(object.taskId);
    length += _getByteLength(object.errCode);
    return length + 124;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mqtt_comm/resp_agvstate';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9afde21e9d1bc354804e4cf18e51c787';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string msgType
    int64 timestamp
    string version
    
    float64 mileage
    float64 batterySOH
    float64 batterySOC
    float64 batteryVoltage
    float64 batteryCurrent
    int32 batterytemperature
    int32 charge_state
    
    float32 vehSpeed    
    float32 pointHA
    float64 pointX
    float64 pointY
    string workPointid
    
    int32 steerControlMode
    int32 vehCtrlMode	
    int32 autoDriveEnable	
    
    float32 pitchAngle
    float32 azimuthAngle
    
    string taskId
    int32 taskStatus
    string errCode
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new resp_agvstate(null);
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

    if (msg.version !== undefined) {
      resolved.version = msg.version;
    }
    else {
      resolved.version = ''
    }

    if (msg.mileage !== undefined) {
      resolved.mileage = msg.mileage;
    }
    else {
      resolved.mileage = 0.0
    }

    if (msg.batterySOH !== undefined) {
      resolved.batterySOH = msg.batterySOH;
    }
    else {
      resolved.batterySOH = 0.0
    }

    if (msg.batterySOC !== undefined) {
      resolved.batterySOC = msg.batterySOC;
    }
    else {
      resolved.batterySOC = 0.0
    }

    if (msg.batteryVoltage !== undefined) {
      resolved.batteryVoltage = msg.batteryVoltage;
    }
    else {
      resolved.batteryVoltage = 0.0
    }

    if (msg.batteryCurrent !== undefined) {
      resolved.batteryCurrent = msg.batteryCurrent;
    }
    else {
      resolved.batteryCurrent = 0.0
    }

    if (msg.batterytemperature !== undefined) {
      resolved.batterytemperature = msg.batterytemperature;
    }
    else {
      resolved.batterytemperature = 0
    }

    if (msg.charge_state !== undefined) {
      resolved.charge_state = msg.charge_state;
    }
    else {
      resolved.charge_state = 0
    }

    if (msg.vehSpeed !== undefined) {
      resolved.vehSpeed = msg.vehSpeed;
    }
    else {
      resolved.vehSpeed = 0.0
    }

    if (msg.pointHA !== undefined) {
      resolved.pointHA = msg.pointHA;
    }
    else {
      resolved.pointHA = 0.0
    }

    if (msg.pointX !== undefined) {
      resolved.pointX = msg.pointX;
    }
    else {
      resolved.pointX = 0.0
    }

    if (msg.pointY !== undefined) {
      resolved.pointY = msg.pointY;
    }
    else {
      resolved.pointY = 0.0
    }

    if (msg.workPointid !== undefined) {
      resolved.workPointid = msg.workPointid;
    }
    else {
      resolved.workPointid = ''
    }

    if (msg.steerControlMode !== undefined) {
      resolved.steerControlMode = msg.steerControlMode;
    }
    else {
      resolved.steerControlMode = 0
    }

    if (msg.vehCtrlMode !== undefined) {
      resolved.vehCtrlMode = msg.vehCtrlMode;
    }
    else {
      resolved.vehCtrlMode = 0
    }

    if (msg.autoDriveEnable !== undefined) {
      resolved.autoDriveEnable = msg.autoDriveEnable;
    }
    else {
      resolved.autoDriveEnable = 0
    }

    if (msg.pitchAngle !== undefined) {
      resolved.pitchAngle = msg.pitchAngle;
    }
    else {
      resolved.pitchAngle = 0.0
    }

    if (msg.azimuthAngle !== undefined) {
      resolved.azimuthAngle = msg.azimuthAngle;
    }
    else {
      resolved.azimuthAngle = 0.0
    }

    if (msg.taskId !== undefined) {
      resolved.taskId = msg.taskId;
    }
    else {
      resolved.taskId = ''
    }

    if (msg.taskStatus !== undefined) {
      resolved.taskStatus = msg.taskStatus;
    }
    else {
      resolved.taskStatus = 0
    }

    if (msg.errCode !== undefined) {
      resolved.errCode = msg.errCode;
    }
    else {
      resolved.errCode = ''
    }

    return resolved;
    }
};

module.exports = resp_agvstate;
