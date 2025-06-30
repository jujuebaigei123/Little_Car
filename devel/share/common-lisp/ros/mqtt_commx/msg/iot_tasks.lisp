; Auto-generated. Do not edit!


(cl:in-package mqtt_commx-msg)


;//! \htmlinclude iot_tasks.msg.html

(cl:defclass <iot_tasks> (roslisp-msg-protocol:ros-message)
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
   (taskType
    :reader taskType
    :initarg :taskType
    :type cl:integer
    :initform 0)
   (target
    :reader target
    :initarg :target
    :type cl:string
    :initform "")
   (sub_target
    :reader sub_target
    :initarg :sub_target
    :type cl:string
    :initform "")
   (targetX
    :reader targetX
    :initarg :targetX
    :type cl:float
    :initform 0.0)
   (targetY
    :reader targetY
    :initarg :targetY
    :type cl:float
    :initform 0.0)
   (targetHA
    :reader targetHA
    :initarg :targetHA
    :type cl:float
    :initform 0.0)
   (cargoLength
    :reader cargoLength
    :initarg :cargoLength
    :type cl:float
    :initform 0.0)
   (cargoWidth
    :reader cargoWidth
    :initarg :cargoWidth
    :type cl:float
    :initform 0.0)
   (cargoHeight
    :reader cargoHeight
    :initarg :cargoHeight
    :type cl:float
    :initform 0.0)
   (cargoId
    :reader cargoId
    :initarg :cargoId
    :type cl:string
    :initform ""))
)

(cl:defclass iot_tasks (<iot_tasks>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <iot_tasks>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'iot_tasks)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mqtt_commx-msg:<iot_tasks> is deprecated: use mqtt_commx-msg:iot_tasks instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <iot_tasks>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:header-val is deprecated.  Use mqtt_commx-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'taskId-val :lambda-list '(m))
(cl:defmethod taskId-val ((m <iot_tasks>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:taskId-val is deprecated.  Use mqtt_commx-msg:taskId instead.")
  (taskId m))

(cl:ensure-generic-function 'taskType-val :lambda-list '(m))
(cl:defmethod taskType-val ((m <iot_tasks>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:taskType-val is deprecated.  Use mqtt_commx-msg:taskType instead.")
  (taskType m))

(cl:ensure-generic-function 'target-val :lambda-list '(m))
(cl:defmethod target-val ((m <iot_tasks>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:target-val is deprecated.  Use mqtt_commx-msg:target instead.")
  (target m))

(cl:ensure-generic-function 'sub_target-val :lambda-list '(m))
(cl:defmethod sub_target-val ((m <iot_tasks>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:sub_target-val is deprecated.  Use mqtt_commx-msg:sub_target instead.")
  (sub_target m))

(cl:ensure-generic-function 'targetX-val :lambda-list '(m))
(cl:defmethod targetX-val ((m <iot_tasks>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:targetX-val is deprecated.  Use mqtt_commx-msg:targetX instead.")
  (targetX m))

(cl:ensure-generic-function 'targetY-val :lambda-list '(m))
(cl:defmethod targetY-val ((m <iot_tasks>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:targetY-val is deprecated.  Use mqtt_commx-msg:targetY instead.")
  (targetY m))

(cl:ensure-generic-function 'targetHA-val :lambda-list '(m))
(cl:defmethod targetHA-val ((m <iot_tasks>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:targetHA-val is deprecated.  Use mqtt_commx-msg:targetHA instead.")
  (targetHA m))

(cl:ensure-generic-function 'cargoLength-val :lambda-list '(m))
(cl:defmethod cargoLength-val ((m <iot_tasks>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:cargoLength-val is deprecated.  Use mqtt_commx-msg:cargoLength instead.")
  (cargoLength m))

(cl:ensure-generic-function 'cargoWidth-val :lambda-list '(m))
(cl:defmethod cargoWidth-val ((m <iot_tasks>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:cargoWidth-val is deprecated.  Use mqtt_commx-msg:cargoWidth instead.")
  (cargoWidth m))

(cl:ensure-generic-function 'cargoHeight-val :lambda-list '(m))
(cl:defmethod cargoHeight-val ((m <iot_tasks>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:cargoHeight-val is deprecated.  Use mqtt_commx-msg:cargoHeight instead.")
  (cargoHeight m))

(cl:ensure-generic-function 'cargoId-val :lambda-list '(m))
(cl:defmethod cargoId-val ((m <iot_tasks>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:cargoId-val is deprecated.  Use mqtt_commx-msg:cargoId instead.")
  (cargoId m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <iot_tasks>) ostream)
  "Serializes a message object of type '<iot_tasks>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'taskId))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'taskId))
  (cl:let* ((signed (cl:slot-value msg 'taskType)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'target))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'target))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'sub_target))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'sub_target))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'targetX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'targetY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'targetHA))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'cargoLength))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'cargoWidth))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'cargoHeight))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'cargoId))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'cargoId))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <iot_tasks>) istream)
  "Deserializes a message object of type '<iot_tasks>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'taskId) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'taskId) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'taskType) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'target) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'target) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sub_target) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'sub_target) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'targetX) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'targetY) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'targetHA) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'cargoLength) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'cargoWidth) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'cargoHeight) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'cargoId) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'cargoId) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<iot_tasks>)))
  "Returns string type for a message object of type '<iot_tasks>"
  "mqtt_commx/iot_tasks")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'iot_tasks)))
  "Returns string type for a message object of type 'iot_tasks"
  "mqtt_commx/iot_tasks")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<iot_tasks>)))
  "Returns md5sum for a message object of type '<iot_tasks>"
  "e19a52af0fdaf396449227820a086c35")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'iot_tasks)))
  "Returns md5sum for a message object of type 'iot_tasks"
  "e19a52af0fdaf396449227820a086c35")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<iot_tasks>)))
  "Returns full string definition for message of type '<iot_tasks>"
  (cl:format cl:nil "cmd_Header header~%~%~%#task~%string taskId         #任务号~%int32 taskType        #任务类型~%string target         #任务大区~%string sub_target     #车位号~%float64 targetX       #目标x~%float64 targetY       #目标y~%float64 targetHA      #目标航相角~%~%float64 cargoLength   #商品车长宽高~%float64 cargoWidth~%float64 cargoHeight~%~%string cargoId        #商品车射频码~%~%~%~%~%~%~%~%~%~%~%================================================================================~%MSG: mqtt_commx/cmd_Header~%string trace_id~%string trans_id~%string che_id~%string timestamp~%string version~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'iot_tasks)))
  "Returns full string definition for message of type 'iot_tasks"
  (cl:format cl:nil "cmd_Header header~%~%~%#task~%string taskId         #任务号~%int32 taskType        #任务类型~%string target         #任务大区~%string sub_target     #车位号~%float64 targetX       #目标x~%float64 targetY       #目标y~%float64 targetHA      #目标航相角~%~%float64 cargoLength   #商品车长宽高~%float64 cargoWidth~%float64 cargoHeight~%~%string cargoId        #商品车射频码~%~%~%~%~%~%~%~%~%~%~%================================================================================~%MSG: mqtt_commx/cmd_Header~%string trace_id~%string trans_id~%string che_id~%string timestamp~%string version~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <iot_tasks>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'taskId))
     4
     4 (cl:length (cl:slot-value msg 'target))
     4 (cl:length (cl:slot-value msg 'sub_target))
     8
     8
     8
     8
     8
     8
     4 (cl:length (cl:slot-value msg 'cargoId))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <iot_tasks>))
  "Converts a ROS message object to a list"
  (cl:list 'iot_tasks
    (cl:cons ':header (header msg))
    (cl:cons ':taskId (taskId msg))
    (cl:cons ':taskType (taskType msg))
    (cl:cons ':target (target msg))
    (cl:cons ':sub_target (sub_target msg))
    (cl:cons ':targetX (targetX msg))
    (cl:cons ':targetY (targetY msg))
    (cl:cons ':targetHA (targetHA msg))
    (cl:cons ':cargoLength (cargoLength msg))
    (cl:cons ':cargoWidth (cargoWidth msg))
    (cl:cons ':cargoHeight (cargoHeight msg))
    (cl:cons ':cargoId (cargoId msg))
))
