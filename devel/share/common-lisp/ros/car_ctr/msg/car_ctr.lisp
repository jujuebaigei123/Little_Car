; Auto-generated. Do not edit!


(cl:in-package car_ctr-msg)


;//! \htmlinclude car_ctr.msg.html

(cl:defclass <car_ctr> (roslisp-msg-protocol:ros-message)
  ((enable
    :reader enable
    :initarg :enable
    :type cl:integer
    :initform 0)
   (turnmode
    :reader turnmode
    :initarg :turnmode
    :type cl:integer
    :initform 0)
   (speed
    :reader speed
    :initarg :speed
    :type cl:float
    :initform 0.0)
   (angle
    :reader angle
    :initarg :angle
    :type cl:float
    :initform 0.0))
)

(cl:defclass car_ctr (<car_ctr>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <car_ctr>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'car_ctr)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name car_ctr-msg:<car_ctr> is deprecated: use car_ctr-msg:car_ctr instead.")))

(cl:ensure-generic-function 'enable-val :lambda-list '(m))
(cl:defmethod enable-val ((m <car_ctr>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_ctr-msg:enable-val is deprecated.  Use car_ctr-msg:enable instead.")
  (enable m))

(cl:ensure-generic-function 'turnmode-val :lambda-list '(m))
(cl:defmethod turnmode-val ((m <car_ctr>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_ctr-msg:turnmode-val is deprecated.  Use car_ctr-msg:turnmode instead.")
  (turnmode m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <car_ctr>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_ctr-msg:speed-val is deprecated.  Use car_ctr-msg:speed instead.")
  (speed m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <car_ctr>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_ctr-msg:angle-val is deprecated.  Use car_ctr-msg:angle instead.")
  (angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <car_ctr>) ostream)
  "Serializes a message object of type '<car_ctr>"
  (cl:let* ((signed (cl:slot-value msg 'enable)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'turnmode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <car_ctr>) istream)
  "Deserializes a message object of type '<car_ctr>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'enable) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'turnmode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<car_ctr>)))
  "Returns string type for a message object of type '<car_ctr>"
  "car_ctr/car_ctr")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'car_ctr)))
  "Returns string type for a message object of type 'car_ctr"
  "car_ctr/car_ctr")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<car_ctr>)))
  "Returns md5sum for a message object of type '<car_ctr>"
  "730d29df159fab35648f2f22bf88d85e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'car_ctr)))
  "Returns md5sum for a message object of type 'car_ctr"
  "730d29df159fab35648f2f22bf88d85e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<car_ctr>)))
  "Returns full string definition for message of type '<car_ctr>"
  (cl:format cl:nil "int32 enable~%int32 turnmode    #  0-阿克曼    1-斜行  2-横移模式  4-自转模式  x-差速模式  ~%float32 speed~%float32 angle~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'car_ctr)))
  "Returns full string definition for message of type 'car_ctr"
  (cl:format cl:nil "int32 enable~%int32 turnmode    #  0-阿克曼    1-斜行  2-横移模式  4-自转模式  x-差速模式  ~%float32 speed~%float32 angle~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <car_ctr>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <car_ctr>))
  "Converts a ROS message object to a list"
  (cl:list 'car_ctr
    (cl:cons ':enable (enable msg))
    (cl:cons ':turnmode (turnmode msg))
    (cl:cons ':speed (speed msg))
    (cl:cons ':angle (angle msg))
))
