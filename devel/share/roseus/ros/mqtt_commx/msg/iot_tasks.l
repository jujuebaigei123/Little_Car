;; Auto-generated. Do not edit!


(when (boundp 'mqtt_commx::iot_tasks)
  (if (not (find-package "MQTT_COMMX"))
    (make-package "MQTT_COMMX"))
  (shadow 'iot_tasks (find-package "MQTT_COMMX")))
(unless (find-package "MQTT_COMMX::IOT_TASKS")
  (make-package "MQTT_COMMX::IOT_TASKS"))

(in-package "ROS")
;;//! \htmlinclude iot_tasks.msg.html


(defclass mqtt_commx::iot_tasks
  :super ros::object
  :slots (_header _taskId _taskType _target _sub_target _targetX _targetY _targetHA _cargoLength _cargoWidth _cargoHeight _cargoId ))

(defmethod mqtt_commx::iot_tasks
  (:init
   (&key
    ((:header __header) (instance mqtt_commx::cmd_Header :init))
    ((:taskId __taskId) "")
    ((:taskType __taskType) 0)
    ((:target __target) "")
    ((:sub_target __sub_target) "")
    ((:targetX __targetX) 0.0)
    ((:targetY __targetY) 0.0)
    ((:targetHA __targetHA) 0.0)
    ((:cargoLength __cargoLength) 0.0)
    ((:cargoWidth __cargoWidth) 0.0)
    ((:cargoHeight __cargoHeight) 0.0)
    ((:cargoId __cargoId) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _taskId (string __taskId))
   (setq _taskType (round __taskType))
   (setq _target (string __target))
   (setq _sub_target (string __sub_target))
   (setq _targetX (float __targetX))
   (setq _targetY (float __targetY))
   (setq _targetHA (float __targetHA))
   (setq _cargoLength (float __cargoLength))
   (setq _cargoWidth (float __cargoWidth))
   (setq _cargoHeight (float __cargoHeight))
   (setq _cargoId (string __cargoId))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:taskId
   (&optional __taskId)
   (if __taskId (setq _taskId __taskId)) _taskId)
  (:taskType
   (&optional __taskType)
   (if __taskType (setq _taskType __taskType)) _taskType)
  (:target
   (&optional __target)
   (if __target (setq _target __target)) _target)
  (:sub_target
   (&optional __sub_target)
   (if __sub_target (setq _sub_target __sub_target)) _sub_target)
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
  (:cargoHeight
   (&optional __cargoHeight)
   (if __cargoHeight (setq _cargoHeight __cargoHeight)) _cargoHeight)
  (:cargoId
   (&optional __cargoId)
   (if __cargoId (setq _cargoId __cargoId)) _cargoId)
  (:serialization-length
   ()
   (+
    ;; mqtt_commx/cmd_Header _header
    (send _header :serialization-length)
    ;; string _taskId
    4 (length _taskId)
    ;; int32 _taskType
    4
    ;; string _target
    4 (length _target)
    ;; string _sub_target
    4 (length _sub_target)
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
    ;; float64 _cargoHeight
    8
    ;; string _cargoId
    4 (length _cargoId)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; mqtt_commx/cmd_Header _header
       (send _header :serialize s)
     ;; string _taskId
       (write-long (length _taskId) s) (princ _taskId s)
     ;; int32 _taskType
       (write-long _taskType s)
     ;; string _target
       (write-long (length _target) s) (princ _target s)
     ;; string _sub_target
       (write-long (length _sub_target) s) (princ _sub_target s)
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
     ;; float64 _cargoHeight
       (sys::poke _cargoHeight (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string _cargoId
       (write-long (length _cargoId) s) (princ _cargoId s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; mqtt_commx/cmd_Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _taskId
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _taskId (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _taskType
     (setq _taskType (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _target
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _target (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _sub_target
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _sub_target (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
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
   ;; float64 _cargoHeight
     (setq _cargoHeight (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string _cargoId
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _cargoId (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get mqtt_commx::iot_tasks :md5sum-) "e19a52af0fdaf396449227820a086c35")
(setf (get mqtt_commx::iot_tasks :datatype-) "mqtt_commx/iot_tasks")
(setf (get mqtt_commx::iot_tasks :definition-)
      "cmd_Header header


#task
string taskId         #任务号
int32 taskType        #任务类型
string target         #任务大区
string sub_target     #车位号
float64 targetX       #目标x
float64 targetY       #目标y
float64 targetHA      #目标航相角

float64 cargoLength   #商品车长宽高
float64 cargoWidth
float64 cargoHeight

string cargoId        #商品车射频码










================================================================================
MSG: mqtt_commx/cmd_Header
string trace_id
string trans_id
string che_id
string timestamp
string version
")



(provide :mqtt_commx/iot_tasks "e19a52af0fdaf396449227820a086c35")


