;; Auto-generated. Do not edit!


(when (boundp 'mqtt_commx::iot_act_status)
  (if (not (find-package "MQTT_COMMX"))
    (make-package "MQTT_COMMX"))
  (shadow 'iot_act_status (find-package "MQTT_COMMX")))
(unless (find-package "MQTT_COMMX::IOT_ACT_STATUS")
  (make-package "MQTT_COMMX::IOT_ACT_STATUS"))

(in-package "ROS")
;;//! \htmlinclude iot_act_status.msg.html


(defclass mqtt_commx::iot_act_status
  :super ros::object
  :slots (_all_status _timestamp ))

(defmethod mqtt_commx::iot_act_status
  (:init
   (&key
    ((:all_status __all_status) ())
    ((:timestamp __timestamp) 0)
    )
   (send-super :init)
   (setq _all_status __all_status)
   (setq _timestamp (round __timestamp))
   self)
  (:all_status
   (&rest __all_status)
   (if (keywordp (car __all_status))
       (send* _all_status __all_status)
     (progn
       (if __all_status (setq _all_status (car __all_status)))
       _all_status)))
  (:timestamp
   (&optional __timestamp)
   (if __timestamp (setq _timestamp __timestamp)) _timestamp)
  (:serialization-length
   ()
   (+
    ;; mqtt_commx/act_status[] _all_status
    (apply #'+ (send-all _all_status :serialization-length)) 4
    ;; int64 _timestamp
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; mqtt_commx/act_status[] _all_status
     (write-long (length _all_status) s)
     (dolist (elem _all_status)
       (send elem :serialize s)
       )
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
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; mqtt_commx/act_status[] _all_status
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _all_status (let (r) (dotimes (i n) (push (instance mqtt_commx::act_status :init) r)) r))
     (dolist (elem- _all_status)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
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
   ;;
   self)
  )

(setf (get mqtt_commx::iot_act_status :md5sum-) "cd9100d9e84b9bf263922df0a9c28149")
(setf (get mqtt_commx::iot_act_status :datatype-) "mqtt_commx/iot_act_status")
(setf (get mqtt_commx::iot_act_status :definition-)
      "act_status[]  all_status
int64 timestamp
================================================================================
MSG: mqtt_commx/act_status
cmd_Header header
Point point
fault_info[]  faults

int64 act_type
int64 chassis_total_hour
float64 distance_to_target
int64 drv_direction
bool empty
bool estop
int64 firm_error_status
int64 frame_ts
int64 gear
bool in_high_voltage    # 取车状态
bool is_charging
int64 mileage
int64 motion_mode
string navi_id
int64 operational_status
int64 platform_state
int64 soc
int64 soh
float64 speed
int64 state_flow
string sub_target
string target
string task_id
int64 task_mode
int64 task_type
int64 turn_light
int64 vehicle_error_status
string vin

================================================================================
MSG: mqtt_commx/cmd_Header
string trace_id
string trans_id
string che_id
string timestamp
string version
================================================================================
MSG: mqtt_commx/Point
float64 x
float64 y
float64 yaw
float64 z

================================================================================
MSG: mqtt_commx/fault_info
string desc
int64 code
int32 level

")



(provide :mqtt_commx/iot_act_status "cd9100d9e84b9bf263922df0a9c28149")


