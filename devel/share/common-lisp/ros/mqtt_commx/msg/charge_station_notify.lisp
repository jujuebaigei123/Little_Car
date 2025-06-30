; Auto-generated. Do not edit!


(cl:in-package mqtt_commx-msg)


;//! \htmlinclude charge_station_notify.msg.html

(cl:defclass <charge_station_notify> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type mqtt_commx-msg:cmd_Header
    :initform (cl:make-instance 'mqtt_commx-msg:cmd_Header))
   (code
    :reader code
    :initarg :code
    :type cl:integer
    :initform 0))
)

(cl:defclass charge_station_notify (<charge_station_notify>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <charge_station_notify>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'charge_station_notify)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mqtt_commx-msg:<charge_station_notify> is deprecated: use mqtt_commx-msg:charge_station_notify instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <charge_station_notify>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:header-val is deprecated.  Use mqtt_commx-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'code-val :lambda-list '(m))
(cl:defmethod code-val ((m <charge_station_notify>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:code-val is deprecated.  Use mqtt_commx-msg:code instead.")
  (code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <charge_station_notify>) ostream)
  "Serializes a message object of type '<charge_station_notify>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <charge_station_notify>) istream)
  "Deserializes a message object of type '<charge_station_notify>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<charge_station_notify>)))
  "Returns string type for a message object of type '<charge_station_notify>"
  "mqtt_commx/charge_station_notify")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'charge_station_notify)))
  "Returns string type for a message object of type 'charge_station_notify"
  "mqtt_commx/charge_station_notify")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<charge_station_notify>)))
  "Returns md5sum for a message object of type '<charge_station_notify>"
  "e6208cf7671e976e6c3061bf8dbdd136")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'charge_station_notify)))
  "Returns md5sum for a message object of type 'charge_station_notify"
  "e6208cf7671e976e6c3061bf8dbdd136")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<charge_station_notify>)))
  "Returns full string definition for message of type '<charge_station_notify>"
  (cl:format cl:nil "cmd_Header header~%int32 code   # 1 开始充电，2 停止充电~%~%================================================================================~%MSG: mqtt_commx/cmd_Header~%string trace_id~%string trans_id~%string che_id~%string timestamp~%string version~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'charge_station_notify)))
  "Returns full string definition for message of type 'charge_station_notify"
  (cl:format cl:nil "cmd_Header header~%int32 code   # 1 开始充电，2 停止充电~%~%================================================================================~%MSG: mqtt_commx/cmd_Header~%string trace_id~%string trans_id~%string che_id~%string timestamp~%string version~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <charge_station_notify>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <charge_station_notify>))
  "Converts a ROS message object to a list"
  (cl:list 'charge_station_notify
    (cl:cons ':header (header msg))
    (cl:cons ':code (code msg))
))
