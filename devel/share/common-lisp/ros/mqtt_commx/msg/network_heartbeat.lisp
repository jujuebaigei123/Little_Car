; Auto-generated. Do not edit!


(cl:in-package mqtt_commx-msg)


;//! \htmlinclude network_heartbeat.msg.html

(cl:defclass <network_heartbeat> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type cl:integer
    :initform 0))
)

(cl:defclass network_heartbeat (<network_heartbeat>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <network_heartbeat>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'network_heartbeat)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mqtt_commx-msg:<network_heartbeat> is deprecated: use mqtt_commx-msg:network_heartbeat instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <network_heartbeat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:status-val is deprecated.  Use mqtt_commx-msg:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <network_heartbeat>) ostream)
  "Serializes a message object of type '<network_heartbeat>"
  (cl:let* ((signed (cl:slot-value msg 'status)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <network_heartbeat>) istream)
  "Deserializes a message object of type '<network_heartbeat>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<network_heartbeat>)))
  "Returns string type for a message object of type '<network_heartbeat>"
  "mqtt_commx/network_heartbeat")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'network_heartbeat)))
  "Returns string type for a message object of type 'network_heartbeat"
  "mqtt_commx/network_heartbeat")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<network_heartbeat>)))
  "Returns md5sum for a message object of type '<network_heartbeat>"
  "86791dcf1de997ec7de5a0de7e4dcfcc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'network_heartbeat)))
  "Returns md5sum for a message object of type 'network_heartbeat"
  "86791dcf1de997ec7de5a0de7e4dcfcc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<network_heartbeat>)))
  "Returns full string definition for message of type '<network_heartbeat>"
  (cl:format cl:nil "int32 status    # 0 网络不通，1 网络通信正常~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'network_heartbeat)))
  "Returns full string definition for message of type 'network_heartbeat"
  (cl:format cl:nil "int32 status    # 0 网络不通，1 网络通信正常~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <network_heartbeat>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <network_heartbeat>))
  "Converts a ROS message object to a list"
  (cl:list 'network_heartbeat
    (cl:cons ':status (status msg))
))
