; Auto-generated. Do not edit!


(cl:in-package mqtt_comm-msg)


;//! \htmlinclude resp_agvstate.msg.html

(cl:defclass <resp_agvstate> (roslisp-msg-protocol:ros-message)
  ((msgType
    :reader msgType
    :initarg :msgType
    :type cl:string
    :initform "")
   (timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:integer
    :initform 0)
   (version
    :reader version
    :initarg :version
    :type cl:string
    :initform "")
   (mileage
    :reader mileage
    :initarg :mileage
    :type cl:float
    :initform 0.0)
   (batterySOH
    :reader batterySOH
    :initarg :batterySOH
    :type cl:float
    :initform 0.0)
   (batterySOC
    :reader batterySOC
    :initarg :batterySOC
    :type cl:float
    :initform 0.0)
   (batteryVoltage
    :reader batteryVoltage
    :initarg :batteryVoltage
    :type cl:float
    :initform 0.0)
   (batteryCurrent
    :reader batteryCurrent
    :initarg :batteryCurrent
    :type cl:float
    :initform 0.0)
   (batterytemperature
    :reader batterytemperature
    :initarg :batterytemperature
    :type cl:integer
    :initform 0)
   (charge_state
    :reader charge_state
    :initarg :charge_state
    :type cl:integer
    :initform 0)
   (vehSpeed
    :reader vehSpeed
    :initarg :vehSpeed
    :type cl:float
    :initform 0.0)
   (pointHA
    :reader pointHA
    :initarg :pointHA
    :type cl:float
    :initform 0.0)
   (pointX
    :reader pointX
    :initarg :pointX
    :type cl:float
    :initform 0.0)
   (pointY
    :reader pointY
    :initarg :pointY
    :type cl:float
    :initform 0.0)
   (workPointid
    :reader workPointid
    :initarg :workPointid
    :type cl:string
    :initform "")
   (steerControlMode
    :reader steerControlMode
    :initarg :steerControlMode
    :type cl:integer
    :initform 0)
   (vehCtrlMode
    :reader vehCtrlMode
    :initarg :vehCtrlMode
    :type cl:integer
    :initform 0)
   (autoDriveEnable
    :reader autoDriveEnable
    :initarg :autoDriveEnable
    :type cl:integer
    :initform 0)
   (pitchAngle
    :reader pitchAngle
    :initarg :pitchAngle
    :type cl:float
    :initform 0.0)
   (azimuthAngle
    :reader azimuthAngle
    :initarg :azimuthAngle
    :type cl:float
    :initform 0.0)
   (taskId
    :reader taskId
    :initarg :taskId
    :type cl:string
    :initform "")
   (taskStatus
    :reader taskStatus
    :initarg :taskStatus
    :type cl:integer
    :initform 0)
   (errCode
    :reader errCode
    :initarg :errCode
    :type cl:string
    :initform ""))
)

(cl:defclass resp_agvstate (<resp_agvstate>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <resp_agvstate>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'resp_agvstate)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mqtt_comm-msg:<resp_agvstate> is deprecated: use mqtt_comm-msg:resp_agvstate instead.")))

(cl:ensure-generic-function 'msgType-val :lambda-list '(m))
(cl:defmethod msgType-val ((m <resp_agvstate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:msgType-val is deprecated.  Use mqtt_comm-msg:msgType instead.")
  (msgType m))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <resp_agvstate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:timestamp-val is deprecated.  Use mqtt_comm-msg:timestamp instead.")
  (timestamp m))

(cl:ensure-generic-function 'version-val :lambda-list '(m))
(cl:defmethod version-val ((m <resp_agvstate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:version-val is deprecated.  Use mqtt_comm-msg:version instead.")
  (version m))

(cl:ensure-generic-function 'mileage-val :lambda-list '(m))
(cl:defmethod mileage-val ((m <resp_agvstate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:mileage-val is deprecated.  Use mqtt_comm-msg:mileage instead.")
  (mileage m))

(cl:ensure-generic-function 'batterySOH-val :lambda-list '(m))
(cl:defmethod batterySOH-val ((m <resp_agvstate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:batterySOH-val is deprecated.  Use mqtt_comm-msg:batterySOH instead.")
  (batterySOH m))

(cl:ensure-generic-function 'batterySOC-val :lambda-list '(m))
(cl:defmethod batterySOC-val ((m <resp_agvstate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:batterySOC-val is deprecated.  Use mqtt_comm-msg:batterySOC instead.")
  (batterySOC m))

(cl:ensure-generic-function 'batteryVoltage-val :lambda-list '(m))
(cl:defmethod batteryVoltage-val ((m <resp_agvstate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:batteryVoltage-val is deprecated.  Use mqtt_comm-msg:batteryVoltage instead.")
  (batteryVoltage m))

(cl:ensure-generic-function 'batteryCurrent-val :lambda-list '(m))
(cl:defmethod batteryCurrent-val ((m <resp_agvstate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:batteryCurrent-val is deprecated.  Use mqtt_comm-msg:batteryCurrent instead.")
  (batteryCurrent m))

(cl:ensure-generic-function 'batterytemperature-val :lambda-list '(m))
(cl:defmethod batterytemperature-val ((m <resp_agvstate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:batterytemperature-val is deprecated.  Use mqtt_comm-msg:batterytemperature instead.")
  (batterytemperature m))

(cl:ensure-generic-function 'charge_state-val :lambda-list '(m))
(cl:defmethod charge_state-val ((m <resp_agvstate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:charge_state-val is deprecated.  Use mqtt_comm-msg:charge_state instead.")
  (charge_state m))

(cl:ensure-generic-function 'vehSpeed-val :lambda-list '(m))
(cl:defmethod vehSpeed-val ((m <resp_agvstate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:vehSpeed-val is deprecated.  Use mqtt_comm-msg:vehSpeed instead.")
  (vehSpeed m))

(cl:ensure-generic-function 'pointHA-val :lambda-list '(m))
(cl:defmethod pointHA-val ((m <resp_agvstate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:pointHA-val is deprecated.  Use mqtt_comm-msg:pointHA instead.")
  (pointHA m))

(cl:ensure-generic-function 'pointX-val :lambda-list '(m))
(cl:defmethod pointX-val ((m <resp_agvstate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:pointX-val is deprecated.  Use mqtt_comm-msg:pointX instead.")
  (pointX m))

(cl:ensure-generic-function 'pointY-val :lambda-list '(m))
(cl:defmethod pointY-val ((m <resp_agvstate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:pointY-val is deprecated.  Use mqtt_comm-msg:pointY instead.")
  (pointY m))

(cl:ensure-generic-function 'workPointid-val :lambda-list '(m))
(cl:defmethod workPointid-val ((m <resp_agvstate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:workPointid-val is deprecated.  Use mqtt_comm-msg:workPointid instead.")
  (workPointid m))

(cl:ensure-generic-function 'steerControlMode-val :lambda-list '(m))
(cl:defmethod steerControlMode-val ((m <resp_agvstate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:steerControlMode-val is deprecated.  Use mqtt_comm-msg:steerControlMode instead.")
  (steerControlMode m))

(cl:ensure-generic-function 'vehCtrlMode-val :lambda-list '(m))
(cl:defmethod vehCtrlMode-val ((m <resp_agvstate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:vehCtrlMode-val is deprecated.  Use mqtt_comm-msg:vehCtrlMode instead.")
  (vehCtrlMode m))

(cl:ensure-generic-function 'autoDriveEnable-val :lambda-list '(m))
(cl:defmethod autoDriveEnable-val ((m <resp_agvstate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:autoDriveEnable-val is deprecated.  Use mqtt_comm-msg:autoDriveEnable instead.")
  (autoDriveEnable m))

(cl:ensure-generic-function 'pitchAngle-val :lambda-list '(m))
(cl:defmethod pitchAngle-val ((m <resp_agvstate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:pitchAngle-val is deprecated.  Use mqtt_comm-msg:pitchAngle instead.")
  (pitchAngle m))

(cl:ensure-generic-function 'azimuthAngle-val :lambda-list '(m))
(cl:defmethod azimuthAngle-val ((m <resp_agvstate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:azimuthAngle-val is deprecated.  Use mqtt_comm-msg:azimuthAngle instead.")
  (azimuthAngle m))

(cl:ensure-generic-function 'taskId-val :lambda-list '(m))
(cl:defmethod taskId-val ((m <resp_agvstate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:taskId-val is deprecated.  Use mqtt_comm-msg:taskId instead.")
  (taskId m))

(cl:ensure-generic-function 'taskStatus-val :lambda-list '(m))
(cl:defmethod taskStatus-val ((m <resp_agvstate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:taskStatus-val is deprecated.  Use mqtt_comm-msg:taskStatus instead.")
  (taskStatus m))

(cl:ensure-generic-function 'errCode-val :lambda-list '(m))
(cl:defmethod errCode-val ((m <resp_agvstate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mqtt_comm-msg:errCode-val is deprecated.  Use mqtt_comm-msg:errCode instead.")
  (errCode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <resp_agvstate>) ostream)
  "Serializes a message object of type '<resp_agvstate>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'msgType))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'msgType))
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
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'version))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'version))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'mileage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'batterySOH))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'batterySOC))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'batteryVoltage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'batteryCurrent))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'batterytemperature)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'charge_state)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vehSpeed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pointHA))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pointX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pointY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'workPointid))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'workPointid))
  (cl:let* ((signed (cl:slot-value msg 'steerControlMode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'vehCtrlMode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'autoDriveEnable)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pitchAngle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'azimuthAngle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'taskId))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'taskId))
  (cl:let* ((signed (cl:slot-value msg 'taskStatus)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'errCode))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'errCode))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <resp_agvstate>) istream)
  "Deserializes a message object of type '<resp_agvstate>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'msgType) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'msgType) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
      (cl:setf (cl:slot-value msg 'version) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'version) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mileage) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'batterySOH) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'batterySOC) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'batteryVoltage) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'batteryCurrent) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'batterytemperature) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'charge_state) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vehSpeed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pointHA) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pointX) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pointY) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'workPointid) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'workPointid) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'steerControlMode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'vehCtrlMode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'autoDriveEnable) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitchAngle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'azimuthAngle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'taskId) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'taskId) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'taskStatus) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'errCode) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'errCode) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<resp_agvstate>)))
  "Returns string type for a message object of type '<resp_agvstate>"
  "mqtt_comm/resp_agvstate")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'resp_agvstate)))
  "Returns string type for a message object of type 'resp_agvstate"
  "mqtt_comm/resp_agvstate")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<resp_agvstate>)))
  "Returns md5sum for a message object of type '<resp_agvstate>"
  "9afde21e9d1bc354804e4cf18e51c787")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'resp_agvstate)))
  "Returns md5sum for a message object of type 'resp_agvstate"
  "9afde21e9d1bc354804e4cf18e51c787")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<resp_agvstate>)))
  "Returns full string definition for message of type '<resp_agvstate>"
  (cl:format cl:nil "string msgType~%int64 timestamp~%string version~%~%float64 mileage~%float64 batterySOH~%float64 batterySOC~%float64 batteryVoltage~%float64 batteryCurrent~%int32 batterytemperature~%int32 charge_state~%~%float32 vehSpeed    ~%float32 pointHA~%float64 pointX~%float64 pointY~%string workPointid~%~%int32 steerControlMode~%int32 vehCtrlMode	~%int32 autoDriveEnable	~%~%float32 pitchAngle~%float32 azimuthAngle~%~%string taskId~%int32 taskStatus~%string errCode~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'resp_agvstate)))
  "Returns full string definition for message of type 'resp_agvstate"
  (cl:format cl:nil "string msgType~%int64 timestamp~%string version~%~%float64 mileage~%float64 batterySOH~%float64 batterySOC~%float64 batteryVoltage~%float64 batteryCurrent~%int32 batterytemperature~%int32 charge_state~%~%float32 vehSpeed    ~%float32 pointHA~%float64 pointX~%float64 pointY~%string workPointid~%~%int32 steerControlMode~%int32 vehCtrlMode	~%int32 autoDriveEnable	~%~%float32 pitchAngle~%float32 azimuthAngle~%~%string taskId~%int32 taskStatus~%string errCode~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <resp_agvstate>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'msgType))
     8
     4 (cl:length (cl:slot-value msg 'version))
     8
     8
     8
     8
     8
     4
     4
     4
     4
     8
     8
     4 (cl:length (cl:slot-value msg 'workPointid))
     4
     4
     4
     4
     4
     4 (cl:length (cl:slot-value msg 'taskId))
     4
     4 (cl:length (cl:slot-value msg 'errCode))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <resp_agvstate>))
  "Converts a ROS message object to a list"
  (cl:list 'resp_agvstate
    (cl:cons ':msgType (msgType msg))
    (cl:cons ':timestamp (timestamp msg))
    (cl:cons ':version (version msg))
    (cl:cons ':mileage (mileage msg))
    (cl:cons ':batterySOH (batterySOH msg))
    (cl:cons ':batterySOC (batterySOC msg))
    (cl:cons ':batteryVoltage (batteryVoltage msg))
    (cl:cons ':batteryCurrent (batteryCurrent msg))
    (cl:cons ':batterytemperature (batterytemperature msg))
    (cl:cons ':charge_state (charge_state msg))
    (cl:cons ':vehSpeed (vehSpeed msg))
    (cl:cons ':pointHA (pointHA msg))
    (cl:cons ':pointX (pointX msg))
    (cl:cons ':pointY (pointY msg))
    (cl:cons ':workPointid (workPointid msg))
    (cl:cons ':steerControlMode (steerControlMode msg))
    (cl:cons ':vehCtrlMode (vehCtrlMode msg))
    (cl:cons ':autoDriveEnable (autoDriveEnable msg))
    (cl:cons ':pitchAngle (pitchAngle msg))
    (cl:cons ':azimuthAngle (azimuthAngle msg))
    (cl:cons ':taskId (taskId msg))
    (cl:cons ':taskStatus (taskStatus msg))
    (cl:cons ':errCode (errCode msg))
))
