; Auto-generated. Do not edit!


(cl:in-package pathtrack-msg)


;//! \htmlinclude track_state.msg.html

(cl:defclass <track_state> (roslisp-msg-protocol:ros-message)
  ((timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:integer
    :initform 0)
   (stopReason
    :reader stopReason
    :initarg :stopReason
    :type cl:string
    :initform "")
   (self_turn_ctr
    :reader self_turn_ctr
    :initarg :self_turn_ctr
    :type cl:integer
    :initform 0)
   (turnmode_ctr
    :reader turnmode_ctr
    :initarg :turnmode_ctr
    :type cl:integer
    :initform 0)
   (track_angle_err
    :reader track_angle_err
    :initarg :track_angle_err
    :type cl:float
    :initform 0.0)
   (track_dis_err
    :reader track_dis_err
    :initarg :track_dis_err
    :type cl:float
    :initform 0.0)
   (aim_range
    :reader aim_range
    :initarg :aim_range
    :type cl:float
    :initform 0.0)
   (steering_property
    :reader steering_property
    :initarg :steering_property
    :type cl:float
    :initform 0.0))
)

(cl:defclass track_state (<track_state>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <track_state>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'track_state)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pathtrack-msg:<track_state> is deprecated: use pathtrack-msg:track_state instead.")))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <track_state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pathtrack-msg:timestamp-val is deprecated.  Use pathtrack-msg:timestamp instead.")
  (timestamp m))

(cl:ensure-generic-function 'stopReason-val :lambda-list '(m))
(cl:defmethod stopReason-val ((m <track_state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pathtrack-msg:stopReason-val is deprecated.  Use pathtrack-msg:stopReason instead.")
  (stopReason m))

(cl:ensure-generic-function 'self_turn_ctr-val :lambda-list '(m))
(cl:defmethod self_turn_ctr-val ((m <track_state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pathtrack-msg:self_turn_ctr-val is deprecated.  Use pathtrack-msg:self_turn_ctr instead.")
  (self_turn_ctr m))

(cl:ensure-generic-function 'turnmode_ctr-val :lambda-list '(m))
(cl:defmethod turnmode_ctr-val ((m <track_state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pathtrack-msg:turnmode_ctr-val is deprecated.  Use pathtrack-msg:turnmode_ctr instead.")
  (turnmode_ctr m))

(cl:ensure-generic-function 'track_angle_err-val :lambda-list '(m))
(cl:defmethod track_angle_err-val ((m <track_state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pathtrack-msg:track_angle_err-val is deprecated.  Use pathtrack-msg:track_angle_err instead.")
  (track_angle_err m))

(cl:ensure-generic-function 'track_dis_err-val :lambda-list '(m))
(cl:defmethod track_dis_err-val ((m <track_state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pathtrack-msg:track_dis_err-val is deprecated.  Use pathtrack-msg:track_dis_err instead.")
  (track_dis_err m))

(cl:ensure-generic-function 'aim_range-val :lambda-list '(m))
(cl:defmethod aim_range-val ((m <track_state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pathtrack-msg:aim_range-val is deprecated.  Use pathtrack-msg:aim_range instead.")
  (aim_range m))

(cl:ensure-generic-function 'steering_property-val :lambda-list '(m))
(cl:defmethod steering_property-val ((m <track_state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pathtrack-msg:steering_property-val is deprecated.  Use pathtrack-msg:steering_property instead.")
  (steering_property m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <track_state>) ostream)
  "Serializes a message object of type '<track_state>"
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
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'stopReason))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'stopReason))
  (cl:let* ((signed (cl:slot-value msg 'self_turn_ctr)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'turnmode_ctr)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'track_angle_err))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'track_dis_err))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'aim_range))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'steering_property))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <track_state>) istream)
  "Deserializes a message object of type '<track_state>"
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
      (cl:setf (cl:slot-value msg 'stopReason) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'stopReason) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'self_turn_ctr) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'turnmode_ctr) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'track_angle_err) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'track_dis_err) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'aim_range) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'steering_property) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<track_state>)))
  "Returns string type for a message object of type '<track_state>"
  "pathtrack/track_state")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'track_state)))
  "Returns string type for a message object of type 'track_state"
  "pathtrack/track_state")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<track_state>)))
  "Returns md5sum for a message object of type '<track_state>"
  "976fb87d357afb82707050b80adee235")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'track_state)))
  "Returns md5sum for a message object of type 'track_state"
  "976fb87d357afb82707050b80adee235")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<track_state>)))
  "Returns full string definition for message of type '<track_state>"
  (cl:format cl:nil "int64 timestamp~%string stopReason~%int32 self_turn_ctr~%int32 turnmode_ctr~%float32 track_angle_err~%float32 track_dis_err~%float32 aim_range~%float32 steering_property~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'track_state)))
  "Returns full string definition for message of type 'track_state"
  (cl:format cl:nil "int64 timestamp~%string stopReason~%int32 self_turn_ctr~%int32 turnmode_ctr~%float32 track_angle_err~%float32 track_dis_err~%float32 aim_range~%float32 steering_property~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <track_state>))
  (cl:+ 0
     8
     4 (cl:length (cl:slot-value msg 'stopReason))
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <track_state>))
  "Converts a ROS message object to a list"
  (cl:list 'track_state
    (cl:cons ':timestamp (timestamp msg))
    (cl:cons ':stopReason (stopReason msg))
    (cl:cons ':self_turn_ctr (self_turn_ctr msg))
    (cl:cons ':turnmode_ctr (turnmode_ctr msg))
    (cl:cons ':track_angle_err (track_angle_err msg))
    (cl:cons ':track_dis_err (track_dis_err msg))
    (cl:cons ':aim_range (aim_range msg))
    (cl:cons ':steering_property (steering_property msg))
))
