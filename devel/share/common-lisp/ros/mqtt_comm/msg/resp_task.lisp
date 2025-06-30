; Auto-generated. Do not edit!


(cl:in-package mqtt_comm-msg)


;//! \htmlinclude resp_task.msg.html

(cl:defclass <resp_task> (roslisp-msg-protocol:ros-message)
  ((msgType
    :reader msgType
    :initarg :msgType
    :type cl:string
    :initform "")
   (agvId
    :reader agvId
    :initarg :agvId
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
    :type cl:integer
    :initform 0)
   (subTaskIndex
    :reader subTaskIndex
    :initarg :subTaskIndex
    :type cl:integer
    :initform 0))
)

(cl:defclass resp_task (<resp_task>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <resp_task>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'resp_task)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mqtt_comm-msg:<resp_task> is deprecated: use mqtt_comm-msg:resp_task instead.")))

(cl:ensure-generic-function 'msgType-val :lambda-list '(m))
(cl:defmethod msgType-val ((m <resp_task>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:msgType-val is deprecated.  Use mqtt_comm-msg:msgType instead.")
  (msgType m))

(cl:ensure-generic-function 'agvId-val :lambda-list '(m))
(cl:defmethod agvId-val ((m <resp_task>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:agvId-val is deprecated.  Use mqtt_comm-msg:agvId instead.")
  (agvId m))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <resp_task>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:timestamp-val is deprecated.  Use mqtt_comm-msg:timestamp instead.")
  (timestamp m))

(cl:ensure-generic-function 'taskId-val :lambda-list '(m))
(cl:defmethod taskId-val ((m <resp_task>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:taskId-val is deprecated.  Use mqtt_comm-msg:taskId instead.")
  (taskId m))

(cl:ensure-generic-function 'subTaskIndex-val :lambda-list '(m))
(cl:defmethod subTaskIndex-val ((m <resp_task>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:subTaskIndex-val is deprecated.  Use mqtt_comm-msg:subTaskIndex instead.")
  (subTaskIndex m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <resp_task>) ostream)
  "Serializes a message object of type '<resp_task>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'msgType))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'msgType))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'agvId))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'agvId))
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
  (cl:let* ((signed (cl:slot-value msg 'taskId)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'subTaskIndex)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <resp_task>) istream)
  "Deserializes a message object of type '<resp_task>"
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
      (cl:setf (cl:slot-value msg 'agvId) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'agvId) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
      (cl:setf (cl:slot-value msg 'taskId) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'subTaskIndex) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<resp_task>)))
  "Returns string type for a message object of type '<resp_task>"
  "mqtt_comm/resp_task")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'resp_task)))
  "Returns string type for a message object of type 'resp_task"
  "mqtt_comm/resp_task")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<resp_task>)))
  "Returns md5sum for a message object of type '<resp_task>"
  "f2056e3d4cb90d20081cfa1340bb02a1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'resp_task)))
  "Returns md5sum for a message object of type 'resp_task"
  "f2056e3d4cb90d20081cfa1340bb02a1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<resp_task>)))
  "Returns full string definition for message of type '<resp_task>"
  (cl:format cl:nil "string msgType~%string agvId~%int64 timestamp~%# recvtask_value value~%int32 taskId~%int32 subTaskIndex~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'resp_task)))
  "Returns full string definition for message of type 'resp_task"
  (cl:format cl:nil "string msgType~%string agvId~%int64 timestamp~%# recvtask_value value~%int32 taskId~%int32 subTaskIndex~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <resp_task>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'msgType))
     4 (cl:length (cl:slot-value msg 'agvId))
     8
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <resp_task>))
  "Converts a ROS message object to a list"
  (cl:list 'resp_task
    (cl:cons ':msgType (msgType msg))
    (cl:cons ':agvId (agvId msg))
    (cl:cons ':timestamp (timestamp msg))
    (cl:cons ':taskId (taskId msg))
    (cl:cons ':subTaskIndex (subTaskIndex msg))
))
