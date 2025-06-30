; Auto-generated. Do not edit!


(cl:in-package mqtt_commx-msg)


;//! \htmlinclude fault_info_array.msg.html

(cl:defclass <fault_info_array> (roslisp-msg-protocol:ros-message)
  ((fault_info_data
    :reader fault_info_data
    :initarg :fault_info_data
    :type (cl:vector mqtt_commx-msg:fault_info)
   :initform (cl:make-array 0 :element-type 'mqtt_commx-msg:fault_info :initial-element (cl:make-instance 'mqtt_commx-msg:fault_info)))
   (timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:integer
    :initform 0))
)

(cl:defclass fault_info_array (<fault_info_array>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <fault_info_array>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'fault_info_array)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mqtt_commx-msg:<fault_info_array> is deprecated: use mqtt_commx-msg:fault_info_array instead.")))

(cl:ensure-generic-function 'fault_info_data-val :lambda-list '(m))
(cl:defmethod fault_info_data-val ((m <fault_info_array>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:fault_info_data-val is deprecated.  Use mqtt_commx-msg:fault_info_data instead.")
  (fault_info_data m))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <fault_info_array>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:timestamp-val is deprecated.  Use mqtt_commx-msg:timestamp instead.")
  (timestamp m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <fault_info_array>) ostream)
  "Serializes a message object of type '<fault_info_array>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'fault_info_data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'fault_info_data))
  (cl:let* ((signed (cl:slot-value msg 'timestamp)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <fault_info_array>) istream)
  "Deserializes a message object of type '<fault_info_array>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'fault_info_data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'fault_info_data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'mqtt_commx-msg:fault_info))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'timestamp) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<fault_info_array>)))
  "Returns string type for a message object of type '<fault_info_array>"
  "mqtt_commx/fault_info_array")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'fault_info_array)))
  "Returns string type for a message object of type 'fault_info_array"
  "mqtt_commx/fault_info_array")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<fault_info_array>)))
  "Returns md5sum for a message object of type '<fault_info_array>"
  "3b519e6234e93bf86de021428c1d9d96")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'fault_info_array)))
  "Returns md5sum for a message object of type 'fault_info_array"
  "3b519e6234e93bf86de021428c1d9d96")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<fault_info_array>)))
  "Returns full string definition for message of type '<fault_info_array>"
  (cl:format cl:nil "fault_info[] fault_info_data~%int64 timestamp~%================================================================================~%MSG: mqtt_commx/fault_info~%string desc~%int64 code~%int32 level~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'fault_info_array)))
  "Returns full string definition for message of type 'fault_info_array"
  (cl:format cl:nil "fault_info[] fault_info_data~%int64 timestamp~%================================================================================~%MSG: mqtt_commx/fault_info~%string desc~%int64 code~%int32 level~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <fault_info_array>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'fault_info_data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <fault_info_array>))
  "Converts a ROS message object to a list"
  (cl:list 'fault_info_array
    (cl:cons ':fault_info_data (fault_info_data msg))
    (cl:cons ':timestamp (timestamp msg))
))
