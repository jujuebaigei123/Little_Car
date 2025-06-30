; Auto-generated. Do not edit!


(cl:in-package car_ctr-msg)


;//! \htmlinclude car_state.msg.html

(cl:defclass <car_state> (roslisp-msg-protocol:ros-message)
  ((enable
    :reader enable
    :initarg :enable
    :type cl:boolean
    :initform cl:nil)
   (ctrmode
    :reader ctrmode
    :initarg :ctrmode
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
    :type (cl:vector cl:float)
   :initform (cl:make-array 4 :element-type 'cl:float :initial-element 0.0))
   (errcode
    :reader errcode
    :initarg :errcode
    :type (cl:vector cl:integer)
   :initform (cl:make-array 8 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass car_state (<car_state>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <car_state>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'car_state)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name car_ctr-msg:<car_state> is deprecated: use car_ctr-msg:car_state instead.")))

(cl:ensure-generic-function 'enable-val :lambda-list '(m))
(cl:defmethod enable-val ((m <car_state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_ctr-msg:enable-val is deprecated.  Use car_ctr-msg:enable instead.")
  (enable m))

(cl:ensure-generic-function 'ctrmode-val :lambda-list '(m))
(cl:defmethod ctrmode-val ((m <car_state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_ctr-msg:ctrmode-val is deprecated.  Use car_ctr-msg:ctrmode instead.")
  (ctrmode m))

(cl:ensure-generic-function 'turnmode-val :lambda-list '(m))
(cl:defmethod turnmode-val ((m <car_state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_ctr-msg:turnmode-val is deprecated.  Use car_ctr-msg:turnmode instead.")
  (turnmode m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <car_state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_ctr-msg:speed-val is deprecated.  Use car_ctr-msg:speed instead.")
  (speed m))

(cl:ensure-generic-function 'errcode-val :lambda-list '(m))
(cl:defmethod errcode-val ((m <car_state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_ctr-msg:errcode-val is deprecated.  Use car_ctr-msg:errcode instead.")
  (errcode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <car_state>) ostream)
  "Serializes a message object of type '<car_state>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'enable) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'ctrmode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
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
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'speed))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'errcode))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <car_state>) istream)
  "Deserializes a message object of type '<car_state>"
    (cl:setf (cl:slot-value msg 'enable) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ctrmode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'turnmode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:setf (cl:slot-value msg 'speed) (cl:make-array 4))
  (cl:let ((vals (cl:slot-value msg 'speed)))
    (cl:dotimes (i 4)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'errcode) (cl:make-array 8))
  (cl:let ((vals (cl:slot-value msg 'errcode)))
    (cl:dotimes (i 8)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<car_state>)))
  "Returns string type for a message object of type '<car_state>"
  "car_ctr/car_state")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'car_state)))
  "Returns string type for a message object of type 'car_state"
  "car_ctr/car_state")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<car_state>)))
  "Returns md5sum for a message object of type '<car_state>"
  "cb22e40eb79ad4fa4ade5e4b0b7218d3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'car_state)))
  "Returns md5sum for a message object of type 'car_state"
  "cb22e40eb79ad4fa4ade5e4b0b7218d3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<car_state>)))
  "Returns full string definition for message of type '<car_state>"
  (cl:format cl:nil "bool enable~%int32 ctrmode~%int32 turnmode    # 0-阿克曼  1-差速模式  2-自转模式  3-横移模式  4-斜行    ~%float32[4] speed~%int32[8] errcode~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'car_state)))
  "Returns full string definition for message of type 'car_state"
  (cl:format cl:nil "bool enable~%int32 ctrmode~%int32 turnmode    # 0-阿克曼  1-差速模式  2-自转模式  3-横移模式  4-斜行    ~%float32[4] speed~%int32[8] errcode~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <car_state>))
  (cl:+ 0
     1
     4
     4
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'speed) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'errcode) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <car_state>))
  "Converts a ROS message object to a list"
  (cl:list 'car_state
    (cl:cons ':enable (enable msg))
    (cl:cons ':ctrmode (ctrmode msg))
    (cl:cons ':turnmode (turnmode msg))
    (cl:cons ':speed (speed msg))
    (cl:cons ':errcode (errcode msg))
))
