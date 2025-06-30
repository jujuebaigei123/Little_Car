// Auto-generated. Do not edit!

// (in-package gps.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class MyGPS_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.Lat = null;
      this.Lon = null;
      this.UTM_X = null;
      this.UTM_Y = null;
      this.Angle = null;
      this.map_x = null;
      this.map_y = null;
      this.raw_UTM_X = null;
      this.raw_UTM_Y = null;
      this.raw_Angle = null;
      this.raw_map_x = null;
      this.raw_map_y = null;
      this.mqtt_angle = null;
      this.Vel = null;
      this.Quality = null;
      this.HeartBeat = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('Lat')) {
        this.Lat = initObj.Lat
      }
      else {
        this.Lat = 0.0;
      }
      if (initObj.hasOwnProperty('Lon')) {
        this.Lon = initObj.Lon
      }
      else {
        this.Lon = 0.0;
      }
      if (initObj.hasOwnProperty('UTM_X')) {
        this.UTM_X = initObj.UTM_X
      }
      else {
        this.UTM_X = 0.0;
      }
      if (initObj.hasOwnProperty('UTM_Y')) {
        this.UTM_Y = initObj.UTM_Y
      }
      else {
        this.UTM_Y = 0.0;
      }
      if (initObj.hasOwnProperty('Angle')) {
        this.Angle = initObj.Angle
      }
      else {
        this.Angle = 0.0;
      }
      if (initObj.hasOwnProperty('map_x')) {
        this.map_x = initObj.map_x
      }
      else {
        this.map_x = 0.0;
      }
      if (initObj.hasOwnProperty('map_y')) {
        this.map_y = initObj.map_y
      }
      else {
        this.map_y = 0.0;
      }
      if (initObj.hasOwnProperty('raw_UTM_X')) {
        this.raw_UTM_X = initObj.raw_UTM_X
      }
      else {
        this.raw_UTM_X = 0.0;
      }
      if (initObj.hasOwnProperty('raw_UTM_Y')) {
        this.raw_UTM_Y = initObj.raw_UTM_Y
      }
      else {
        this.raw_UTM_Y = 0.0;
      }
      if (initObj.hasOwnProperty('raw_Angle')) {
        this.raw_Angle = initObj.raw_Angle
      }
      else {
        this.raw_Angle = 0.0;
      }
      if (initObj.hasOwnProperty('raw_map_x')) {
        this.raw_map_x = initObj.raw_map_x
      }
      else {
        this.raw_map_x = 0.0;
      }
      if (initObj.hasOwnProperty('raw_map_y')) {
        this.raw_map_y = initObj.raw_map_y
      }
      else {
        this.raw_map_y = 0.0;
      }
      if (initObj.hasOwnProperty('mqtt_angle')) {
        this.mqtt_angle = initObj.mqtt_angle
      }
      else {
        this.mqtt_angle = 0.0;
      }
      if (initObj.hasOwnProperty('Vel')) {
        this.Vel = initObj.Vel
      }
      else {
        this.Vel = 0.0;
      }
      if (initObj.hasOwnProperty('Quality')) {
        this.Quality = initObj.Quality
      }
      else {
        this.Quality = 0;
      }
      if (initObj.hasOwnProperty('HeartBeat')) {
        this.HeartBeat = initObj.HeartBeat
      }
      else {
        this.HeartBeat = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MyGPS_msg
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [Lat]
    bufferOffset = _serializer.float64(obj.Lat, buffer, bufferOffset);
    // Serialize message field [Lon]
    bufferOffset = _serializer.float64(obj.Lon, buffer, bufferOffset);
    // Serialize message field [UTM_X]
    bufferOffset = _serializer.float64(obj.UTM_X, buffer, bufferOffset);
    // Serialize message field [UTM_Y]
    bufferOffset = _serializer.float64(obj.UTM_Y, buffer, bufferOffset);
    // Serialize message field [Angle]
    bufferOffset = _serializer.float64(obj.Angle, buffer, bufferOffset);
    // Serialize message field [map_x]
    bufferOffset = _serializer.float64(obj.map_x, buffer, bufferOffset);
    // Serialize message field [map_y]
    bufferOffset = _serializer.float64(obj.map_y, buffer, bufferOffset);
    // Serialize message field [raw_UTM_X]
    bufferOffset = _serializer.float64(obj.raw_UTM_X, buffer, bufferOffset);
    // Serialize message field [raw_UTM_Y]
    bufferOffset = _serializer.float64(obj.raw_UTM_Y, buffer, bufferOffset);
    // Serialize message field [raw_Angle]
    bufferOffset = _serializer.float64(obj.raw_Angle, buffer, bufferOffset);
    // Serialize message field [raw_map_x]
    bufferOffset = _serializer.float64(obj.raw_map_x, buffer, bufferOffset);
    // Serialize message field [raw_map_y]
    bufferOffset = _serializer.float64(obj.raw_map_y, buffer, bufferOffset);
    // Serialize message field [mqtt_angle]
    bufferOffset = _serializer.float64(obj.mqtt_angle, buffer, bufferOffset);
    // Serialize message field [Vel]
    bufferOffset = _serializer.float64(obj.Vel, buffer, bufferOffset);
    // Serialize message field [Quality]
    bufferOffset = _serializer.int8(obj.Quality, buffer, bufferOffset);
    // Serialize message field [HeartBeat]
    bufferOffset = _serializer.int8(obj.HeartBeat, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MyGPS_msg
    let len;
    let data = new MyGPS_msg(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [Lat]
    data.Lat = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Lon]
    data.Lon = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [UTM_X]
    data.UTM_X = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [UTM_Y]
    data.UTM_Y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Angle]
    data.Angle = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [map_x]
    data.map_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [map_y]
    data.map_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [raw_UTM_X]
    data.raw_UTM_X = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [raw_UTM_Y]
    data.raw_UTM_Y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [raw_Angle]
    data.raw_Angle = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [raw_map_x]
    data.raw_map_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [raw_map_y]
    data.raw_map_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [mqtt_angle]
    data.mqtt_angle = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Vel]
    data.Vel = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Quality]
    data.Quality = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [HeartBeat]
    data.HeartBeat = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 114;
  }

  static datatype() {
    // Returns string type for a message object
    return 'gps/MyGPS_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '026ac90c0e99c71302e8b4f4029817a8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header 
    float64 Lat
    float64 Lon
    float64 UTM_X
    float64 UTM_Y
    float64 Angle
    float64 map_x
    float64 map_y
    
    float64 raw_UTM_X
    float64 raw_UTM_Y
    float64 raw_Angle
    float64 raw_map_x
    float64 raw_map_y
    
    float64 mqtt_angle
    
    float64 Vel
    int8 Quality
    int8 HeartBeat
    
    
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MyGPS_msg(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.Lat !== undefined) {
      resolved.Lat = msg.Lat;
    }
    else {
      resolved.Lat = 0.0
    }

    if (msg.Lon !== undefined) {
      resolved.Lon = msg.Lon;
    }
    else {
      resolved.Lon = 0.0
    }

    if (msg.UTM_X !== undefined) {
      resolved.UTM_X = msg.UTM_X;
    }
    else {
      resolved.UTM_X = 0.0
    }

    if (msg.UTM_Y !== undefined) {
      resolved.UTM_Y = msg.UTM_Y;
    }
    else {
      resolved.UTM_Y = 0.0
    }

    if (msg.Angle !== undefined) {
      resolved.Angle = msg.Angle;
    }
    else {
      resolved.Angle = 0.0
    }

    if (msg.map_x !== undefined) {
      resolved.map_x = msg.map_x;
    }
    else {
      resolved.map_x = 0.0
    }

    if (msg.map_y !== undefined) {
      resolved.map_y = msg.map_y;
    }
    else {
      resolved.map_y = 0.0
    }

    if (msg.raw_UTM_X !== undefined) {
      resolved.raw_UTM_X = msg.raw_UTM_X;
    }
    else {
      resolved.raw_UTM_X = 0.0
    }

    if (msg.raw_UTM_Y !== undefined) {
      resolved.raw_UTM_Y = msg.raw_UTM_Y;
    }
    else {
      resolved.raw_UTM_Y = 0.0
    }

    if (msg.raw_Angle !== undefined) {
      resolved.raw_Angle = msg.raw_Angle;
    }
    else {
      resolved.raw_Angle = 0.0
    }

    if (msg.raw_map_x !== undefined) {
      resolved.raw_map_x = msg.raw_map_x;
    }
    else {
      resolved.raw_map_x = 0.0
    }

    if (msg.raw_map_y !== undefined) {
      resolved.raw_map_y = msg.raw_map_y;
    }
    else {
      resolved.raw_map_y = 0.0
    }

    if (msg.mqtt_angle !== undefined) {
      resolved.mqtt_angle = msg.mqtt_angle;
    }
    else {
      resolved.mqtt_angle = 0.0
    }

    if (msg.Vel !== undefined) {
      resolved.Vel = msg.Vel;
    }
    else {
      resolved.Vel = 0.0
    }

    if (msg.Quality !== undefined) {
      resolved.Quality = msg.Quality;
    }
    else {
      resolved.Quality = 0
    }

    if (msg.HeartBeat !== undefined) {
      resolved.HeartBeat = msg.HeartBeat;
    }
    else {
      resolved.HeartBeat = 0
    }

    return resolved;
    }
};

module.exports = MyGPS_msg;
