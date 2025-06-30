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

class cmd_Header {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.trace_id = null;
      this.trans_id = null;
      this.che_id = null;
      this.timestamp = null;
      this.version = null;
    }
    else {
      if (initObj.hasOwnProperty('trace_id')) {
        this.trace_id = initObj.trace_id
      }
      else {
        this.trace_id = '';
      }
      if (initObj.hasOwnProperty('trans_id')) {
        this.trans_id = initObj.trans_id
      }
      else {
        this.trans_id = '';
      }
      if (initObj.hasOwnProperty('che_id')) {
        this.che_id = initObj.che_id
      }
      else {
        this.che_id = '';
      }
      if (initObj.hasOwnProperty('timestamp')) {
        this.timestamp = initObj.timestamp
      }
      else {
        this.timestamp = '';
      }
      if (initObj.hasOwnProperty('version')) {
        this.version = initObj.version
      }
      else {
        this.version = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type cmd_Header
    // Serialize message field [trace_id]
    bufferOffset = _serializer.string(obj.trace_id, buffer, bufferOffset);
    // Serialize message field [trans_id]
    bufferOffset = _serializer.string(obj.trans_id, buffer, bufferOffset);
    // Serialize message field [che_id]
    bufferOffset = _serializer.string(obj.che_id, buffer, bufferOffset);
    // Serialize message field [timestamp]
    bufferOffset = _serializer.string(obj.timestamp, buffer, bufferOffset);
    // Serialize message field [version]
    bufferOffset = _serializer.string(obj.version, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type cmd_Header
    let len;
    let data = new cmd_Header(null);
    // Deserialize message field [trace_id]
    data.trace_id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [trans_id]
    data.trans_id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [che_id]
    data.che_id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [timestamp]
    data.timestamp = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [version]
    data.version = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.trace_id);
    length += _getByteLength(object.trans_id);
    length += _getByteLength(object.che_id);
    length += _getByteLength(object.timestamp);
    length += _getByteLength(object.version);
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mqtt_commx/cmd_Header';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '66f32081d780bd2a95b49f4e58ebf381';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new cmd_Header(null);
    if (msg.trace_id !== undefined) {
      resolved.trace_id = msg.trace_id;
    }
    else {
      resolved.trace_id = ''
    }

    if (msg.trans_id !== undefined) {
      resolved.trans_id = msg.trans_id;
    }
    else {
      resolved.trans_id = ''
    }

    if (msg.che_id !== undefined) {
      resolved.che_id = msg.che_id;
    }
    else {
      resolved.che_id = ''
    }

    if (msg.timestamp !== undefined) {
      resolved.timestamp = msg.timestamp;
    }
    else {
      resolved.timestamp = ''
    }

    if (msg.version !== undefined) {
      resolved.version = msg.version;
    }
    else {
      resolved.version = ''
    }

    return resolved;
    }
};

module.exports = cmd_Header;
