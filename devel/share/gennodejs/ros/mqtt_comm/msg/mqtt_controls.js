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

class mqtt_controls {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.msgType = null;
      this.ctrlType = null;
      this.value = null;
    }
    else {
      if (initObj.hasOwnProperty('msgType')) {
        this.msgType = initObj.msgType
      }
      else {
        this.msgType = '';
      }
      if (initObj.hasOwnProperty('ctrlType')) {
        this.ctrlType = initObj.ctrlType
      }
      else {
        this.ctrlType = '';
      }
      if (initObj.hasOwnProperty('value')) {
        this.value = initObj.value
      }
      else {
        this.value = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type mqtt_controls
    // Serialize message field [msgType]
    bufferOffset = _serializer.string(obj.msgType, buffer, bufferOffset);
    // Serialize message field [ctrlType]
    bufferOffset = _serializer.string(obj.ctrlType, buffer, bufferOffset);
    // Serialize message field [value]
    bufferOffset = _serializer.int32(obj.value, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type mqtt_controls
    let len;
    let data = new mqtt_controls(null);
    // Deserialize message field [msgType]
    data.msgType = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [ctrlType]
    data.ctrlType = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [value]
    data.value = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.msgType);
    length += _getByteLength(object.ctrlType);
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mqtt_comm/mqtt_controls';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '72ea1fe4c09d3fce0f4c7c6c75183cc5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string msgType
    string ctrlType
    int32 value
    
    
    
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new mqtt_controls(null);
    if (msg.msgType !== undefined) {
      resolved.msgType = msg.msgType;
    }
    else {
      resolved.msgType = ''
    }

    if (msg.ctrlType !== undefined) {
      resolved.ctrlType = msg.ctrlType;
    }
    else {
      resolved.ctrlType = ''
    }

    if (msg.value !== undefined) {
      resolved.value = msg.value;
    }
    else {
      resolved.value = 0
    }

    return resolved;
    }
};

module.exports = mqtt_controls;
