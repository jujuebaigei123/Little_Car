; Auto-generated. Do not edit!


(cl:in-package mqtt_comm-msg)


;//! \htmlinclude task.msg.html

(cl:defclass <task> (roslisp-msg-protocol:ros-message)
  ((stamp
    :reader stamp
    :initarg :stamp
    :type cl:real
    :initform 0)
   (taskId
    :reader taskId
    :initarg :taskId
    :type cl:string
    :initform "")
   (cmd
    :reader cmd
    :initarg :cmd
    :type cl:string
    :initform "")
   (subcmd
    :reader subcmd
    :initarg :subcmd
    :type cl:string
    :initform "")
   (final_path
    :reader final_path
    :initarg :final_path
    :type cl:boolean
    :initform cl:nil)
   (only_akm
    :reader only_akm
    :initarg :only_akm
    :type cl:boolean
    :initform cl:nil)
   (accordingPathdir
    :reader accordingPathdir
    :initarg :accordingPathdir
    :type cl:boolean
    :initform cl:nil)
   (path
    :reader path
    :initarg :path
    :type (cl:vector mqtt_comm-msg:path_point)
   :initform (cl:make-array 0 :element-type 'mqtt_comm-msg:path_point :initial-element (cl:make-instance 'mqtt_comm-msg:path_point))))
)

(cl:defclass task (<task>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <task>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'task)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mqtt_comm-msg:<task> is deprecated: use mqtt_comm-msg:task instead.")))

(cl:ensure-generic-function 'stamp-val :lambda-list '(m))
(cl:defmethod stamp-val ((m <task>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:stamp-val is deprecated.  Use mqtt_comm-msg:stamp instead.")
  (stamp m))

(cl:ensure-generic-function 'taskId-val :lambda-list '(m))
(cl:defmethod taskId-val ((m <task>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:taskId-val is deprecated.  Use mqtt_comm-msg:taskId instead.")
  (taskId m))

(cl:ensure-generic-function 'cmd-val :lambda-list '(m))
(cl:defmethod cmd-val ((m <task>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:cmd-val is deprecated.  Use mqtt_comm-msg:cmd instead.")
  (cmd m))

(cl:ensure-generic-function 'subcmd-val :lambda-list '(m))
(cl:defmethod subcmd-val ((m <task>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:subcmd-val is deprecated.  Use mqtt_comm-msg:subcmd instead.")
  (subcmd m))

(cl:ensure-generic-function 'final_path-val :lambda-list '(m))
(cl:defmethod final_path-val ((m <task>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:final_path-val is deprecated.  Use mqtt_comm-msg:final_path instead.")
  (final_path m))

(cl:ensure-generic-function 'only_akm-val :lambda-list '(m))
(cl:defmethod only_akm-val ((m <task>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:only_akm-val is deprecated.  Use mqtt_comm-msg:only_akm instead.")
  (only_akm m))

(cl:ensure-generic-function 'accordingPathdir-val :lambda-list '(m))
(cl:defmethod accordingPathdir-val ((m <task>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:accordingPathdir-val is deprecated.  Use mqtt_comm-msg:accordingPathdir instead.")
  (accordingPathdir m))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <task>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:path-val is deprecated.  Use mqtt_comm-msg:path instead.")
  (path m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <task>) ostream)
  "Serializes a message object of type '<task>"
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'stamp)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'stamp) (cl:floor (cl:slot-value msg 'stamp)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'taskId))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'taskId))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'cmd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'cmd))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'subcmd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'subcmd))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'final_path) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'only_akm) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'accordingPathdir) 1 0)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'path))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'path))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <task>) istream)
  "Deserializes a message object of type '<task>"
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'stamp) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
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
      (cl:setf (cl:slot-value msg 'cmd) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'cmd) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'subcmd) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'subcmd) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'final_path) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'only_akm) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'accordingPathdir) (cl:not (cl:zerop (cl:read-byte istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'path) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'path)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'mqtt_comm-msg:path_point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<task>)))
  "Returns string type for a message object of type '<task>"
  "mqtt_comm/task")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'task)))
  "Returns string type for a message object of type 'task"
  "mqtt_comm/task")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<task>)))
  "Returns md5sum for a message object of type '<task>"
  "56ba4c02399269a508181e421f1e9b96")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'task)))
  "Returns md5sum for a message object of type 'task"
  "56ba4c02399269a508181e421f1e9b96")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<task>)))
  "Returns full string definition for message of type '<task>"
  (cl:format cl:nil "time stamp~%string taskId~%string cmd~%string subcmd~%bool final_path~%bool only_akm~%bool accordingPathdir~%path_point[] path~%~%~%~%================================================================================~%MSG: mqtt_comm/path_point~%float32 vehSpeed~%float64 pointX~%float64 pointY~%float64 pointHA~%bool actEnable~%string caption~%path_point_action[] actions~%float32[] if_point1~%float32[] if_point2~%~%~%~%================================================================================~%MSG: mqtt_comm/path_point_action~%string caption~%float32[] params~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'task)))
  "Returns full string definition for message of type 'task"
  (cl:format cl:nil "time stamp~%string taskId~%string cmd~%string subcmd~%bool final_path~%bool only_akm~%bool accordingPathdir~%path_point[] path~%~%~%~%================================================================================~%MSG: mqtt_comm/path_point~%float32 vehSpeed~%float64 pointX~%float64 pointY~%float64 pointHA~%bool actEnable~%string caption~%path_point_action[] actions~%float32[] if_point1~%float32[] if_point2~%~%~%~%================================================================================~%MSG: mqtt_comm/path_point_action~%string caption~%float32[] params~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <task>))
  (cl:+ 0
     8
     4 (cl:length (cl:slot-value msg 'taskId))
     4 (cl:length (cl:slot-value msg 'cmd))
     4 (cl:length (cl:slot-value msg 'subcmd))
     1
     1
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'path) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <task>))
  "Converts a ROS message object to a list"
  (cl:list 'task
    (cl:cons ':stamp (stamp msg))
    (cl:cons ':taskId (taskId msg))
    (cl:cons ':cmd (cmd msg))
    (cl:cons ':subcmd (subcmd msg))
    (cl:cons ':final_path (final_path msg))
    (cl:cons ':only_akm (only_akm msg))
    (cl:cons ':accordingPathdir (accordingPathdir msg))
    (cl:cons ':path (path msg))
))
