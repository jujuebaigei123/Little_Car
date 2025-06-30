; Auto-generated. Do not edit!


(cl:in-package mqtt_commx-msg)


;//! \htmlinclude cmd_Header.msg.html

(cl:defclass <cmd_Header> (roslisp-msg-protocol:ros-message)
  ((trace_id
    :reader trace_id
    :initarg :trace_id
    :type cl:string
    :initform "")
   (trans_id
    :reader trans_id
    :initarg :trans_id
    :type cl:string
    :initform "")
   (che_id
    :reader che_id
    :initarg :che_id
    :type cl:string
    :initform "")
   (timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:string
    :initform "")
   (version
    :reader version
    :initarg :version
    :type cl:string
    :initform ""))
)

(cl:defclass cmd_Header (<cmd_Header>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cmd_Header>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cmd_Header)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mqtt_commx-msg:<cmd_Header> is deprecated: use mqtt_commx-msg:cmd_Header instead.")))

(cl:ensure-generic-function 'trace_id-val :lambda-list '(m))
(cl:defmethod trace_id-val ((m <cmd_Header>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:trace_id-val is deprecated.  Use mqtt_commx-msg:trace_id instead.")
  (trace_id m))

(cl:ensure-generic-function 'trans_id-val :lambda-list '(m))
(cl:defmethod trans_id-val ((m <cmd_Header>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:trans_id-val is deprecated.  Use mqtt_commx-msg:trans_id instead.")
  (trans_id m))

(cl:ensure-generic-function 'che_id-val :lambda-list '(m))
(cl:defmethod che_id-val ((m <cmd_Header>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:che_id-val is deprecated.  Use mqtt_commx-msg:che_id instead.")
  (che_id m))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <cmd_Header>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:timestamp-val is deprecated.  Use mqtt_commx-msg:timestamp instead.")
  (timestamp m))

(cl:ensure-generic-function 'version-val :lambda-list '(m))
(cl:defmethod version-val ((m <cmd_Header>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:version-val is deprecated.  Use mqtt_commx-msg:version instead.")
  (version m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cmd_Header>) ostream)
  "Serializes a message object of type '<cmd_Header>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'trace_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'trace_id))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'trans_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'trans_id))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'che_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'che_id))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'timestamp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'timestamp))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'version))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'version))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cmd_Header>) istream)
  "Deserializes a message object of type '<cmd_Header>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'trace_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'trace_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'trans_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'trans_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'che_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'che_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'timestamp) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'timestamp) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'version) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'version) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cmd_Header>)))
  "Returns string type for a message object of type '<cmd_Header>"
  "mqtt_commx/cmd_Header")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cmd_Header)))
  "Returns string type for a message object of type 'cmd_Header"
  "mqtt_commx/cmd_Header")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cmd_Header>)))
  "Returns md5sum for a message object of type '<cmd_Header>"
  "66f32081d780bd2a95b49f4e58ebf381")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cmd_Header)))
  "Returns md5sum for a message object of type 'cmd_Header"
  "66f32081d780bd2a95b49f4e58ebf381")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cmd_Header>)))
  "Returns full string definition for message of type '<cmd_Header>"
  (cl:format cl:nil "string trace_id~%string trans_id~%string che_id~%string timestamp~%string version~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cmd_Header)))
  "Returns full string definition for message of type 'cmd_Header"
  (cl:format cl:nil "string trace_id~%string trans_id~%string che_id~%string timestamp~%string version~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cmd_Header>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'trace_id))
     4 (cl:length (cl:slot-value msg 'trans_id))
     4 (cl:length (cl:slot-value msg 'che_id))
     4 (cl:length (cl:slot-value msg 'timestamp))
     4 (cl:length (cl:slot-value msg 'version))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cmd_Header>))
  "Converts a ROS message object to a list"
  (cl:list 'cmd_Header
    (cl:cons ':trace_id (trace_id msg))
    (cl:cons ':trans_id (trans_id msg))
    (cl:cons ':che_id (che_id msg))
    (cl:cons ':timestamp (timestamp msg))
    (cl:cons ':version (version msg))
))
