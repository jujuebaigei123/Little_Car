; Auto-generated. Do not edit!


(cl:in-package mqtt_comm-msg)


;//! \htmlinclude resp_video.msg.html

(cl:defclass <resp_video> (roslisp-msg-protocol:ros-message)
  ((agvId
    :reader agvId
    :initarg :agvId
    :type cl:string
    :initform "")
   (msgType
    :reader msgType
    :initarg :msgType
    :type cl:string
    :initform "")
   (timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:integer
    :initform 0)
   (result
    :reader result
    :initarg :result
    :type cl:integer
    :initform 0))
)

(cl:defclass resp_video (<resp_video>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <resp_video>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'resp_video)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mqtt_comm-msg:<resp_video> is deprecated: use mqtt_comm-msg:resp_video instead.")))

(cl:ensure-generic-function 'agvId-val :lambda-list '(m))
(cl:defmethod agvId-val ((m <resp_video>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:agvId-val is deprecated.  Use mqtt_comm-msg:agvId instead.")
  (agvId m))

(cl:ensure-generic-function 'msgType-val :lambda-list '(m))
(cl:defmethod msgType-val ((m <resp_video>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:msgType-val is deprecated.  Use mqtt_comm-msg:msgType instead.")
  (msgType m))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <resp_video>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:timestamp-val is deprecated.  Use mqtt_comm-msg:timestamp instead.")
  (timestamp m))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <resp_video>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:result-val is deprecated.  Use mqtt_comm-msg:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <resp_video>) ostream)
  "Serializes a message object of type '<resp_video>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'agvId))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'agvId))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'msgType))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'msgType))
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
  (cl:let* ((signed (cl:slot-value msg 'result)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <resp_video>) istream)
  "Deserializes a message object of type '<resp_video>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'agvId) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'agvId) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'msgType) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'msgType) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'result) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<resp_video>)))
  "Returns string type for a message object of type '<resp_video>"
  "mqtt_comm/resp_video")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'resp_video)))
  "Returns string type for a message object of type 'resp_video"
  "mqtt_comm/resp_video")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<resp_video>)))
  "Returns md5sum for a message object of type '<resp_video>"
  "a8df69503833d0a76a10ba40c1b67964")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'resp_video)))
  "Returns md5sum for a message object of type 'resp_video"
  "a8df69503833d0a76a10ba40c1b67964")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<resp_video>)))
  "Returns full string definition for message of type '<resp_video>"
  (cl:format cl:nil "string agvId ~%string msgType~%int64 timestamp~%int32 result ~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'resp_video)))
  "Returns full string definition for message of type 'resp_video"
  (cl:format cl:nil "string agvId ~%string msgType~%int64 timestamp~%int32 result ~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <resp_video>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'agvId))
     4 (cl:length (cl:slot-value msg 'msgType))
     8
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <resp_video>))
  "Converts a ROS message object to a list"
  (cl:list 'resp_video
    (cl:cons ':agvId (agvId msg))
    (cl:cons ':msgType (msgType msg))
    (cl:cons ':timestamp (timestamp msg))
    (cl:cons ':result (result msg))
))
