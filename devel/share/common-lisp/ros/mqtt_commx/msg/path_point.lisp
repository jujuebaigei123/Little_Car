; Auto-generated. Do not edit!


(cl:in-package mqtt_commx-msg)


;//! \htmlinclude path_point.msg.html

(cl:defclass <path_point> (roslisp-msg-protocol:ros-message)
  ((vehSpeed
    :reader vehSpeed
    :initarg :vehSpeed
    :type cl:float
    :initform 0.0)
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

(cl:defclass path_point (<path_point>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <path_point>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'path_point)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mqtt_commx-msg:<path_point> is deprecated: use mqtt_commx-msg:path_point instead.")))

(cl:ensure-generic-function 'vehSpeed-val :lambda-list '(m))
(cl:defmethod vehSpeed-val ((m <path_point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:vehSpeed-val is deprecated.  Use mqtt_commx-msg:vehSpeed instead.")
  (vehSpeed m))

(cl:ensure-generic-function 'pointX-val :lambda-list '(m))
(cl:defmethod pointX-val ((m <path_point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:pointX-val is deprecated.  Use mqtt_commx-msg:pointX instead.")
  (pointX m))

(cl:ensure-generic-function 'pointY-val :lambda-list '(m))
(cl:defmethod pointY-val ((m <path_point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:pointY-val is deprecated.  Use mqtt_commx-msg:pointY instead.")
  (pointY m))

(cl:ensure-generic-function 'pointHA-val :lambda-list '(m))
(cl:defmethod pointHA-val ((m <path_point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:pointHA-val is deprecated.  Use mqtt_commx-msg:pointHA instead.")
  (pointHA m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <path_point>) ostream)
  "Serializes a message object of type '<path_point>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vehSpeed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <path_point>) istream)
  "Deserializes a message object of type '<path_point>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vehSpeed) (roslisp-utils:decode-single-float-bits bits)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<path_point>)))
  "Returns string type for a message object of type '<path_point>"
  "mqtt_commx/path_point")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'path_point)))
  "Returns string type for a message object of type 'path_point"
  "mqtt_commx/path_point")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<path_point>)))
  "Returns md5sum for a message object of type '<path_point>"
  "6c29c28350be647e56acc4fdcf5724c5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'path_point)))
  "Returns md5sum for a message object of type 'path_point"
  "6c29c28350be647e56acc4fdcf5724c5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<path_point>)))
  "Returns full string definition for message of type '<path_point>"
  (cl:format cl:nil "float32 vehSpeed~%float64 pointX~%float64 pointY~%float64 pointHA~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'path_point)))
  "Returns full string definition for message of type 'path_point"
  (cl:format cl:nil "float32 vehSpeed~%float64 pointX~%float64 pointY~%float64 pointHA~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <path_point>))
  (cl:+ 0
     4
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <path_point>))
  "Converts a ROS message object to a list"
  (cl:list 'path_point
    (cl:cons ':vehSpeed (vehSpeed msg))
    (cl:cons ':pointX (pointX msg))
    (cl:cons ':pointY (pointY msg))
    (cl:cons ':pointHA (pointHA msg))
))
