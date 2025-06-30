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

class path_point_action {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.caption = null;
      this.params = null;
    }
    else {
      if (initObj.hasOwnProperty('caption')) {
        this.caption = initObj.caption
      }
      else {
        this.caption = '';
      }
      if (initObj.hasOwnProperty('params')) {
        this.params = initObj.params
      }
      else {
        this.params = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type path_point_action
    // Serialize message field [caption]
    bufferOffset = _serializer.string(obj.caption, buffer, bufferOffset);
    // Serialize message field [params]
    bufferOffset = _arraySerializer.float32(obj.params, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type path_point_action
    let len;
    let data = new path_point_action(null);
    // Deserialize message field [caption]
    data.caption = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [params]
    data.params = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.caption);
    length += 4 * object.params.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mqtt_comm/path_point_action';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a5673b402e1654274f346fe24f513dd3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string caption
    float32[] params
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new path_point_action(null);
    if (msg.caption !== undefined) {
      resolved.caption = msg.caption;
    }
    else {
      resolved.caption = ''
    }

    if (msg.params !== undefined) {
      resolved.params = msg.params;
    }
    else {
      resolved.params = []
    }

    return resolved;
    }
};

module.exports = path_point_action;
