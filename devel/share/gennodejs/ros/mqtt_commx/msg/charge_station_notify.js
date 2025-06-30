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

class charge_station_notify {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.code = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new cmd_Header();
      }
      if (initObj.hasOwnProperty('code')) {
        this.code = initObj.code
      }
      else {
        this.code = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type charge_station_notify
    // Serialize message field [header]
    bufferOffset = cmd_Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [code]
    bufferOffset = _serializer.int32(obj.code, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type charge_station_notify
    let len;
    let data = new charge_station_notify(null);
    // Deserialize message field [header]
    data.header = cmd_Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [code]
    data.code = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += cmd_Header.getMessageSize(object.header);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mqtt_commx/charge_station_notify';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e6208cf7671e976e6c3061bf8dbdd136';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    cmd_Header header
    int32 code   # 1 开始充电，2 停止充电
    
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
    const resolved = new charge_station_notify(null);
    if (msg.header !== undefined) {
      resolved.header = cmd_Header.Resolve(msg.header)
    }
    else {
      resolved.header = new cmd_Header()
    }

    if (msg.code !== undefined) {
      resolved.code = msg.code;
    }
    else {
      resolved.code = 0
    }

    return resolved;
    }
};

module.exports = charge_station_notify;
