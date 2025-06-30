; Auto-generated. Do not edit!


(cl:in-package mqtt_commx-msg)


;//! \htmlinclude iot_path_point.msg.html

(cl:defclass <iot_path_point> (roslisp-msg-protocol:ros-message)
  ((direction
    :reader direction
    :initarg :direction
    :type cl:integer
    :initform 0)
   (type
    :reader type
    :initarg :type
    :type cl:integer
    :initform 0)
   (driving_direction
    :reader driving_direction
    :initarg :driving_direction
    :type cl:integer
    :initform 0)
   (id
    :reader id
    :initarg :id
    :type cl:string
    :initform "")
   (speed_vmax
    :reader speed_vmax
    :initarg :speed_vmax
    :type cl:float
    :initform 0.0)
   (vmax_dev
    :reader vmax_dev
    :initarg :vmax_dev
    :type cl:float
    :initform 0.0)
   (lane_type
    :reader lane_type
    :initarg :lane_type
    :type cl:integer
    :initform 0)
   (pointX
    :reader pointX
    :initarg :pointX
    :type cl:float
    :initform 0.0)
   (pointY
    :reader pointY
    :initarg :pointY
    :type cl:float
    :initform 0.0)
   (pointHA
    :reader pointHA
    :initarg :pointHA
    :type cl:float
    :initform 0.0))
)

(cl:defclass iot_path_point (<iot_path_point>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <iot_path_point>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'iot_path_point)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mqtt_commx-msg:<iot_path_point> is deprecated: use mqtt_commx-msg:iot_path_point instead.")))

(cl:ensure-generic-function 'direction-val :lambda-list '(m))
(cl:defmethod direction-val ((m <iot_path_point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:direction-val is deprecated.  Use mqtt_commx-msg:direction instead.")
  (direction m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <iot_path_point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:type-val is deprecated.  Use mqtt_commx-msg:type instead.")
  (type m))

(cl:ensure-generic-function 'driving_direction-val :lambda-list '(m))
(cl:defmethod driving_direction-val ((m <iot_path_point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:driving_direction-val is deprecated.  Use mqtt_commx-msg:driving_direction instead.")
  (driving_direction m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <iot_path_point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:id-val is deprecated.  Use mqtt_commx-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'speed_vmax-val :lambda-list '(m))
(cl:defmethod speed_vmax-val ((m <iot_path_point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:speed_vmax-val is deprecated.  Use mqtt_commx-msg:speed_vmax instead.")
  (speed_vmax m))

(cl:ensure-generic-function 'vmax_dev-val :lambda-list '(m))
(cl:defmethod vmax_dev-val ((m <iot_path_point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:vmax_dev-val is deprecated.  Use mqtt_commx-msg:vmax_dev instead.")
  (vmax_dev m))

(cl:ensure-generic-function 'lane_type-val :lambda-list '(m))
(cl:defmethod lane_type-val ((m <iot_path_point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:lane_type-val is deprecated.  Use mqtt_commx-msg:lane_type instead.")
  (lane_type m))

(cl:ensure-generic-function 'pointX-val :lambda-list '(m))
(cl:defmethod pointX-val ((m <iot_path_point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:pointX-val is deprecated.  Use mqtt_commx-msg:pointX instead.")
  (pointX m))

(cl:ensure-generic-function 'pointY-val :lambda-list '(m))
(cl:defmethod pointY-val ((m <iot_path_point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:pointY-val is deprecated.  Use mqtt_commx-msg:pointY instead.")
  (pointY m))

(cl:ensure-generic-function 'pointHA-val :lambda-list '(m))
(cl:defmethod pointHA-val ((m <iot_path_point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:pointHA-val is deprecated.  Use mqtt_commx-msg:pointHA instead.")
  (pointHA m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <iot_path_point>) ostream)
  "Serializes a message object of type '<iot_path_point>"
  (cl:let* ((signed (cl:slot-value msg 'direction)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'driving_direction)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'id))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'speed_vmax))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vmax_dev))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'lane_type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pointX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pointY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pointHA))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <iot_path_point>) istream)
  "Deserializes a message object of type '<iot_path_point>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'direction) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'driving_direction) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed_vmax) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vmax_dev) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'lane_type) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pointX) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pointY) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pointHA) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<iot_path_point>)))
  "Returns string type for a message object of type '<iot_path_point>"
  "mqtt_commx/iot_path_point")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'iot_path_point)))
  "Returns string type for a message object of type 'iot_path_point"
  "mqtt_commx/iot_path_point")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<iot_path_point>)))
  "Returns md5sum for a message object of type '<iot_path_point>"
  "f109249047779f0f5bde21421b2af811")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'iot_path_point)))
  "Returns md5sum for a message object of type 'iot_path_point"
  "f109249047779f0f5bde21421b2af811")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<iot_path_point>)))
  "Returns full string definition for message of type '<iot_path_point>"
  (cl:format cl:nil "int32 direction~%int32 type~%int32 driving_direction~%string id~%float32 speed_vmax~%float32 vmax_dev~%int32 lane_type~%~%float64 pointX~%float64 pointY~%float64 pointHA~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'iot_path_point)))
  "Returns full string definition for message of type 'iot_path_point"
  (cl:format cl:nil "int32 direction~%int32 type~%int32 driving_direction~%string id~%float32 speed_vmax~%float32 vmax_dev~%int32 lane_type~%~%float64 pointX~%float64 pointY~%float64 pointHA~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <iot_path_point>))
  (cl:+ 0
     4
     4
     4
     4 (cl:length (cl:slot-value msg 'id))
     4
     4
     4
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <iot_path_point>))
  "Converts a ROS message object to a list"
  (cl:list 'iot_path_point
    (cl:cons ':direction (direction msg))
    (cl:cons ':type (type msg))
    (cl:cons ':driving_direction (driving_direction msg))
    (cl:cons ':id (id msg))
    (cl:cons ':speed_vmax (speed_vmax msg))
    (cl:cons ':vmax_dev (vmax_dev msg))
    (cl:cons ':lane_type (lane_type msg))
    (cl:cons ':pointX (pointX msg))
    (cl:cons ':pointY (pointY msg))
    (cl:cons ':pointHA (pointHA msg))
))
