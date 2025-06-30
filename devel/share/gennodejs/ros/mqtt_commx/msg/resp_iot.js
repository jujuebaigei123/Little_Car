// Auto-generated. Do not edit!

// (in-package mqtt_commx.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let fault_info_array = require('./fault_info_array.js');

//-----------------------------------------------------------

class resp_iot {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.state_flow = null;
      this.task_mode = null;
      this.chassis_total_hour = null;
      this.drv_direction = null;
      this.firm_error_state = null;
      this.vehicle_error_status = null;
      this.faults = null;
      this.mileage = null;
      this.in_high_voltage = null;
      this.vin = null;
      this.task_id = null;
      this.navi_id = null;
      this.task_type = null;
      this.act_type = null;
      this.target = null;
      this.sub_target = null;
    }
    else {
      if (initObj.hasOwnProperty('state_flow')) {
        this.state_flow = initObj.state_flow
      }
      else {
        this.state_flow = 0;
      }
      if (initObj.hasOwnProperty('task_mode')) {
        this.task_mode = initObj.task_mode
      }
      else {
        this.task_mode = 0;
      }
      if (initObj.hasOwnProperty('chassis_total_hour')) {
        this.chassis_total_hour = initObj.chassis_total_hour
      }
      else {
        this.chassis_total_hour = 0;
      }
      if (initObj.hasOwnProperty('drv_direction')) {
        this.drv_direction = initObj.drv_direction
      }
      else {
        this.drv_direction = 0;
      }
      if (initObj.hasOwnProperty('firm_error_state')) {
        this.firm_error_state = initObj.firm_error_state
      }
      else {
        this.firm_error_state = 0;
      }
      if (initObj.hasOwnProperty('vehicle_error_status')) {
        this.vehicle_error_status = initObj.vehicle_error_status
      }
      else {
        this.vehicle_error_status = 0;
      }
      if (initObj.hasOwnProperty('faults')) {
        this.faults = initObj.faults
      }
      else {
        this.faults = new fault_info_array();
      }
      if (initObj.hasOwnProperty('mileage')) {
        this.mileage = initObj.mileage
      }
      else {
        this.mileage = 0;
      }
      if (initObj.hasOwnProperty('in_high_voltage')) {
        this.in_high_voltage = initObj.in_high_voltage
      }
      else {
        this.in_high_voltage = false;
      }
      if (initObj.hasOwnProperty('vin')) {
        this.vin = initObj.vin
      }
      else {
        this.vin = '';
      }
      if (initObj.hasOwnProperty('task_id')) {
        this.task_id = initObj.task_id
      }
      else {
        this.task_id = '';
      }
      if (initObj.hasOwnProperty('navi_id')) {
        this.navi_id = initObj.navi_id
      }
      else {
        this.navi_id = '';
      }
      if (initObj.hasOwnProperty('task_type')) {
        this.task_type = initObj.task_type
      }
      else {
        this.task_type = 0;
      }
      if (initObj.hasOwnProperty('act_type')) {
        this.act_type = initObj.act_type
      }
      else {
        this.act_type = 0;
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
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type resp_iot
    // Serialize message field [state_flow]
    bufferOffset = _serializer.int32(obj.state_flow, buffer, bufferOffset);
    // Serialize message field [task_mode]
    bufferOffset = _serializer.int32(obj.task_mode, buffer, bufferOffset);
    // Serialize message field [chassis_total_hour]
    bufferOffset = _serializer.int32(obj.chassis_total_hour, buffer, bufferOffset);
    // Serialize message field [drv_direction]
    bufferOffset = _serializer.int32(obj.drv_direction, buffer, bufferOffset);
    // Serialize message field [firm_error_state]
    bufferOffset = _serializer.int32(obj.firm_error_state, buffer, bufferOffset);
    // Serialize message field [vehicle_error_status]
    bufferOffset = _serializer.int32(obj.vehicle_error_status, buffer, bufferOffset);
    // Serialize message field [faults]
    bufferOffset = fault_info_array.serialize(obj.faults, buffer, bufferOffset);
    // Serialize message field [mileage]
    bufferOffset = _serializer.int32(obj.mileage, buffer, bufferOffset);
    // Serialize message field [in_high_voltage]
    bufferOffset = _serializer.bool(obj.in_high_voltage, buffer, bufferOffset);
    // Serialize message field [vin]
    bufferOffset = _serializer.string(obj.vin, buffer, bufferOffset);
    // Serialize message field [task_id]
    bufferOffset = _serializer.string(obj.task_id, buffer, bufferOffset);
    // Serialize message field [navi_id]
    bufferOffset = _serializer.string(obj.navi_id, buffer, bufferOffset);
    // Serialize message field [task_type]
    bufferOffset = _serializer.int32(obj.task_type, buffer, bufferOffset);
    // Serialize message field [act_type]
    bufferOffset = _serializer.int32(obj.act_type, buffer, bufferOffset);
    // Serialize message field [target]
    bufferOffset = _serializer.string(obj.target, buffer, bufferOffset);
    // Serialize message field [sub_target]
    bufferOffset = _serializer.string(obj.sub_target, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type resp_iot
    let len;
    let data = new resp_iot(null);
    // Deserialize message field [state_flow]
    data.state_flow = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [task_mode]
    data.task_mode = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [chassis_total_hour]
    data.chassis_total_hour = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [drv_direction]
    data.drv_direction = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [firm_error_state]
    data.firm_error_state = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [vehicle_error_status]
    data.vehicle_error_status = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [faults]
    data.faults = fault_info_array.deserialize(buffer, bufferOffset);
    // Deserialize message field [mileage]
    data.mileage = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [in_high_voltage]
    data.in_high_voltage = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [vin]
    data.vin = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [task_id]
    data.task_id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [navi_id]
    data.navi_id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [task_type]
    data.task_type = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [act_type]
    data.act_type = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [target]
    data.target = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [sub_target]
    data.sub_target = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += fault_info_array.getMessageSize(object.faults);
    length += _getByteLength(object.vin);
    length += _getByteLength(object.task_id);
    length += _getByteLength(object.navi_id);
    length += _getByteLength(object.target);
    length += _getByteLength(object.sub_target);
    return length + 57;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mqtt_commx/resp_iot';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3464ad6bcd20665bf6b59cba1ab9629c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 state_flow
    int32 task_mode
    int32 chassis_total_hour
    int32 drv_direction
    
    int32 firm_error_state
    int32 vehicle_error_status
    fault_info_array faults
    int32 mileage
    
    bool in_high_voltage
    string vin
    string task_id
    string navi_id
    int32 task_type
    
    int32 act_type
    string target
    string sub_target
    ================================================================================
    MSG: mqtt_commx/fault_info_array
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
    const resolved = new resp_iot(null);
    if (msg.state_flow !== undefined) {
      resolved.state_flow = msg.state_flow;
    }
    else {
      resolved.state_flow = 0
    }

    if (msg.task_mode !== undefined) {
      resolved.task_mode = msg.task_mode;
    }
    else {
      resolved.task_mode = 0
    }

    if (msg.chassis_total_hour !== undefined) {
      resolved.chassis_total_hour = msg.chassis_total_hour;
    }
    else {
      resolved.chassis_total_hour = 0
    }

    if (msg.drv_direction !== undefined) {
      resolved.drv_direction = msg.drv_direction;
    }
    else {
      resolved.drv_direction = 0
    }

    if (msg.firm_error_state !== undefined) {
      resolved.firm_error_state = msg.firm_error_state;
    }
    else {
      resolved.firm_error_state = 0
    }

    if (msg.vehicle_error_status !== undefined) {
      resolved.vehicle_error_status = msg.vehicle_error_status;
    }
    else {
      resolved.vehicle_error_status = 0
    }

    if (msg.faults !== undefined) {
      resolved.faults = fault_info_array.Resolve(msg.faults)
    }
    else {
      resolved.faults = new fault_info_array()
    }

    if (msg.mileage !== undefined) {
      resolved.mileage = msg.mileage;
    }
    else {
      resolved.mileage = 0
    }

    if (msg.in_high_voltage !== undefined) {
      resolved.in_high_voltage = msg.in_high_voltage;
    }
    else {
      resolved.in_high_voltage = false
    }

    if (msg.vin !== undefined) {
      resolved.vin = msg.vin;
    }
    else {
      resolved.vin = ''
    }

    if (msg.task_id !== undefined) {
      resolved.task_id = msg.task_id;
    }
    else {
      resolved.task_id = ''
    }

    if (msg.navi_id !== undefined) {
      resolved.navi_id = msg.navi_id;
    }
    else {
      resolved.navi_id = ''
    }

    if (msg.task_type !== undefined) {
      resolved.task_type = msg.task_type;
    }
    else {
      resolved.task_type = 0
    }

    if (msg.act_type !== undefined) {
      resolved.act_type = msg.act_type;
    }
    else {
      resolved.act_type = 0
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

    return resolved;
    }
};

module.exports = resp_iot;
