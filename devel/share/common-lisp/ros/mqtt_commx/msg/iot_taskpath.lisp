; Auto-generated. Do not edit!


(cl:in-package mqtt_commx-msg)


;//! \htmlinclude iot_taskpath.msg.html

(cl:defclass <iot_taskpath> (roslisp-msg-protocol:ros-message)
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
   (navi_id
    :reader navi_id
    :initarg :navi_id
    :type cl:string
    :initform "")
   (seq_num
    :reader seq_num
    :initarg :seq_num
    :type cl:integer
    :initform 0)
   (route_direction
    :reader route_direction
    :initarg :route_direction
    :type cl:integer
    :initform 0)
   (dest_type
    :reader dest_type
    :initarg :dest_type
    :type cl:integer
    :initform 0)
   (path
    :reader path
    :initarg :path
    :type (cl:vector mqtt_commx-msg:iot_path_point)
   :initform (cl:make-array 0 :element-type 'mqtt_commx-msg:iot_path_point :initial-element (cl:make-instance 'mqtt_commx-msg:iot_path_point)))
   (route_update
    :reader route_update
    :initarg :route_update
    :type cl:boolean
    :initform cl:nil)
   (is_final_navi
    :reader is_final_navi
    :initarg :is_final_navi
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass iot_taskpath (<iot_taskpath>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <iot_taskpath>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'iot_taskpath)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mqtt_commx-msg:<iot_taskpath> is deprecated: use mqtt_commx-msg:iot_taskpath instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <iot_taskpath>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:header-val is deprecated.  Use mqtt_commx-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'taskId-val :lambda-list '(m))
(cl:defmethod taskId-val ((m <iot_taskpath>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:taskId-val is deprecated.  Use mqtt_commx-msg:taskId instead.")
  (taskId m))

(cl:ensure-generic-function 'navi_id-val :lambda-list '(m))
(cl:defmethod navi_id-val ((m <iot_taskpath>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:navi_id-val is deprecated.  Use mqtt_commx-msg:navi_id instead.")
  (navi_id m))

(cl:ensure-generic-function 'seq_num-val :lambda-list '(m))
(cl:defmethod seq_num-val ((m <iot_taskpath>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:seq_num-val is deprecated.  Use mqtt_commx-msg:seq_num instead.")
  (seq_num m))

(cl:ensure-generic-function 'route_direction-val :lambda-list '(m))
(cl:defmethod route_direction-val ((m <iot_taskpath>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:route_direction-val is deprecated.  Use mqtt_commx-msg:route_direction instead.")
  (route_direction m))

(cl:ensure-generic-function 'dest_type-val :lambda-list '(m))
(cl:defmethod dest_type-val ((m <iot_taskpath>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:dest_type-val is deprecated.  Use mqtt_commx-msg:dest_type instead.")
  (dest_type m))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <iot_taskpath>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:path-val is deprecated.  Use mqtt_commx-msg:path instead.")
  (path m))

(cl:ensure-generic-function 'route_update-val :lambda-list '(m))
(cl:defmethod route_update-val ((m <iot_taskpath>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:route_update-val is deprecated.  Use mqtt_commx-msg:route_update instead.")
  (route_update m))

(cl:ensure-generic-function 'is_final_navi-val :lambda-list '(m))
(cl:defmethod is_final_navi-val ((m <iot_taskpath>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:is_final_navi-val is deprecated.  Use mqtt_commx-msg:is_final_navi instead.")
  (is_final_navi m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <iot_taskpath>) ostream)
  "Serializes a message object of type '<iot_taskpath>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'taskId))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'taskId))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'navi_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'navi_id))
  (cl:let* ((signed (cl:slot-value msg 'seq_num)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'route_direction)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'dest_type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'path))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'path))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'route_update) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_final_navi) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <iot_taskpath>) istream)
  "Deserializes a message object of type '<iot_taskpath>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'taskId) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'taskId) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'navi_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'navi_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'seq_num) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'route_direction) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'dest_type) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'path) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'path)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'mqtt_commx-msg:iot_path_point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:setf (cl:slot-value msg 'route_update) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'is_final_navi) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<iot_taskpath>)))
  "Returns string type for a message object of type '<iot_taskpath>"
  "mqtt_commx/iot_taskpath")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'iot_taskpath)))
  "Returns string type for a message object of type 'iot_taskpath"
  "mqtt_commx/iot_taskpath")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<iot_taskpath>)))
  "Returns md5sum for a message object of type '<iot_taskpath>"
  "b090287600ee4263cb79e16674b501c4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'iot_taskpath)))
  "Returns md5sum for a message object of type 'iot_taskpath"
  "b090287600ee4263cb79e16674b501c4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<iot_taskpath>)))
  "Returns full string definition for message of type '<iot_taskpath>"
  (cl:format cl:nil "cmd_Header header~%~%#task~%string taskId             #作业任务的id~%string navi_id            #导航任务编号~%int32 seq_num             #顺序号~%int32 route_direction     #路径方向~%int32 dest_type           #目的地类型~%iot_path_point[] path         #路径~%bool route_update       ~%bool is_final_navi~%~%~%~%~%~%~%~%~%~%================================================================================~%MSG: mqtt_commx/cmd_Header~%string trace_id~%string trans_id~%string che_id~%string timestamp~%string version~%================================================================================~%MSG: mqtt_commx/iot_path_point~%int32 direction~%int32 type~%int32 driving_direction~%string id~%float32 speed_vmax~%float32 vmax_dev~%int32 lane_type~%~%float64 pointX~%float64 pointY~%float64 pointHA~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'iot_taskpath)))
  "Returns full string definition for message of type 'iot_taskpath"
  (cl:format cl:nil "cmd_Header header~%~%#task~%string taskId             #作业任务的id~%string navi_id            #导航任务编号~%int32 seq_num             #顺序号~%int32 route_direction     #路径方向~%int32 dest_type           #目的地类型~%iot_path_point[] path         #路径~%bool route_update       ~%bool is_final_navi~%~%~%~%~%~%~%~%~%~%================================================================================~%MSG: mqtt_commx/cmd_Header~%string trace_id~%string trans_id~%string che_id~%string timestamp~%string version~%================================================================================~%MSG: mqtt_commx/iot_path_point~%int32 direction~%int32 type~%int32 driving_direction~%string id~%float32 speed_vmax~%float32 vmax_dev~%int32 lane_type~%~%float64 pointX~%float64 pointY~%float64 pointHA~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <iot_taskpath>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'taskId))
     4 (cl:length (cl:slot-value msg 'navi_id))
     4
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'path) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <iot_taskpath>))
  "Converts a ROS message object to a list"
  (cl:list 'iot_taskpath
    (cl:cons ':header (header msg))
    (cl:cons ':taskId (taskId msg))
    (cl:cons ':navi_id (navi_id msg))
    (cl:cons ':seq_num (seq_num msg))
    (cl:cons ':route_direction (route_direction msg))
    (cl:cons ':dest_type (dest_type msg))
    (cl:cons ':path (path msg))
    (cl:cons ':route_update (route_update msg))
    (cl:cons ':is_final_navi (is_final_navi msg))
))
