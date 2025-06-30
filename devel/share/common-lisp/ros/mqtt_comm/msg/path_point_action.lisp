; Auto-generated. Do not edit!


(cl:in-package mqtt_comm-msg)


;//! \htmlinclude path_point_action.msg.html

(cl:defclass <path_point_action> (roslisp-msg-protocol:ros-message)
  ((caption
    :reader caption
    :initarg :caption
    :type cl:string
    :initform "")
   (params
    :reader params
    :initarg :params
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass path_point_action (<path_point_action>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <path_point_action>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'path_point_action)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mqtt_comm-msg:<path_point_action> is deprecated: use mqtt_comm-msg:path_point_action instead.")))

(cl:ensure-generic-function 'caption-val :lambda-list '(m))
(cl:defmethod caption-val ((m <path_point_action>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:caption-val is deprecated.  Use mqtt_comm-msg:caption instead.")
  (caption m))

(cl:ensure-generic-function 'params-val :lambda-list '(m))
(cl:defmethod params-val ((m <path_point_action>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:params-val is deprecated.  Use mqtt_comm-msg:params instead.")
  (params m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <path_point_action>) ostream)
  "Serializes a message object of type '<path_point_action>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'caption))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'caption))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'params))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'params))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <path_point_action>) istream)
  "Deserializes a message object of type '<path_point_action>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'caption) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'caption) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'params) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'params)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<path_point_action>)))
  "Returns string type for a message object of type '<path_point_action>"
  "mqtt_comm/path_point_action")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'path_point_action)))
  "Returns string type for a message object of type 'path_point_action"
  "mqtt_comm/path_point_action")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<path_point_action>)))
  "Returns md5sum for a message object of type '<path_point_action>"
  "a5673b402e1654274f346fe24f513dd3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'path_point_action)))
  "Returns md5sum for a message object of type 'path_point_action"
  "a5673b402e1654274f346fe24f513dd3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<path_point_action>)))
  "Returns full string definition for message of type '<path_point_action>"
  (cl:format cl:nil "string caption~%float32[] params~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'path_point_action)))
  "Returns full string definition for message of type 'path_point_action"
  (cl:format cl:nil "string caption~%float32[] params~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <path_point_action>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'caption))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'params) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <path_point_action>))
  "Converts a ROS message object to a list"
  (cl:list 'path_point_action
    (cl:cons ':caption (caption msg))
    (cl:cons ':params (params msg))
))
