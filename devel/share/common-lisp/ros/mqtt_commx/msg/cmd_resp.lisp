; Auto-generated. Do not edit!


(cl:in-package mqtt_commx-msg)


;//! \htmlinclude cmd_resp.msg.html

(cl:defclass <cmd_resp> (roslisp-msg-protocol:ros-message)
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

(cl:defclass cmd_resp (<cmd_resp>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cmd_resp>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cmd_resp)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mqtt_commx-msg:<cmd_resp> is deprecated: use mqtt_commx-msg:cmd_resp instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <cmd_resp>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:header-val is deprecated.  Use mqtt_commx-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'code-val :lambda-list '(m))
(cl:defmethod code-val ((m <cmd_resp>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:code-val is deprecated.  Use mqtt_commx-msg:code instead.")
  (code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cmd_resp>) ostream)
  "Serializes a message object of type '<cmd_resp>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cmd_resp>) istream)
  "Deserializes a message object of type '<cmd_resp>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cmd_resp>)))
  "Returns string type for a message object of type '<cmd_resp>"
  "mqtt_commx/cmd_resp")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cmd_resp)))
  "Returns string type for a message object of type 'cmd_resp"
  "mqtt_commx/cmd_resp")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cmd_resp>)))
  "Returns md5sum for a message object of type '<cmd_resp>"
  "e6208cf7671e976e6c3061bf8dbdd136")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cmd_resp)))
  "Returns md5sum for a message object of type 'cmd_resp"
  "e6208cf7671e976e6c3061bf8dbdd136")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cmd_resp>)))
  "Returns full string definition for message of type '<cmd_resp>"
  (cl:format cl:nil "cmd_Header header~%int32 code~%================================================================================~%MSG: mqtt_commx/cmd_Header~%string trace_id~%string trans_id~%string che_id~%string timestamp~%string version~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cmd_resp)))
  "Returns full string definition for message of type 'cmd_resp"
  (cl:format cl:nil "cmd_Header header~%int32 code~%================================================================================~%MSG: mqtt_commx/cmd_Header~%string trace_id~%string trans_id~%string che_id~%string timestamp~%string version~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cmd_resp>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cmd_resp>))
  "Converts a ROS message object to a list"
  (cl:list 'cmd_resp
    (cl:cons ':header (header msg))
    (cl:cons ':code (code msg))
))
