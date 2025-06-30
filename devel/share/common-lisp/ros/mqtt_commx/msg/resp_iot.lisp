; Auto-generated. Do not edit!


(cl:in-package mqtt_commx-msg)


;//! \htmlinclude resp_iot.msg.html

(cl:defclass <resp_iot> (roslisp-msg-protocol:ros-message)
  ((state_flow
    :reader state_flow
    :initarg :state_flow
    :type cl:integer
    :initform 0)
   (task_mode
    :reader task_mode
    :initarg :task_mode
    :type cl:integer
    :initform 0)
   (chassis_total_hour
    :reader chassis_total_hour
    :initarg :chassis_total_hour
    :type cl:integer
    :initform 0)
   (drv_direction
    :reader drv_direction
    :initarg :drv_direction
    :type cl:integer
    :initform 0)
   (firm_error_state
    :reader firm_error_state
    :initarg :firm_error_state
    :type cl:integer
    :initform 0)
   (vehicle_error_status
    :reader vehicle_error_status
    :initarg :vehicle_error_status
    :type cl:integer
    :initform 0)
   (faults
    :reader faults
    :initarg :faults
    :type mqtt_commx-msg:fault_info_array
    :initform (cl:make-instance 'mqtt_commx-msg:fault_info_array))
   (mileage
    :reader mileage
    :initarg :mileage
    :type cl:integer
    :initform 0)
   (in_high_voltage
    :reader in_high_voltage
    :initarg :in_high_voltage
    :type cl:boolean
    :initform cl:nil)
   (vin
    :reader vin
    :initarg :vin
    :type cl:string
    :initform "")
   (task_id
    :reader task_id
    :initarg :task_id
    :type cl:string
    :initform "")
   (navi_id
    :reader navi_id
    :initarg :navi_id
    :type cl:string
    :initform "")
   (task_type
    :reader task_type
    :initarg :task_type
    :type cl:integer
    :initform 0)
   (act_type
    :reader act_type
    :initarg :act_type
    :type cl:integer
    :initform 0)
   (target
    :reader target
    :initarg :target
    :type cl:string
    :initform "")
   (sub_target
    :reader sub_target
    :initarg :sub_target
    :type cl:string
    :initform ""))
)

(cl:defclass resp_iot (<resp_iot>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <resp_iot>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'resp_iot)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mqtt_commx-msg:<resp_iot> is deprecated: use mqtt_commx-msg:resp_iot instead.")))

(cl:ensure-generic-function 'state_flow-val :lambda-list '(m))
(cl:defmethod state_flow-val ((m <resp_iot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:state_flow-val is deprecated.  Use mqtt_commx-msg:state_flow instead.")
  (state_flow m))

(cl:ensure-generic-function 'task_mode-val :lambda-list '(m))
(cl:defmethod task_mode-val ((m <resp_iot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:task_mode-val is deprecated.  Use mqtt_commx-msg:task_mode instead.")
  (task_mode m))

(cl:ensure-generic-function 'chassis_total_hour-val :lambda-list '(m))
(cl:defmethod chassis_total_hour-val ((m <resp_iot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:chassis_total_hour-val is deprecated.  Use mqtt_commx-msg:chassis_total_hour instead.")
  (chassis_total_hour m))

(cl:ensure-generic-function 'drv_direction-val :lambda-list '(m))
(cl:defmethod drv_direction-val ((m <resp_iot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:drv_direction-val is deprecated.  Use mqtt_commx-msg:drv_direction instead.")
  (drv_direction m))

(cl:ensure-generic-function 'firm_error_state-val :lambda-list '(m))
(cl:defmethod firm_error_state-val ((m <resp_iot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:firm_error_state-val is deprecated.  Use mqtt_commx-msg:firm_error_state instead.")
  (firm_error_state m))

(cl:ensure-generic-function 'vehicle_error_status-val :lambda-list '(m))
(cl:defmethod vehicle_error_status-val ((m <resp_iot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:vehicle_error_status-val is deprecated.  Use mqtt_commx-msg:vehicle_error_status instead.")
  (vehicle_error_status m))

(cl:ensure-generic-function 'faults-val :lambda-list '(m))
(cl:defmethod faults-val ((m <resp_iot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:faults-val is deprecated.  Use mqtt_commx-msg:faults instead.")
  (faults m))

(cl:ensure-generic-function 'mileage-val :lambda-list '(m))
(cl:defmethod mileage-val ((m <resp_iot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:mileage-val is deprecated.  Use mqtt_commx-msg:mileage instead.")
  (mileage m))

(cl:ensure-generic-function 'in_high_voltage-val :lambda-list '(m))
(cl:defmethod in_high_voltage-val ((m <resp_iot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:in_high_voltage-val is deprecated.  Use mqtt_commx-msg:in_high_voltage instead.")
  (in_high_voltage m))

(cl:ensure-generic-function 'vin-val :lambda-list '(m))
(cl:defmethod vin-val ((m <resp_iot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:vin-val is deprecated.  Use mqtt_commx-msg:vin instead.")
  (vin m))

(cl:ensure-generic-function 'task_id-val :lambda-list '(m))
(cl:defmethod task_id-val ((m <resp_iot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:task_id-val is deprecated.  Use mqtt_commx-msg:task_id instead.")
  (task_id m))

(cl:ensure-generic-function 'navi_id-val :lambda-list '(m))
(cl:defmethod navi_id-val ((m <resp_iot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:navi_id-val is deprecated.  Use mqtt_commx-msg:navi_id instead.")
  (navi_id m))

(cl:ensure-generic-function 'task_type-val :lambda-list '(m))
(cl:defmethod task_type-val ((m <resp_iot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:task_type-val is deprecated.  Use mqtt_commx-msg:task_type instead.")
  (task_type m))

(cl:ensure-generic-function 'act_type-val :lambda-list '(m))
(cl:defmethod act_type-val ((m <resp_iot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:act_type-val is deprecated.  Use mqtt_commx-msg:act_type instead.")
  (act_type m))

(cl:ensure-generic-function 'target-val :lambda-list '(m))
(cl:defmethod target-val ((m <resp_iot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:target-val is deprecated.  Use mqtt_commx-msg:target instead.")
  (target m))

(cl:ensure-generic-function 'sub_target-val :lambda-list '(m))
(cl:defmethod sub_target-val ((m <resp_iot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_commx-msg:sub_target-val is deprecated.  Use mqtt_commx-msg:sub_target instead.")
  (sub_target m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <resp_iot>) ostream)
  "Serializes a message object of type '<resp_iot>"
  (cl:let* ((signed (cl:slot-value msg 'state_flow)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'task_mode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'chassis_total_hour)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'drv_direction)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'firm_error_state)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'vehicle_error_status)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'faults) ostream)
  (cl:let* ((signed (cl:slot-value msg 'mileage)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'in_high_voltage) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'vin))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'vin))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'task_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'task_id))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'navi_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'navi_id))
  (cl:let* ((signed (cl:slot-value msg 'task_type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'act_type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'target))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'target))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'sub_target))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'sub_target))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <resp_iot>) istream)
  "Deserializes a message object of type '<resp_iot>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'state_flow) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'task_mode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'chassis_total_hour) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'drv_direction) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'firm_error_state) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'vehicle_error_status) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'faults) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mileage) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:slot-value msg 'in_high_voltage) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'vin) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'vin) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'task_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'task_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
      (cl:setf (cl:slot-value msg 'task_type) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'act_type) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'target) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'target) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sub_target) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'sub_target) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<resp_iot>)))
  "Returns string type for a message object of type '<resp_iot>"
  "mqtt_commx/resp_iot")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'resp_iot)))
  "Returns string type for a message object of type 'resp_iot"
  "mqtt_commx/resp_iot")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<resp_iot>)))
  "Returns md5sum for a message object of type '<resp_iot>"
  "3464ad6bcd20665bf6b59cba1ab9629c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'resp_iot)))
  "Returns md5sum for a message object of type 'resp_iot"
  "3464ad6bcd20665bf6b59cba1ab9629c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<resp_iot>)))
  "Returns full string definition for message of type '<resp_iot>"
  (cl:format cl:nil "int32 state_flow~%int32 task_mode~%int32 chassis_total_hour~%int32 drv_direction~%~%int32 firm_error_state~%int32 vehicle_error_status~%fault_info_array faults~%int32 mileage~%~%bool in_high_voltage~%string vin~%string task_id~%string navi_id~%int32 task_type~%~%int32 act_type~%string target~%string sub_target~%================================================================================~%MSG: mqtt_commx/fault_info_array~%fault_info[] fault_info_data~%int64 timestamp~%================================================================================~%MSG: mqtt_commx/fault_info~%string desc~%int64 code~%int32 level~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'resp_iot)))
  "Returns full string definition for message of type 'resp_iot"
  (cl:format cl:nil "int32 state_flow~%int32 task_mode~%int32 chassis_total_hour~%int32 drv_direction~%~%int32 firm_error_state~%int32 vehicle_error_status~%fault_info_array faults~%int32 mileage~%~%bool in_high_voltage~%string vin~%string task_id~%string navi_id~%int32 task_type~%~%int32 act_type~%string target~%string sub_target~%================================================================================~%MSG: mqtt_commx/fault_info_array~%fault_info[] fault_info_data~%int64 timestamp~%================================================================================~%MSG: mqtt_commx/fault_info~%string desc~%int64 code~%int32 level~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <resp_iot>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'faults))
     4
     1
     4 (cl:length (cl:slot-value msg 'vin))
     4 (cl:length (cl:slot-value msg 'task_id))
     4 (cl:length (cl:slot-value msg 'navi_id))
     4
     4
     4 (cl:length (cl:slot-value msg 'target))
     4 (cl:length (cl:slot-value msg 'sub_target))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <resp_iot>))
  "Converts a ROS message object to a list"
  (cl:list 'resp_iot
    (cl:cons ':state_flow (state_flow msg))
    (cl:cons ':task_mode (task_mode msg))
    (cl:cons ':chassis_total_hour (chassis_total_hour msg))
    (cl:cons ':drv_direction (drv_direction msg))
    (cl:cons ':firm_error_state (firm_error_state msg))
    (cl:cons ':vehicle_error_status (vehicle_error_status msg))
    (cl:cons ':faults (faults msg))
    (cl:cons ':mileage (mileage msg))
    (cl:cons ':in_high_voltage (in_high_voltage msg))
    (cl:cons ':vin (vin msg))
    (cl:cons ':task_id (task_id msg))
    (cl:cons ':navi_id (navi_id msg))
    (cl:cons ':task_type (task_type msg))
    (cl:cons ':act_type (act_type msg))
    (cl:cons ':target (target msg))
    (cl:cons ':sub_target (sub_target msg))
))
