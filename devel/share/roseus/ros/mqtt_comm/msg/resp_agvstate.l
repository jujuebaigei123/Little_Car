;; Auto-generated. Do not edit!


(when (boundp 'mqtt_comm::resp_agvstate)
  (if (not (find-package "MQTT_COMM"))
    (make-package "MQTT_COMM"))
  (shadow 'resp_agvstate (find-package "MQTT_COMM")))
(unless (find-package "MQTT_COMM::RESP_AGVSTATE")
  (make-package "MQTT_COMM::RESP_AGVSTATE"))

(in-package "ROS")
;;//! \htmlinclude resp_agvstate.msg.html


(defclass mqtt_comm::resp_agvstate
  :super ros::object
  :slots (_msgType _timestamp _version _mileage _batterySOH _batterySOC _batteryVoltage _batteryCurrent _batterytemperature _charge_state _vehSpeed _pointHA _pointX _pointY _workPointid _steerControlMode _vehCtrlMode _autoDriveEnable _pitchAngle _azimuthAngle _taskId _taskStatus _errCode ))

(defmethod mqtt_comm::resp_agvstate
  (:init
   (&key
    ((:msgType __msgType) "")
    ((:timestamp __timestamp) 0)
    ((:version __version) "")
    ((:mileage __mileage) 0.0)
    ((:batterySOH __batterySOH) 0.0)
    ((:batterySOC __batterySOC) 0.0)
    ((:batteryVoltage __batteryVoltage) 0.0)
    ((:batteryCurrent __batteryCurrent) 0.0)
    ((:batterytemperature __batterytemperature) 0)
    ((:charge_state __charge_state) 0)
    ((:vehSpeed __vehSpeed) 0.0)
    ((:pointHA __pointHA) 0.0)
    ((:pointX __pointX) 0.0)
    ((:pointY __pointY) 0.0)
    ((:workPointid __workPointid) "")
    ((:steerControlMode __steerControlMode) 0)
    ((:vehCtrlMode __vehCtrlMode) 0)
    ((:autoDriveEnable __autoDriveEnable) 0)
    ((:pitchAngle __pitchAngle) 0.0)
    ((:azimuthAngle __azimuthAngle) 0.0)
    ((:taskId __taskId) "")
    ((:taskStatus __taskStatus) 0)
    ((:errCode __errCode) "")
    )
   (send-super :init)
   (setq _msgType (string __msgType))
   (setq _timestamp (round __timestamp))
   (setq _version (string __version))
   (setq _mileage (float __mileage))
   (setq _batterySOH (float __batterySOH))
   (setq _batterySOC (float __batterySOC))
   (setq _batteryVoltage (float __batteryVoltage))
   (setq _batteryCurrent (float __batteryCurrent))
   (setq _batterytemperature (round __batterytemperature))
   (setq _charge_state (round __charge_state))
   (setq _vehSpeed (float __vehSpeed))
   (setq _pointHA (float __pointHA))
   (setq _pointX (float __pointX))
   (setq _pointY (float __pointY))
   (setq _workPointid (string __workPointid))
   (setq _steerControlMode (round __steerControlMode))
   (setq _vehCtrlMode (round __vehCtrlMode))
   (setq _autoDriveEnable (round __autoDriveEnable))
   (setq _pitchAngle (float __pitchAngle))
   (setq _azimuthAngle (float __azimuthAngle))
   (setq _taskId (string __taskId))
   (setq _taskStatus (round __taskStatus))
   (setq _errCode (string __errCode))
   self)
  (:msgType
   (&optional __msgType)
   (if __msgType (setq _msgType __msgType)) _msgType)
  (:timestamp
   (&optional __timestamp)
   (if __timestamp (setq _timestamp __timestamp)) _timestamp)
  (:version
   (&optional __version)
   (if __version (setq _version __version)) _version)
  (:mileage
   (&optional __mileage)
   (if __mileage (setq _mileage __mileage)) _mileage)
  (:batterySOH
   (&optional __batterySOH)
   (if __batterySOH (setq _batterySOH __batterySOH)) _batterySOH)
  (:batterySOC
   (&optional __batterySOC)
   (if __batterySOC (setq _batterySOC __batterySOC)) _batterySOC)
  (:batteryVoltage
   (&optional __batteryVoltage)
   (if __batteryVoltage (setq _batteryVoltage __batteryVoltage)) _batteryVoltage)
  (:batteryCurrent
   (&optional __batteryCurrent)
   (if __batteryCurrent (setq _batteryCurrent __batteryCurrent)) _batteryCurrent)
  (:batterytemperature
   (&optional __batterytemperature)
   (if __batterytemperature (setq _batterytemperature __batterytemperature)) _batterytemperature)
  (:charge_state
   (&optional __charge_state)
   (if __charge_state (setq _charge_state __charge_state)) _charge_state)
  (:vehSpeed
   (&optional __vehSpeed)
   (if __vehSpeed (setq _vehSpeed __vehSpeed)) _vehSpeed)
  (:pointHA
   (&optional __pointHA)
   (if __pointHA (setq _pointHA __pointHA)) _pointHA)
  (:pointX
   (&optional __pointX)
   (if __pointX (setq _pointX __pointX)) _pointX)
  (:pointY
   (&optional __pointY)
   (if __pointY (setq _pointY __pointY)) _pointY)
  (:workPointid
   (&optional __workPointid)
   (if __workPointid (setq _workPointid __workPointid)) _workPointid)
  (:steerControlMode
   (&optional __steerControlMode)
   (if __steerControlMode (setq _steerControlMode __steerControlMode)) _steerControlMode)
  (:vehCtrlMode
   (&optional __vehCtrlMode)
   (if __vehCtrlMode (setq _vehCtrlMode __vehCtrlMode)) _vehCtrlMode)
  (:autoDriveEnable
   (&optional __autoDriveEnable)
   (if __autoDriveEnable (setq _autoDriveEnable __autoDriveEnable)) _autoDriveEnable)
  (:pitchAngle
   (&optional __pitchAngle)
   (if __pitchAngle (setq _pitchAngle __pitchAngle)) _pitchAngle)
  (:azimuthAngle
   (&optional __azimuthAngle)
   (if __azimuthAngle (setq _azimuthAngle __azimuthAngle)) _azimuthAngle)
  (:taskId
   (&optional __taskId)
   (if __taskId (setq _taskId __taskId)) _taskId)
  (:taskStatus
   (&optional __taskStatus)
   (if __taskStatus (setq _taskStatus __taskStatus)) _taskStatus)
  (:errCode
   (&optional __errCode)
   (if __errCode (setq _errCode __errCode)) _errCode)
  (:serialization-length
   ()
   (+
    ;; string _msgType
    4 (length _msgType)
    ;; int64 _timestamp
    8
    ;; string _version
    4 (length _version)
    ;; float64 _mileage
    8
    ;; float64 _batterySOH
    8
    ;; float64 _batterySOC
    8
    ;; float64 _batteryVoltage
    8
    ;; float64 _batteryCurrent
    8
    ;; int32 _batterytemperature
    4
    ;; int32 _charge_state
    4
    ;; float32 _vehSpeed
    4
    ;; float32 _pointHA
    4
    ;; float64 _pointX
    8
    ;; float64 _pointY
    8
    ;; string _workPointid
    4 (length _workPointid)
    ;; int32 _steerControlMode
    4
    ;; int32 _vehCtrlMode
    4
    ;; int32 _autoDriveEnable
    4
    ;; float32 _pitchAngle
    4
    ;; float32 _azimuthAngle
    4
    ;; string _taskId
    4 (length _taskId)
    ;; int32 _taskStatus
    4
    ;; string _errCode
    4 (length _errCode)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _msgType
       (write-long (length _msgType) s) (princ _msgType s)
     ;; int64 _timestamp
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _timestamp (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _timestamp) (= (length (_timestamp . bv)) 2)) ;; bignum
              (write-long (ash (elt (_timestamp . bv) 0) 0) s)
              (write-long (ash (elt (_timestamp . bv) 1) -1) s))
             ((and (class _timestamp) (= (length (_timestamp . bv)) 1)) ;; big1
              (write-long (elt (_timestamp . bv) 0) s)
              (write-long (if (>= _timestamp 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _timestamp s)(write-long (if (>= _timestamp 0) 0 #xffffffff) s)))
     ;; string _version
       (write-long (length _version) s) (princ _version s)
     ;; float64 _mileage
       (sys::poke _mileage (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _batterySOH
       (sys::poke _batterySOH (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _batterySOC
       (sys::poke _batterySOC (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _batteryVoltage
       (sys::poke _batteryVoltage (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _batteryCurrent
       (sys::poke _batteryCurrent (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int32 _batterytemperature
       (write-long _batterytemperature s)
     ;; int32 _charge_state
       (write-long _charge_state s)
     ;; float32 _vehSpeed
       (sys::poke _vehSpeed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pointHA
       (sys::poke _pointHA (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float64 _pointX
       (sys::poke _pointX (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pointY
       (sys::poke _pointY (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string _workPointid
       (write-long (length _workPointid) s) (princ _workPointid s)
     ;; int32 _steerControlMode
       (write-long _steerControlMode s)
     ;; int32 _vehCtrlMode
       (write-long _vehCtrlMode s)
     ;; int32 _autoDriveEnable
       (write-long _autoDriveEnable s)
     ;; float32 _pitchAngle
       (sys::poke _pitchAngle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _azimuthAngle
       (sys::poke _azimuthAngle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _taskId
       (write-long (length _taskId) s) (princ _taskId s)
     ;; int32 _taskStatus
       (write-long _taskStatus s)
     ;; string _errCode
       (write-long (length _errCode) s) (princ _errCode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _msgType
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _msgType (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int64 _timestamp
#+(or :alpha :irix6 :x86_64)
      (setf _timestamp (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _timestamp (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; string _version
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _version (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _mileage
     (setq _mileage (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _batterySOH
     (setq _batterySOH (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _batterySOC
     (setq _batterySOC (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _batteryVoltage
     (setq _batteryVoltage (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _batteryCurrent
     (setq _batteryCurrent (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int32 _batterytemperature
     (setq _batterytemperature (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _charge_state
     (setq _charge_state (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _vehSpeed
     (setq _vehSpeed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pointHA
     (setq _pointHA (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float64 _pointX
     (setq _pointX (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pointY
     (setq _pointY (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string _workPointid
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _workPointid (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _steerControlMode
     (setq _steerControlMode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _vehCtrlMode
     (setq _vehCtrlMode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _autoDriveEnable
     (setq _autoDriveEnable (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _pitchAngle
     (setq _pitchAngle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _azimuthAngle
     (setq _azimuthAngle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _taskId
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _taskId (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _taskStatus
     (setq _taskStatus (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _errCode
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _errCode (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get mqtt_comm::resp_agvstate :md5sum-) "9afde21e9d1bc354804e4cf18e51c787")
(setf (get mqtt_comm::resp_agvstate :datatype-) "mqtt_comm/resp_agvstate")
(setf (get mqtt_comm::resp_agvstate :definition-)
      "string msgType
int64 timestamp
string version

float64 mileage
float64 batterySOH
float64 batterySOC
float64 batteryVoltage
float64 batteryCurrent
int32 batterytemperature
int32 charge_state

float32 vehSpeed    
float32 pointHA
float64 pointX
float64 pointY
string workPointid

int32 steerControlMode
int32 vehCtrlMode	
int32 autoDriveEnable	

float32 pitchAngle
float32 azimuthAngle

string taskId
int32 taskStatus
string errCode


")



(provide :mqtt_comm/resp_agvstate "9afde21e9d1bc354804e4cf18e51c787")


