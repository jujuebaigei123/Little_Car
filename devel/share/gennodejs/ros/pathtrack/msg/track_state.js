// Auto-generated. Do not edit!

// (in-package pathtrack.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class track_state {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.timestamp = null;
      this.stopReason = null;
      this.self_turn_ctr = null;
      this.turnmode_ctr = null;
      this.track_angle_err = null;
      this.track_dis_err = null;
      this.aim_range = null;
      this.steering_property = null;
    }
    else {
      if (initObj.hasOwnProperty('timestamp')) {
        this.timestamp = initObj.timestamp
      }
      else {
        this.timestamp = 0;
      }
      if (initObj.hasOwnProperty('stopReason')) {
        this.stopReason = initObj.stopReason
      }
      else {
        this.stopReason = '';
      }
      if (initObj.hasOwnProperty('self_turn_ctr')) {
        this.self_turn_ctr = initObj.self_turn_ctr
      }
      else {
        this.self_turn_ctr = 0;
      }
      if (initObj.hasOwnProperty('turnmode_ctr')) {
        this.turnmode_ctr = initObj.turnmode_ctr
      }
      else {
        this.turnmode_ctr = 0;
      }
      if (initObj.hasOwnProperty('track_angle_err')) {
        this.track_angle_err = initObj.track_angle_err
      }
      else {
        this.track_angle_err = 0.0;
      }
      if (initObj.hasOwnProperty('track_dis_err')) {
        this.track_dis_err = initObj.track_dis_err
      }
      else {
        this.track_dis_err = 0.0;
      }
      if (initObj.hasOwnProperty('aim_range')) {
        this.aim_range = initObj.aim_range
      }
      else {
        this.aim_range = 0.0;
      }
      if (initObj.hasOwnProperty('steering_property')) {
        this.steering_property = initObj.steering_property
      }
      else {
        this.steering_property = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type track_state
    // Serialize message field [timestamp]
    bufferOffset = _serializer.int64(obj.timestamp, buffer, bufferOffset);
    // Serialize message field [stopReason]
    bufferOffset = _serializer.string(obj.stopReason, buffer, bufferOffset);
    // Serialize message field [self_turn_ctr]
    bufferOffset = _serializer.int32(obj.self_turn_ctr, buffer, bufferOffset);
    // Serialize message field [turnmode_ctr]
    bufferOffset = _serializer.int32(obj.turnmode_ctr, buffer, bufferOffset);
    // Serialize message field [track_angle_err]
    bufferOffset = _serializer.float32(obj.track_angle_err, buffer, bufferOffset);
    // Serialize message field [track_dis_err]
    bufferOffset = _serializer.float32(obj.track_dis_err, buffer, bufferOffset);
    // Serialize message field [aim_range]
    bufferOffset = _serializer.float32(obj.aim_range, buffer, bufferOffset);
    // Serialize message field [steering_property]
    bufferOffset = _serializer.float32(obj.steering_property, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type track_state
    let len;
    let data = new track_state(null);
    // Deserialize message field [timestamp]
    data.timestamp = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [stopReason]
    data.stopReason = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [self_turn_ctr]
    data.self_turn_ctr = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [turnmode_ctr]
    data.turnmode_ctr = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [track_angle_err]
    data.track_angle_err = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [track_dis_err]
    data.track_dis_err = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [aim_range]
    data.aim_range = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [steering_property]
    data.steering_property = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.stopReason);
    return length + 36;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pathtrack/track_state';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '976fb87d357afb82707050b80adee235';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 timestamp
    string stopReason
    int32 self_turn_ctr
    int32 turnmode_ctr
    float32 track_angle_err
    float32 track_dis_err
    float32 aim_range
    float32 steering_property
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new track_state(null);
    if (msg.timestamp !== undefined) {
      resolved.timestamp = msg.timestamp;
    }
    else {
      resolved.timestamp = 0
    }

    if (msg.stopReason !== undefined) {
      resolved.stopReason = msg.stopReason;
    }
    else {
      resolved.stopReason = ''
    }

    if (msg.self_turn_ctr !== undefined) {
      resolved.self_turn_ctr = msg.self_turn_ctr;
    }
    else {
      resolved.self_turn_ctr = 0
    }

    if (msg.turnmode_ctr !== undefined) {
      resolved.turnmode_ctr = msg.turnmode_ctr;
    }
    else {
      resolved.turnmode_ctr = 0
    }

    if (msg.track_angle_err !== undefined) {
      resolved.track_angle_err = msg.track_angle_err;
    }
    else {
      resolved.track_angle_err = 0.0
    }

    if (msg.track_dis_err !== undefined) {
      resolved.track_dis_err = msg.track_dis_err;
    }
    else {
      resolved.track_dis_err = 0.0
    }

    if (msg.aim_range !== undefined) {
      resolved.aim_range = msg.aim_range;
    }
    else {
      resolved.aim_range = 0.0
    }

    if (msg.steering_property !== undefined) {
      resolved.steering_property = msg.steering_property;
    }
    else {
      resolved.steering_property = 0.0
    }

    return resolved;
    }
};

module.exports = track_state;
