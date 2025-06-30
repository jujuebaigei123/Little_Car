; Auto-generated. Do not edit!


(cl:in-package mqtt_comm-msg)


;//! \htmlinclude mqtt_task.msg.html

(cl:defclass <mqtt_task> (roslisp-msg-protocol:ros-message)
  ((msgType
    :reader msgType
    :initarg :msgType
    :type cl:string
    :initform "")
   (timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:integer
    :initform 0)
   (taskId
    :reader taskId
    :initarg :taskId
    :type cl:string
    :initform "")
   (pathId
    :reader pathId
    :initarg :pathId
    :type cl:string
    :initform "")
   (workIds
    :reader workIds
    :initarg :workIds
    :type cl:string
    :initform ""))
)

(cl:defclass mqtt_task (<mqtt_task>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <mqtt_task>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'mqtt_task)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mqtt_comm-msg:<mqtt_task> is deprecated: use mqtt_comm-msg:mqtt_task instead.")))

(cl:ensure-generic-function 'msgType-val :lambda-list '(m))
(cl:defmethod msgType-val ((m <mqtt_task>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:msgType-val is deprecated.  Use mqtt_comm-msg:msgType instead.")
  (msgType m))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <mqtt_task>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:timestamp-val is deprecated.  Use mqtt_comm-msg:timestamp instead.")
  (timestamp m))

(cl:ensure-generic-function 'taskId-val :lambda-list '(m))
(cl:defmethod taskId-val ((m <mqtt_task>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:taskId-val is deprecated.  Use mqtt_comm-msg:taskId instead.")
  (taskId m))

(cl:ensure-generic-function 'pathId-val :lambda-list '(m))
(cl:defmethod pathId-val ((m <mqtt_task>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:pathId-val is deprecated.  Use mqtt_comm-msg:pathId instead.")
  (pathId m))

(cl:ensure-generic-function 'workIds-val :lambda-list '(m))
(cl:defmethod workIds-val ((m <mqtt_task>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:workIds-val is deprecated.  Use mqtt_comm-msg:workIds instead.")
  (workIds m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <mqtt_task>) ostream)
  "Serializes a message object of type '<mqtt_task>"
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
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'taskId))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'taskId))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'pathId))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'pathId))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'workIds))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'workIds))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <mqtt_task>) istream)
  "Deserializes a message object of type '<mqtt_task>"
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
      (cl:setf (cl:slot-value msg 'pathId) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'pathId) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'workIds) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'workIds) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<mqtt_task>)))
  "Returns string type for a message object of type '<mqtt_task>"
  "mqtt_comm/mqtt_task")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mqtt_task)))
  "Returns string type for a message object of type 'mqtt_task"
  "mqtt_comm/mqtt_task")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<mqtt_task>)))
  "Returns md5sum for a message object of type '<mqtt_task>"
  "5572e97389f79226a529e1c9cb1b09e6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'mqtt_task)))
  "Returns md5sum for a message object of type 'mqtt_task"
  "5572e97389f79226a529e1c9cb1b09e6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<mqtt_task>)))
  "Returns full string definition for message of type '<mqtt_task>"
  (cl:format cl:nil "string msgType~%int64 timestamp~%string taskId~%string pathId~%string workIds~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'mqtt_task)))
  "Returns full string definition for message of type 'mqtt_task"
  (cl:format cl:nil "string msgType~%int64 timestamp~%string taskId~%string pathId~%string workIds~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <mqtt_task>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'msgType))
     8
     4 (cl:length (cl:slot-value msg 'taskId))
     4 (cl:length (cl:slot-value msg 'pathId))
     4 (cl:length (cl:slot-value msg 'workIds))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <mqtt_task>))
  "Converts a ROS message object to a list"
  (cl:list 'mqtt_task
    (cl:cons ':msgType (msgType msg))
    (cl:cons ':timestamp (timestamp msg))
    (cl:cons ':taskId (taskId msg))
    (cl:cons ':pathId (pathId msg))
    (cl:cons ':workIds (workIds msg))
))
