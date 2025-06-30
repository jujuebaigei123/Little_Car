; Auto-generated. Do not edit!


(cl:in-package mqtt_comm-msg)


;//! \htmlinclude mqtt_controls.msg.html

(cl:defclass <mqtt_controls> (roslisp-msg-protocol:ros-message)
  ((msgType
    :reader msgType
    :initarg :msgType
    :type cl:string
    :initform "")
   (ctrlType
    :reader ctrlType
    :initarg :ctrlType
    :type cl:string
    :initform "")
   (value
    :reader value
    :initarg :value
    :type cl:integer
    :initform 0))
)

(cl:defclass mqtt_controls (<mqtt_controls>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <mqtt_controls>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'mqtt_controls)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mqtt_comm-msg:<mqtt_controls> is deprecated: use mqtt_comm-msg:mqtt_controls instead.")))

(cl:ensure-generic-function 'msgType-val :lambda-list '(m))
(cl:defmethod msgType-val ((m <mqtt_controls>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:msgType-val is deprecated.  Use mqtt_comm-msg:msgType instead.")
  (msgType m))

(cl:ensure-generic-function 'ctrlType-val :lambda-list '(m))
(cl:defmethod ctrlType-val ((m <mqtt_controls>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:ctrlType-val is deprecated.  Use mqtt_comm-msg:ctrlType instead.")
  (ctrlType m))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <mqtt_controls>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:value-val is deprecated.  Use mqtt_comm-msg:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <mqtt_controls>) ostream)
  "Serializes a message object of type '<mqtt_controls>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'msgType))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'msgType))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'ctrlType))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'ctrlType))
  (cl:let* ((signed (cl:slot-value msg 'value)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <mqtt_controls>) istream)
  "Deserializes a message object of type '<mqtt_controls>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'msgType) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'msgType) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ctrlType) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'ctrlType) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'value) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<mqtt_controls>)))
  "Returns string type for a message object of type '<mqtt_controls>"
  "mqtt_comm/mqtt_controls")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mqtt_controls)))
  "Returns string type for a message object of type 'mqtt_controls"
  "mqtt_comm/mqtt_controls")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<mqtt_controls>)))
  "Returns md5sum for a message object of type '<mqtt_controls>"
  "72ea1fe4c09d3fce0f4c7c6c75183cc5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'mqtt_controls)))
  "Returns md5sum for a message object of type 'mqtt_controls"
  "72ea1fe4c09d3fce0f4c7c6c75183cc5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<mqtt_controls>)))
  "Returns full string definition for message of type '<mqtt_controls>"
  (cl:format cl:nil "string msgType~%string ctrlType~%int32 value~%~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'mqtt_controls)))
  "Returns full string definition for message of type 'mqtt_controls"
  (cl:format cl:nil "string msgType~%string ctrlType~%int32 value~%~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <mqtt_controls>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'msgType))
     4 (cl:length (cl:slot-value msg 'ctrlType))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <mqtt_controls>))
  "Converts a ROS message object to a list"
  (cl:list 'mqtt_controls
    (cl:cons ':msgType (msgType msg))
    (cl:cons ':ctrlType (ctrlType msg))
    (cl:cons ':value (value msg))
))
