// Auto-generated. Do not edit!

// (in-package mqtt_commx.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class iot_path_point {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.direction = null;
      this.type = null;
      this.driving_direction = null;
      this.id = null;
      this.speed_vmax = null;
      this.vmax_dev = null;
      this.lane_type = null;
      this.pointX = null;
      this.pointY = null;
      this.pointHA = null;
    }
    else {
      if (initObj.hasOwnProperty('direction')) {
        this.direction = initObj.direction
      }
      else {
        this.direction = 0;
      }
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = 0;
      }
      if (initObj.hasOwnProperty('driving_direction')) {
        this.driving_direction = initObj.driving_direction
      }
      else {
        this.driving_direction = 0;
      }
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = '';
      }
      if (initObj.hasOwnProperty('speed_vmax')) {
        this.speed_vmax = initObj.speed_vmax
      }
      else {
        this.speed_vmax = 0.0;
      }
      if (initObj.hasOwnProperty('vmax_dev')) {
        this.vmax_dev = initObj.vmax_dev
      }
      else {
        this.vmax_dev = 0.0;
      }
      if (initObj.hasOwnProperty('lane_type')) {
        this.lane_type = initObj.lane_type
      }
      else {
        this.lane_type = 0;
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
      if (initObj.hasOwnProperty('pointHA')) {
        this.pointHA = initObj.pointHA
      }
      else {
        this.pointHA = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type iot_path_point
    // Serialize message field [direction]
    bufferOffset = _serializer.int32(obj.direction, buffer, bufferOffset);
    // Serialize message field [type]
    bufferOffset = _serializer.int32(obj.type, buffer, bufferOffset);
    // Serialize message field [driving_direction]
    bufferOffset = _serializer.int32(obj.driving_direction, buffer, bufferOffset);
    // Serialize message field [id]
    bufferOffset = _serializer.string(obj.id, buffer, bufferOffset);
    // Serialize message field [speed_vmax]
    bufferOffset = _serializer.float32(obj.speed_vmax, buffer, bufferOffset);
    // Serialize message field [vmax_dev]
    bufferOffset = _serializer.float32(obj.vmax_dev, buffer, bufferOffset);
    // Serialize message field [lane_type]
    bufferOffset = _serializer.int32(obj.lane_type, buffer, bufferOffset);
    // Serialize message field [pointX]
    bufferOffset = _serializer.float64(obj.pointX, buffer, bufferOffset);
    // Serialize message field [pointY]
    bufferOffset = _serializer.float64(obj.pointY, buffer, bufferOffset);
    // Serialize message field [pointHA]
    bufferOffset = _serializer.float64(obj.pointHA, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type iot_path_point
    let len;
    let data = new iot_path_point(null);
    // Deserialize message field [direction]
    data.direction = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [type]
    data.type = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [driving_direction]
    data.driving_direction = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [id]
    data.id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [speed_vmax]
    data.speed_vmax = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [vmax_dev]
    data.vmax_dev = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [lane_type]
    data.lane_type = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [pointX]
    data.pointX = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pointY]
    data.pointY = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pointHA]
    data.pointHA = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.id);
    return length + 52;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mqtt_commx/iot_path_point';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f109249047779f0f5bde21421b2af811';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 direction
    int32 type
    int32 driving_direction
    string id
    float32 speed_vmax
    float32 vmax_dev
    int32 lane_type
    
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
    const resolved = new iot_path_point(null);
    if (msg.direction !== undefined) {
      resolved.direction = msg.direction;
    }
    else {
      resolved.direction = 0
    }

    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = 0
    }

    if (msg.driving_direction !== undefined) {
      resolved.driving_direction = msg.driving_direction;
    }
    else {
      resolved.driving_direction = 0
    }

    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = ''
    }

    if (msg.speed_vmax !== undefined) {
      resolved.speed_vmax = msg.speed_vmax;
    }
    else {
      resolved.speed_vmax = 0.0
    }

    if (msg.vmax_dev !== undefined) {
      resolved.vmax_dev = msg.vmax_dev;
    }
    else {
      resolved.vmax_dev = 0.0
    }

    if (msg.lane_type !== undefined) {
      resolved.lane_type = msg.lane_type;
    }
    else {
      resolved.lane_type = 0
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

    if (msg.pointHA !== undefined) {
      resolved.pointHA = msg.pointHA;
    }
    else {
      resolved.pointHA = 0.0
    }

    return resolved;
    }
};

module.exports = iot_path_point;
