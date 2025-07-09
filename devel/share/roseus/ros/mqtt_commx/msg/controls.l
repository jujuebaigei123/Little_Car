;; Auto-generated. Do not edit!


(when (boundp 'mqtt_commx::controls)
  (if (not (find-package "MQTT_COMMX"))
    (make-package "MQTT_COMMX"))
  (shadow 'controls (find-package "MQTT_COMMX")))
(unless (find-package "MQTT_COMMX::CONTROLS")
  (make-package "MQTT_COMMX::CONTROLS"))

(in-package "ROS")
;;//! \htmlinclude controls.msg.html


(defclass mqtt_commx::controls
  :super ros::object
  :slots (_msgType _agvId _timestamp _taskId _taskType _targetName _targetX _targetY _targetHA _cargoLength _cargoWidth _cargoWeight _cargoId _wheelBase _subtaskCount _subtaskIndex _subtaskAction _pathLength _path _value _channelId _cmd _timeSec _addr _cmdId _ctrlType _stopPosX _stopPosY _stopPosHA _lightStatus _lightType _lightLeftTime _intersectionId ))

(defmethod mqtt_commx::controls
  (:init
   (&key
    ((:msgType __msgType) "")
    ((:agvId __agvId) "")
    ((:timestamp __timestamp) 0)
    ((:taskId __taskId) 0)
    ((:taskType __taskType) 0)
    ((:targetName __targetName) "")
    ((:targetX __targetX) 0.0)
    ((:targetY __targetY) 0.0)
    ((:targetHA __targetHA) 0.0)
    ((:cargoLength __cargoLength) 0.0)
    ((:cargoWidth __cargoWidth) 0.0)
    ((:cargoWeight __cargoWeight) 0.0)
    ((:cargoId __cargoId) "")
    ((:wheelBase __wheelBase) 0.0)
    ((:subtaskCount __subtaskCount) 0)
    ((:subtaskIndex __subtaskIndex) 0)
    ((:subtaskAction __subtaskAction) 0)
    ((:pathLength __pathLength) 0)
    ((:path __path) ())
    ((:value __value) 0)
    ((:channelId __channelId) 0)
    ((:cmd __cmd) 0)
    ((:timeSec __timeSec) 0)
    ((:addr __addr) "")
    ((:cmdId __cmdId) 0)
    ((:ctrlType __ctrlType) "")
    ((:stopPosX __stopPosX) 0.0)
    ((:stopPosY __stopPosY) 0.0)
    ((:stopPosHA __stopPosHA) 0.0)
    ((:lightStatus __lightStatus) 0)
    ((:lightType __lightType) 0)
    ((:lightLeftTime __lightLeftTime) 0)
    ((:intersectionId __intersectionId) 0)
    )
   (send-super :init)
   (setq _msgType (string __msgType))
   (setq _agvId (string __agvId))
   (setq _timestamp (round __timestamp))
   (setq _taskId (round __taskId))
   (setq _taskType (round __taskType))
   (setq _targetName (string __targetName))
   (setq _targetX (float __targetX))
   (setq _targetY (float __targetY))
   (setq _targetHA (float __targetHA))
   (setq _cargoLength (float __cargoLength))
   (setq _cargoWidth (float __cargoWidth))
   (setq _cargoWeight (float __cargoWeight))
   (setq _cargoId (string __cargoId))
   (setq _wheelBase (float __wheelBase))
   (setq _subtaskCount (round __subtaskCount))
   (setq _subtaskIndex (round __subtaskIndex))
   (setq _subtaskAction (round __subtaskAction))
   (setq _pathLength (round __pathLength))
   (setq _path __path)
   (setq _value (round __value))
   (setq _channelId (round __channelId))
   (setq _cmd (round __cmd))
   (setq _timeSec (round __timeSec))
   (setq _addr (string __addr))
   (setq _cmdId (round __cmdId))
   (setq _ctrlType (string __ctrlType))
   (setq _stopPosX (float __stopPosX))
   (setq _stopPosY (float __stopPosY))
   (setq _stopPosHA (float __stopPosHA))
   (setq _lightStatus (round __lightStatus))
   (setq _lightType (round __lightType))
   (setq _lightLeftTime (round __lightLeftTime))
   (setq _intersectionId (round __intersectionId))
   self)
  (:msgType
   (&optional __msgType)
   (if __msgType (setq _msgType __msgType)) _msgType)
  (:agvId
   (&optional __agvId)
   (if __agvId (setq _agvId __agvId)) _agvId)
  (:timestamp
   (&optional __timestamp)
   (if __timestamp (setq _timestamp __timestamp)) _timestamp)
  (:taskId
   (&optional __taskId)
   (if __taskId (setq _taskId __taskId)) _taskId)
  (:taskType
   (&optional __taskType)
   (if __taskType (setq _taskType __taskType)) _taskType)
  (:targetName
   (&optional __targetName)
   (if __targetName (setq _targetName __targetName)) _targetName)
  (:targetX
   (&optional __targetX)
   (if __targetX (setq _targetX __targetX)) _targetX)
  (:targetY
   (&optional __targetY)
   (if __targetY (setq _targetY __targetY)) _targetY)
  (:targetHA
   (&optional __targetHA)
   (if __targetHA (setq _targetHA __targetHA)) _targetHA)
  (:cargoLength
   (&optional __cargoLength)
   (if __cargoLength (setq _cargoLength __cargoLength)) _cargoLength)
  (:cargoWidth
   (&optional __cargoWidth)
   (if __cargoWidth (setq _cargoWidth __cargoWidth)) _cargoWidth)
  (:cargoWeight
   (&optional __cargoWeight)
   (if __cargoWeight (setq _cargoWeight __cargoWeight)) _cargoWeight)
  (:cargoId
   (&optional __cargoId)
   (if __cargoId (setq _cargoId __cargoId)) _cargoId)
  (:wheelBase
   (&optional __wheelBase)
   (if __wheelBase (setq _wheelBase __wheelBase)) _wheelBase)
  (:subtaskCount
   (&optional __subtaskCount)
   (if __subtaskCount (setq _subtaskCount __subtaskCount)) _subtaskCount)
  (:subtaskIndex
   (&optional __subtaskIndex)
   (if __subtaskIndex (setq _subtaskIndex __subtaskIndex)) _subtaskIndex)
  (:subtaskAction
   (&optional __subtaskAction)
   (if __subtaskAction (setq _subtaskAction __subtaskAction)) _subtaskAction)
  (:pathLength
   (&optional __pathLength)
   (if __pathLength (setq _pathLength __pathLength)) _pathLength)
  (:path
   (&rest __path)
   (if (keywordp (car __path))
       (send* _path __path)
     (progn
       (if __path (setq _path (car __path)))
       _path)))
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:channelId
   (&optional __channelId)
   (if __channelId (setq _channelId __channelId)) _channelId)
  (:cmd
   (&optional __cmd)
   (if __cmd (setq _cmd __cmd)) _cmd)
  (:timeSec
   (&optional __timeSec)
   (if __timeSec (setq _timeSec __timeSec)) _timeSec)
  (:addr
   (&optional __addr)
   (if __addr (setq _addr __addr)) _addr)
  (:cmdId
   (&optional __cmdId)
   (if __cmdId (setq _cmdId __cmdId)) _cmdId)
  (:ctrlType
   (&optional __ctrlType)
   (if __ctrlType (setq _ctrlType __ctrlType)) _ctrlType)
  (:stopPosX
   (&optional __stopPosX)
   (if __stopPosX (setq _stopPosX __stopPosX)) _stopPosX)
  (:stopPosY
   (&optional __stopPosY)
   (if __stopPosY (setq _stopPosY __stopPosY)) _stopPosY)
  (:stopPosHA
   (&optional __stopPosHA)
   (if __stopPosHA (setq _stopPosHA __stopPosHA)) _stopPosHA)
  (:lightStatus
   (&optional __lightStatus)
   (if __lightStatus (setq _lightStatus __lightStatus)) _lightStatus)
  (:lightType
   (&optional __lightType)
   (if __lightType (setq _lightType __lightType)) _lightType)
  (:lightLeftTime
   (&optional __lightLeftTime)
   (if __lightLeftTime (setq _lightLeftTime __lightLeftTime)) _lightLeftTime)
  (:intersectionId
   (&optional __intersectionId)
   (if __intersectionId (setq _intersectionId __intersectionId)) _intersectionId)
  (:serialization-length
   ()
   (+
    ;; string _msgType
    4 (length _msgType)
    ;; string _agvId
    4 (length _agvId)
    ;; int64 _timestamp
    8
    ;; int32 _taskId
    4
    ;; int32 _taskType
    4
    ;; string _targetName
    4 (length _targetName)
    ;; float64 _targetX
    8
    ;; float64 _targetY
    8
    ;; float64 _targetHA
    8
    ;; float64 _cargoLength
    8
    ;; float64 _cargoWidth
    8
    ;; float64 _cargoWeight
    8
    ;; string _cargoId
    4 (length _cargoId)
    ;; float64 _wheelBase
    8
    ;; int32 _subtaskCount
    4
    ;; int32 _subtaskIndex
    4
    ;; int32 _subtaskAction
    4
    ;; int32 _pathLength
    4
    ;; mqtt_commx/path_point[] _path
    (apply #'+ (send-all _path :serialization-length)) 4
    ;; int32 _value
    4
    ;; int32 _channelId
    4
    ;; int32 _cmd
    4
    ;; int32 _timeSec
    4
    ;; string _addr
    4 (length _addr)
    ;; int32 _cmdId
    4
    ;; string _ctrlType
    4 (length _ctrlType)
    ;; float64 _stopPosX
    8
    ;; float64 _stopPosY
    8
    ;; float64 _stopPosHA
    8
    ;; int32 _lightStatus
    4
    ;; int32 _lightType
    4
    ;; int32 _lightLeftTime
    4
    ;; int32 _intersectionId
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _msgType
       (write-long (length _msgType) s) (princ _msgType s)
     ;; string _agvId
       (write-long (length _agvId) s) (princ _agvId s)
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
     ;; int32 _taskId
       (write-long _taskId s)
     ;; int32 _taskType
       (write-long _taskType s)
     ;; string _targetName
       (write-long (length _targetName) s) (princ _targetName s)
     ;; float64 _targetX
       (sys::poke _targetX (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _targetY
       (sys::poke _targetY (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _targetHA
       (sys::poke _targetHA (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _cargoLength
       (sys::poke _cargoLength (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _cargoWidth
       (sys::poke _cargoWidth (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _cargoWeight
       (sys::poke _cargoWeight (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string _cargoId
       (write-long (length _cargoId) s) (princ _cargoId s)
     ;; float64 _wheelBase
       (sys::poke _wheelBase (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int32 _subtaskCount
       (write-long _subtaskCount s)
     ;; int32 _subtaskIndex
       (write-long _subtaskIndex s)
     ;; int32 _subtaskAction
       (write-long _subtaskAction s)
     ;; int32 _pathLength
       (write-long _pathLength s)
     ;; mqtt_commx/path_point[] _path
     (write-long (length _path) s)
     (dolist (elem _path)
       (send elem :serialize s)
       )
     ;; int32 _value
       (write-long _value s)
     ;; int32 _channelId
       (write-long _channelId s)
     ;; int32 _cmd
       (write-long _cmd s)
     ;; int32 _timeSec
       (write-long _timeSec s)
     ;; string _addr
       (write-long (length _addr) s) (princ _addr s)
     ;; int32 _cmdId
       (write-long _cmdId s)
     ;; string _ctrlType
       (write-long (length _ctrlType) s) (princ _ctrlType s)
     ;; float64 _stopPosX
       (sys::poke _stopPosX (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _stopPosY
       (sys::poke _stopPosY (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _stopPosHA
       (sys::poke _stopPosHA (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int32 _lightStatus
       (write-long _lightStatus s)
     ;; int32 _lightType
       (write-long _lightType s)
     ;; int32 _lightLeftTime
       (write-long _lightLeftTime s)
     ;; int32 _intersectionId
       (write-long _intersectionId s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _msgType
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _msgType (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _agvId
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _agvId (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
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
   ;; int32 _taskId
     (setq _taskId (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _taskType
     (setq _taskType (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _targetName
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _targetName (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _targetX
     (setq _targetX (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _targetY
     (setq _targetY (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _targetHA
     (setq _targetHA (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _cargoLength
     (setq _cargoLength (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _cargoWidth
     (setq _cargoWidth (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _cargoWeight
     (setq _cargoWeight (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string _cargoId
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _cargoId (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _wheelBase
     (setq _wheelBase (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int32 _subtaskCount
     (setq _subtaskCount (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _subtaskIndex
     (setq _subtaskIndex (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _subtaskAction
     (setq _subtaskAction (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _pathLength
     (setq _pathLength (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; mqtt_commx/path_point[] _path
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _path (let (r) (dotimes (i n) (push (instance mqtt_commx::path_point :init) r)) r))
     (dolist (elem- _path)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; int32 _value
     (setq _value (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _channelId
     (setq _channelId (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _cmd
     (setq _cmd (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _timeSec
     (setq _timeSec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _addr
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _addr (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _cmdId
     (setq _cmdId (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _ctrlType
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _ctrlType (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _stopPosX
     (setq _stopPosX (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _stopPosY
     (setq _stopPosY (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _stopPosHA
     (setq _stopPosHA (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int32 _lightStatus
     (setq _lightStatus (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _lightType
     (setq _lightType (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _lightLeftTime
     (setq _lightLeftTime (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _intersectionId
     (setq _intersectionId (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get mqtt_commx::controls :md5sum-) "fe7b7fdca90c630418f47e94ec5b0182")
(setf (get mqtt_commx::controls :datatype-) "mqtt_commx/controls")
(setf (get mqtt_commx::controls :definition-)
      "string msgType
string agvId
int64 timestamp

#task
int32 taskId
int32 taskType 
string targetName 
float64 targetX
float64 targetY
float64 targetHA
float64 cargoLength
float64 cargoWidth
float64 cargoWeight
string cargoId
float64 wheelBase
int32 subtaskCount
int32 subtaskIndex
int32 subtaskAction
int32 pathLength
path_point[] path

# sync
int32 value

# video
int32 channelId
int32 cmd       
int32 timeSec
string addr

# ctrl
int32 cmdId
string ctrlType
float64 stopPosX
float64 stopPosY
float64 stopPosHA 
int32 lightStatus
int32 lightType
int32 lightLeftTime
int32 intersectionId






================================================================================
MSG: mqtt_commx/path_point
string id
float64 pointX
float64 pointY
float64 pointHA
float32 vehSpeed

")



(provide :mqtt_commx/controls "fe7b7fdca90c630418f47e94ec5b0182")


