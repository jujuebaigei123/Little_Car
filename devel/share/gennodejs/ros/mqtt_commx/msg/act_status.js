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
let Point = require('./Point.js');
let fault_info = require('./fault_info.js');

//-----------------------------------------------------------

class act_status {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.point = null;
      this.faults = null;
      this.act_type = null;
      this.chassis_total_hour = null;
      this.distance_to_target = null;
      this.drv_direction = null;
      this.empty = null;
      this.estop = null;
      this.firm_error_status = null;
      this.frame_ts = null;
      this.gear = null;
      this.in_high_voltage = null;
      this.is_charging = null;
      this.mileage = null;
      this.motion_mode = null;
      this.navi_id = null;
      this.operational_status = null;
      this.platform_state = null;
      this.soc = null;
      this.soh = null;
      this.speed = null;
      this.state_flow = null;
      this.sub_target = null;
      this.target = null;
      this.task_id = null;
      this.task_mode = null;
      this.task_type = null;
      this.turn_light = null;
      this.vehicle_error_status = null;
      this.vin = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new cmd_Header();
      }
      if (initObj.hasOwnProperty('point')) {
        this.point = initObj.point
      }
      else {
        this.point = new Point();
      }
      if (initObj.hasOwnProperty('faults')) {
        this.faults = initObj.faults
      }
      else {
        this.faults = [];
      }
      if (initObj.hasOwnProperty('act_type')) {
        this.act_type = initObj.act_type
      }
      else {
        this.act_type = 0;
      }
      if (initObj.hasOwnProperty('chassis_total_hour')) {
        this.chassis_total_hour = initObj.chassis_total_hour
      }
      else {
        this.chassis_total_hour = 0;
      }
      if (initObj.hasOwnProperty('distance_to_target')) {
        this.distance_to_target = initObj.distance_to_target
      }
      else {
        this.distance_to_target = 0.0;
      }
      if (initObj.hasOwnProperty('drv_direction')) {
        this.drv_direction = initObj.drv_direction
      }
      else {
        this.drv_direction = 0;
      }
      if (initObj.hasOwnProperty('empty')) {
        this.empty = initObj.empty
      }
      else {
        this.empty = false;
      }
      if (initObj.hasOwnProperty('estop')) {
        this.estop = initObj.estop
      }
      else {
        this.estop = false;
      }
      if (initObj.hasOwnProperty('firm_error_status')) {
        this.firm_error_status = initObj.firm_error_status
      }
      else {
        this.firm_error_status = 0;
      }
      if (initObj.hasOwnProperty('frame_ts')) {
        this.frame_ts = initObj.frame_ts
      }
      else {
        this.frame_ts = 0;
      }
      if (initObj.hasOwnProperty('gear')) {
        this.gear = initObj.gear
      }
      else {
        this.gear = 0;
      }
      if (initObj.hasOwnProperty('in_high_voltage')) {
        this.in_high_voltage = initObj.in_high_voltage
      }
      else {
        this.in_high_voltage = false;
      }
      if (initObj.hasOwnProperty('is_charging')) {
        this.is_charging = initObj.is_charging
      }
      else {
        this.is_charging = false;
      }
      if (initObj.hasOwnProperty('mileage')) {
        this.mileage = initObj.mileage
      }
      else {
        this.mileage = 0;
      }
      if (initObj.hasOwnProperty('motion_mode')) {
        this.motion_mode = initObj.motion_mode
      }
      else {
        this.motion_mode = 0;
      }
      if (initObj.hasOwnProperty('navi_id')) {
        this.navi_id = initObj.navi_id
      }
      else {
        this.navi_id = '';
      }
      if (initObj.hasOwnProperty('operational_status')) {
        this.operational_status = initObj.operational_status
      }
      else {
        this.operational_status = 0;
      }
      if (initObj.hasOwnProperty('platform_state')) {
        this.platform_state = initObj.platform_state
      }
      else {
        this.platform_state = 0;
      }
      if (initObj.hasOwnProperty('soc')) {
        this.soc = initObj.soc
      }
      else {
        this.soc = 0;
      }
      if (initObj.hasOwnProperty('soh')) {
        this.soh = initObj.soh
      }
      else {
        this.soh = 0;
      }
      if (initObj.hasOwnProperty('speed')) {
        this.speed = initObj.speed
      }
      else {
        this.speed = 0.0;
      }
      if (initObj.hasOwnProperty('state_flow')) {
        this.state_flow = initObj.state_flow
      }
      else {
        this.state_flow = 0;
      }
      if (initObj.hasOwnProperty('sub_target')) {
        this.sub_target = initObj.sub_target
      }
      else {
        this.sub_target = '';
      }
      if (initObj.hasOwnProperty('target')) {
        this.target = initObj.target
      }
      else {
        this.target = '';
      }
      if (initObj.hasOwnProperty('task_id')) {
        this.task_id = initObj.task_id
      }
      else {
        this.task_id = '';
      }
      if (initObj.hasOwnProperty('task_mode')) {
        this.task_mode = initObj.task_mode
      }
      else {
        this.task_mode = 0;
      }
      if (initObj.hasOwnProperty('task_type')) {
        this.task_type = initObj.task_type
      }
      else {
        this.task_type = 0;
      }
      if (initObj.hasOwnProperty('turn_light')) {
        this.turn_light = initObj.turn_light
      }
      else {
        this.turn_light = 0;
      }
      if (initObj.hasOwnProperty('vehicle_error_status')) {
        this.vehicle_error_status = initObj.vehicle_error_status
      }
      else {
        this.vehicle_error_status = 0;
      }
      if (initObj.hasOwnProperty('vin')) {
        this.vin = initObj.vin
      }
      else {
        this.vin = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type act_status
    // Serialize message field [header]
    bufferOffset = cmd_Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [point]
    bufferOffset = Point.serialize(obj.point, buffer, bufferOffset);
    // Serialize message field [faults]
    // Serialize the length for message field [faults]
    bufferOffset = _serializer.uint32(obj.faults.length, buffer, bufferOffset);
    obj.faults.forEach((val) => {
      bufferOffset = fault_info.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [act_type]
    bufferOffset = _serializer.int64(obj.act_type, buffer, bufferOffset);
    // Serialize message field [chassis_total_hour]
    bufferOffset = _serializer.int64(obj.chassis_total_hour, buffer, bufferOffset);
    // Serialize message field [distance_to_target]
    bufferOffset = _serializer.float64(obj.distance_to_target, buffer, bufferOffset);
    // Serialize message field [drv_direction]
    bufferOffset = _serializer.int64(obj.drv_direction, buffer, bufferOffset);
    // Serialize message field [empty]
    bufferOffset = _serializer.bool(obj.empty, buffer, bufferOffset);
    // Serialize message field [estop]
    bufferOffset = _serializer.bool(obj.estop, buffer, bufferOffset);
    // Serialize message field [firm_error_status]
    bufferOffset = _serializer.int64(obj.firm_error_status, buffer, bufferOffset);
    // Serialize message field [frame_ts]
    bufferOffset = _serializer.int64(obj.frame_ts, buffer, bufferOffset);
    // Serialize message field [gear]
    bufferOffset = _serializer.int64(obj.gear, buffer, bufferOffset);
    // Serialize message field [in_high_voltage]
    bufferOffset = _serializer.bool(obj.in_high_voltage, buffer, bufferOffset);
    // Serialize message field [is_charging]
    bufferOffset = _serializer.bool(obj.is_charging, buffer, bufferOffset);
    // Serialize message field [mileage]
    bufferOffset = _serializer.int64(obj.mileage, buffer, bufferOffset);
    // Serialize message field [motion_mode]
    bufferOffset = _serializer.int64(obj.motion_mode, buffer, bufferOffset);
    // Serialize message field [navi_id]
    bufferOffset = _serializer.string(obj.navi_id, buffer, bufferOffset);
    // Serialize message field [operational_status]
    bufferOffset = _serializer.int64(obj.operational_status, buffer, bufferOffset);
    // Serialize message field [platform_state]
    bufferOffset = _serializer.int64(obj.platform_state, buffer, bufferOffset);
    // Serialize message field [soc]
    bufferOffset = _serializer.int64(obj.soc, buffer, bufferOffset);
    // Serialize message field [soh]
    bufferOffset = _serializer.int64(obj.soh, buffer, bufferOffset);
    // Serialize message field [speed]
    bufferOffset = _serializer.float64(obj.speed, buffer, bufferOffset);
    // Serialize message field [state_flow]
    bufferOffset = _serializer.int64(obj.state_flow, buffer, bufferOffset);
    // Serialize message field [sub_target]
    bufferOffset = _serializer.string(obj.sub_target, buffer, bufferOffset);
    // Serialize message field [target]
    bufferOffset = _serializer.string(obj.target, buffer, bufferOffset);
    // Serialize message field [task_id]
    bufferOffset = _serializer.string(obj.task_id, buffer, bufferOffset);
    // Serialize message field [task_mode]
    bufferOffset = _serializer.int64(obj.task_mode, buffer, bufferOffset);
    // Serialize message field [task_type]
    bufferOffset = _serializer.int64(obj.task_type, buffer, bufferOffset);
    // Serialize message field [turn_light]
    bufferOffset = _serializer.int64(obj.turn_light, buffer, bufferOffset);
    // Serialize message field [vehicle_error_status]
    bufferOffset = _serializer.int64(obj.vehicle_error_status, buffer, bufferOffset);
    // Serialize message field [vin]
    bufferOffset = _serializer.string(obj.vin, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type act_status
    let len;
    let data = new act_status(null);
    // Deserialize message field [header]
    data.header = cmd_Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [point]
    data.point = Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [faults]
    // Deserialize array length for message field [faults]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.faults = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.faults[i] = fault_info.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [act_type]
    data.act_type = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [chassis_total_hour]
    data.chassis_total_hour = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [distance_to_target]
    data.distance_to_target = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [drv_direction]
    data.drv_direction = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [empty]
    data.empty = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [estop]
    data.estop = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [firm_error_status]
    data.firm_error_status = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [frame_ts]
    data.frame_ts = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [gear]
    data.gear = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [in_high_voltage]
    data.in_high_voltage = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [is_charging]
    data.is_charging = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [mileage]
    data.mileage = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [motion_mode]
    data.motion_mode = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [navi_id]
    data.navi_id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [operational_status]
    data.operational_status = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [platform_state]
    data.platform_state = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [soc]
    data.soc = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [soh]
    data.soh = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [speed]
    data.speed = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [state_flow]
    data.state_flow = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [sub_target]
    data.sub_target = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [target]
    data.target = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [task_id]
    data.task_id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [task_mode]
    data.task_mode = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [task_type]
    data.task_type = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [turn_light]
    data.turn_light = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [vehicle_error_status]
    data.vehicle_error_status = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [vin]
    data.vin = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += cmd_Header.getMessageSize(object.header);
    object.faults.forEach((val) => {
      length += fault_info.getMessageSize(val);
    });
    length += _getByteLength(object.navi_id);
    length += _getByteLength(object.sub_target);
    length += _getByteLength(object.target);
    length += _getByteLength(object.task_id);
    length += _getByteLength(object.vin);
    return length + 212;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mqtt_commx/act_status';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3a229cb3686a6eb829168e6cd0fe7cda';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    cmd_Header header
    Point point
    fault_info[]  faults
    
    int64 act_type
    int64 chassis_total_hour
    float64 distance_to_target
    int64 drv_direction
    bool empty
    bool estop
    int64 firm_error_status
    int64 frame_ts
    int64 gear
    bool in_high_voltage    # 取车状态
    bool is_charging
    int64 mileage
    int64 motion_mode
    string navi_id
    int64 operational_status
    int64 platform_state
    int64 soc
    int64 soh
    float64 speed
    int64 state_flow
    string sub_target
    string target
    string task_id
    int64 task_mode
    int64 task_type
    int64 turn_light
    int64 vehicle_error_status
    string vin
    
    ================================================================================
    MSG: mqtt_commx/cmd_Header
    string trace_id
    string trans_id
    string che_id
    string timestamp
    string version
    ================================================================================
    MSG: mqtt_commx/Point
    float64 x
    float64 y
    float64 yaw
    float64 z
    
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
    const resolved = new act_status(null);
    if (msg.header !== undefined) {
      resolved.header = cmd_Header.Resolve(msg.header)
    }
    else {
      resolved.header = new cmd_Header()
    }

    if (msg.point !== undefined) {
      resolved.point = Point.Resolve(msg.point)
    }
    else {
      resolved.point = new Point()
    }

    if (msg.faults !== undefined) {
      resolved.faults = new Array(msg.faults.length);
      for (let i = 0; i < resolved.faults.length; ++i) {
        resolved.faults[i] = fault_info.Resolve(msg.faults[i]);
      }
    }
    else {
      resolved.faults = []
    }

    if (msg.act_type !== undefined) {
      resolved.act_type = msg.act_type;
    }
    else {
      resolved.act_type = 0
    }

    if (msg.chassis_total_hour !== undefined) {
      resolved.chassis_total_hour = msg.chassis_total_hour;
    }
    else {
      resolved.chassis_total_hour = 0
    }

    if (msg.distance_to_target !== undefined) {
      resolved.distance_to_target = msg.distance_to_target;
    }
    else {
      resolved.distance_to_target = 0.0
    }

    if (msg.drv_direction !== undefined) {
      resolved.drv_direction = msg.drv_direction;
    }
    else {
      resolved.drv_direction = 0
    }

    if (msg.empty !== undefined) {
      resolved.empty = msg.empty;
    }
    else {
      resolved.empty = false
    }

    if (msg.estop !== undefined) {
      resolved.estop = msg.estop;
    }
    else {
      resolved.estop = false
    }

    if (msg.firm_error_status !== undefined) {
      resolved.firm_error_status = msg.firm_error_status;
    }
    else {
      resolved.firm_error_status = 0
    }

    if (msg.frame_ts !== undefined) {
      resolved.frame_ts = msg.frame_ts;
    }
    else {
      resolved.frame_ts = 0
    }

    if (msg.gear !== undefined) {
      resolved.gear = msg.gear;
    }
    else {
      resolved.gear = 0
    }

    if (msg.in_high_voltage !== undefined) {
      resolved.in_high_voltage = msg.in_high_voltage;
    }
    else {
      resolved.in_high_voltage = false
    }

    if (msg.is_charging !== undefined) {
      resolved.is_charging = msg.is_charging;
    }
    else {
      resolved.is_charging = false
    }

    if (msg.mileage !== undefined) {
      resolved.mileage = msg.mileage;
    }
    else {
      resolved.mileage = 0
    }

    if (msg.motion_mode !== undefined) {
      resolved.motion_mode = msg.motion_mode;
    }
    else {
      resolved.motion_mode = 0
    }

    if (msg.navi_id !== undefined) {
      resolved.navi_id = msg.navi_id;
    }
    else {
      resolved.navi_id = ''
    }

    if (msg.operational_status !== undefined) {
      resolved.operational_status = msg.operational_status;
    }
    else {
      resolved.operational_status = 0
    }

    if (msg.platform_state !== undefined) {
      resolved.platform_state = msg.platform_state;
    }
    else {
      resolved.platform_state = 0
    }

    if (msg.soc !== undefined) {
      resolved.soc = msg.soc;
    }
    else {
      resolved.soc = 0
    }

    if (msg.soh !== undefined) {
      resolved.soh = msg.soh;
    }
    else {
      resolved.soh = 0
    }

    if (msg.speed !== undefined) {
      resolved.speed = msg.speed;
    }
    else {
      resolved.speed = 0.0
    }

    if (msg.state_flow !== undefined) {
      resolved.state_flow = msg.state_flow;
    }
    else {
      resolved.state_flow = 0
    }

    if (msg.sub_target !== undefined) {
      resolved.sub_target = msg.sub_target;
    }
    else {
      resolved.sub_target = ''
    }

    if (msg.target !== undefined) {
      resolved.target = msg.target;
    }
    else {
      resolved.target = ''
    }

    if (msg.task_id !== undefined) {
      resolved.task_id = msg.task_id;
    }
    else {
      resolved.task_id = ''
    }

    if (msg.task_mode !== undefined) {
      resolved.task_mode = msg.task_mode;
    }
    else {
      resolved.task_mode = 0
    }

    if (msg.task_type !== undefined) {
      resolved.task_type = msg.task_type;
    }
    else {
      resolved.task_type = 0
    }

    if (msg.turn_light !== undefined) {
      resolved.turn_light = msg.turn_light;
    }
    else {
      resolved.turn_light = 0
    }

    if (msg.vehicle_error_status !== undefined) {
      resolved.vehicle_error_status = msg.vehicle_error_status;
    }
    else {
      resolved.vehicle_error_status = 0
    }

    if (msg.vin !== undefined) {
      resolved.vin = msg.vin;
    }
    else {
      resolved.vin = ''
    }

    return resolved;
    }
};

module.exports = act_status;
