; Auto-generated. Do not edit!


(cl:in-package mqtt_commx-msg)


;//! \htmlinclude fault_info.msg.html

(cl:defclass <fault_info> (roslisp-msg-protocol:ros-message)
  ((desc
    :reader desc
    :initarg :desc
    :type cl:string
    :initform "")
   (code
    :reader code
    :initarg :code
    :type cl:integer
    :initform 0)
   (level
    :reader level
    :initarg :level
    :type cl:integer
    :initform 0))
)

(cl:defclass fault_info (<fault_info>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <fault_info>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'fault_info)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mqtt_commx-msg:<fault_info> is deprecated: use mqtt_commx-msg:fault_info instead.")))

(cl:ensure-generic-function 'desc-val :lambda-list '(m))
(cl:defmethod desc-val ((m <fault_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:desc-val is deprecated.  Use mqtt_commx-msg:desc instead.")
  (desc m))

(cl:ensure-generic-function 'code-val :lambda-list '(m))
(cl:defmethod code-val ((m <fault_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:code-val is deprecated.  Use mqtt_commx-msg:code instead.")
  (code m))

(cl:ensure-generic-function 'level-val :lambda-list '(m))
(cl:defmethod level-val ((m <fault_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:level-val is deprecated.  Use mqtt_commx-msg:level instead.")
  (level m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <fault_info>) ostream)
  "Serializes a message object of type '<fault_info>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'desc))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'desc))
  (cl:let* ((signed (cl:slot-value msg 'code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'level)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <fault_info>) istream)
  "Deserializes a message object of type '<fault_info>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'desc) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'desc) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'code) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'level) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<fault_info>)))
  "Returns string type for a message object of type '<fault_info>"
  "mqtt_commx/fault_info")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'fault_info)))
  "Returns string type for a message object of type 'fault_info"
  "mqtt_commx/fault_info")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<fault_info>)))
  "Returns md5sum for a message object of type '<fault_info>"
  "95e3250e1d1ef52a3c756cce9a37436a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'fault_info)))
  "Returns md5sum for a message object of type 'fault_info"
  "95e3250e1d1ef52a3c756cce9a37436a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<fault_info>)))
  "Returns full string definition for message of type '<fault_info>"
  (cl:format cl:nil "string desc~%int64 code~%int32 level~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'fault_info)))
  "Returns full string definition for message of type 'fault_info"
  (cl:format cl:nil "string desc~%int64 code~%int32 level~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <fault_info>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'desc))
     8
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <fault_info>))
  "Converts a ROS message object to a list"
  (cl:list 'fault_info
    (cl:cons ':desc (desc msg))
    (cl:cons ':code (code msg))
    (cl:cons ':level (level msg))
))
