; Auto-generated. Do not edit!


(cl:in-package mqtt_commx-msg)


;//! \htmlinclude iot_controls.msg.html

(cl:defclass <iot_controls> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type mqtt_commx-msg:cmd_Header
    :initform (cl:make-instance 'mqtt_commx-msg:cmd_Header))
   (taskId
    :reader taskId
    :initarg :taskId
    :type cl:string
    :initform "")
   (sender
    :reader sender
    :initarg :sender
    :type cl:string
    :initform "")
   (type
    :reader type
    :initarg :type
    :type cl:integer
    :initform 0))
)

(cl:defclass iot_controls (<iot_controls>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <iot_controls>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'iot_controls)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mqtt_commx-msg:<iot_controls> is deprecated: use mqtt_commx-msg:iot_controls instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <iot_controls>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:header-val is deprecated.  Use mqtt_commx-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'taskId-val :lambda-list '(m))
(cl:defmethod taskId-val ((m <iot_controls>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:taskId-val is deprecated.  Use mqtt_commx-msg:taskId instead.")
  (taskId m))

(cl:ensure-generic-function 'sender-val :lambda-list '(m))
(cl:defmethod sender-val ((m <iot_controls>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:sender-val is deprecated.  Use mqtt_commx-msg:sender instead.")
  (sender m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <iot_controls>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:type-val is deprecated.  Use mqtt_commx-msg:type instead.")
  (type m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <iot_controls>) ostream)
  "Serializes a message object of type '<iot_controls>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'taskId))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'taskId))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'sender))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'sender))
  (cl:let* ((signed (cl:slot-value msg 'type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <iot_controls>) istream)
  "Deserializes a message object of type '<iot_controls>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'taskId) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'taskId) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sender) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'sender) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<iot_controls>)))
  "Returns string type for a message object of type '<iot_controls>"
  "mqtt_commx/iot_controls")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'iot_controls)))
  "Returns string type for a message object of type 'iot_controls"
  "mqtt_commx/iot_controls")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<iot_controls>)))
  "Returns md5sum for a message object of type '<iot_controls>"
  "b9b2f391bdff2d6855dabf27c7ac37e1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'iot_controls)))
  "Returns md5sum for a message object of type 'iot_controls"
  "b9b2f391bdff2d6855dabf27c7ac37e1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<iot_controls>)))
  "Returns full string definition for message of type '<iot_controls>"
  (cl:format cl:nil "cmd_Header header~%~%~%string taskId  #作业任务的id~%string sender  #默认值~%int64 type     #作业命令：急停1、完成任务2、取消任务3、恢复行驶5、缓停8~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%================================================================================~%MSG: mqtt_commx/cmd_Header~%string trace_id~%string trans_id~%string che_id~%string timestamp~%string version~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'iot_controls)))
  "Returns full string definition for message of type 'iot_controls"
  (cl:format cl:nil "cmd_Header header~%~%~%string taskId  #作业任务的id~%string sender  #默认值~%int64 type     #作业命令：急停1、完成任务2、取消任务3、恢复行驶5、缓停8~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%================================================================================~%MSG: mqtt_commx/cmd_Header~%string trace_id~%string trans_id~%string che_id~%string timestamp~%string version~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <iot_controls>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'taskId))
     4 (cl:length (cl:slot-value msg 'sender))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <iot_controls>))
  "Converts a ROS message object to a list"
  (cl:list 'iot_controls
    (cl:cons ':header (header msg))
    (cl:cons ':taskId (taskId msg))
    (cl:cons ':sender (sender msg))
    (cl:cons ':type (type msg))
))
