; Auto-generated. Do not edit!


(cl:in-package mqtt_commx-msg)


;//! \htmlinclude iot_act_status.msg.html

(cl:defclass <iot_act_status> (roslisp-msg-protocol:ros-message)
  ((all_status
    :reader all_status
    :initarg :all_status
    :type (cl:vector mqtt_commx-msg:act_status)
   :initform (cl:make-array 0 :element-type 'mqtt_commx-msg:act_status :initial-element (cl:make-instance 'mqtt_commx-msg:act_status)))
   (timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:integer
    :initform 0))
)

(cl:defclass iot_act_status (<iot_act_status>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <iot_act_status>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'iot_act_status)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mqtt_commx-msg:<iot_act_status> is deprecated: use mqtt_commx-msg:iot_act_status instead.")))

(cl:ensure-generic-function 'all_status-val :lambda-list '(m))
(cl:defmethod all_status-val ((m <iot_act_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:all_status-val is deprecated.  Use mqtt_commx-msg:all_status instead.")
  (all_status m))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <iot_act_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:timestamp-val is deprecated.  Use mqtt_commx-msg:timestamp instead.")
  (timestamp m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <iot_act_status>) ostream)
  "Serializes a message object of type '<iot_act_status>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'all_status))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'all_status))
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
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <iot_act_status>) istream)
  "Deserializes a message object of type '<iot_act_status>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'all_status) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'all_status)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'mqtt_commx-msg:act_status))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
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
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<iot_act_status>)))
  "Returns string type for a message object of type '<iot_act_status>"
  "mqtt_commx/iot_act_status")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'iot_act_status)))
  "Returns string type for a message object of type 'iot_act_status"
  "mqtt_commx/iot_act_status")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<iot_act_status>)))
  "Returns md5sum for a message object of type '<iot_act_status>"
  "cd9100d9e84b9bf263922df0a9c28149")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'iot_act_status)))
  "Returns md5sum for a message object of type 'iot_act_status"
  "cd9100d9e84b9bf263922df0a9c28149")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<iot_act_status>)))
  "Returns full string definition for message of type '<iot_act_status>"
  (cl:format cl:nil "act_status[]  all_status~%int64 timestamp~%================================================================================~%MSG: mqtt_commx/act_status~%cmd_Header header~%Point point~%fault_info[]  faults~%~%int64 act_type~%int64 chassis_total_hour~%float64 distance_to_target~%int64 drv_direction~%bool empty~%bool estop~%int64 firm_error_status~%int64 frame_ts~%int64 gear~%bool in_high_voltage    # 取车状态~%bool is_charging~%int64 mileage~%int64 motion_mode~%string navi_id~%int64 operational_status~%int64 platform_state~%int64 soc~%int64 soh~%float64 speed~%int64 state_flow~%string sub_target~%string target~%string task_id~%int64 task_mode~%int64 task_type~%int64 turn_light~%int64 vehicle_error_status~%string vin~%~%================================================================================~%MSG: mqtt_commx/cmd_Header~%string trace_id~%string trans_id~%string che_id~%string timestamp~%string version~%================================================================================~%MSG: mqtt_commx/Point~%float64 x~%float64 y~%float64 yaw~%float64 z~%~%================================================================================~%MSG: mqtt_commx/fault_info~%string desc~%int64 code~%int32 level~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'iot_act_status)))
  "Returns full string definition for message of type 'iot_act_status"
  (cl:format cl:nil "act_status[]  all_status~%int64 timestamp~%================================================================================~%MSG: mqtt_commx/act_status~%cmd_Header header~%Point point~%fault_info[]  faults~%~%int64 act_type~%int64 chassis_total_hour~%float64 distance_to_target~%int64 drv_direction~%bool empty~%bool estop~%int64 firm_error_status~%int64 frame_ts~%int64 gear~%bool in_high_voltage    # 取车状态~%bool is_charging~%int64 mileage~%int64 motion_mode~%string navi_id~%int64 operational_status~%int64 platform_state~%int64 soc~%int64 soh~%float64 speed~%int64 state_flow~%string sub_target~%string target~%string task_id~%int64 task_mode~%int64 task_type~%int64 turn_light~%int64 vehicle_error_status~%string vin~%~%================================================================================~%MSG: mqtt_commx/cmd_Header~%string trace_id~%string trans_id~%string che_id~%string timestamp~%string version~%================================================================================~%MSG: mqtt_commx/Point~%float64 x~%float64 y~%float64 yaw~%float64 z~%~%================================================================================~%MSG: mqtt_commx/fault_info~%string desc~%int64 code~%int32 level~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <iot_act_status>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'all_status) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <iot_act_status>))
  "Converts a ROS message object to a list"
  (cl:list 'iot_act_status
    (cl:cons ':all_status (all_status msg))
    (cl:cons ':timestamp (timestamp msg))
))
