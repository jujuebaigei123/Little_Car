;; Auto-generated. Do not edit!


(when (boundp 'mqtt_commx::resp_iot)
  (if (not (find-package "MQTT_COMMX"))
    (make-package "MQTT_COMMX"))
  (shadow 'resp_iot (find-package "MQTT_COMMX")))
(unless (find-package "MQTT_COMMX::RESP_IOT")
  (make-package "MQTT_COMMX::RESP_IOT"))

(in-package "ROS")
;;//! \htmlinclude resp_iot.msg.html


(defclass mqtt_commx::resp_iot
  :super ros::object
  :slots (_state_flow _task_mode _chassis_total_hour _drv_direction _firm_error_state _vehicle_error_status _faults _mileage _in_high_voltage _vin _task_id _navi_id _task_type _act_type _target _sub_target ))

(defmethod mqtt_commx::resp_iot
  (:init
   (&key
    ((:state_flow __state_flow) 0)
    ((:task_mode __task_mode) 0)
    ((:chassis_total_hour __chassis_total_hour) 0)
    ((:drv_direction __drv_direction) 0)
    ((:firm_error_state __firm_error_state) 0)
    ((:vehicle_error_status __vehicle_error_status) 0)
    ((:faults __faults) (instance mqtt_commx::fault_info_array :init))
    ((:mileage __mileage) 0)
    ((:in_high_voltage __in_high_voltage) nil)
    ((:vin __vin) "")
    ((:task_id __task_id) "")
    ((:navi_id __navi_id) "")
    ((:task_type __task_type) 0)
    ((:act_type __act_type) 0)
    ((:target __target) "")
    ((:sub_target __sub_target) "")
    )
   (send-super :init)
   (setq _state_flow (round __state_flow))
   (setq _task_mode (round __task_mode))
   (setq _chassis_total_hour (round __chassis_total_hour))
   (setq _drv_direction (round __drv_direction))
   (setq _firm_error_state (round __firm_error_state))
   (setq _vehicle_error_status (round __vehicle_error_status))
   (setq _faults __faults)
   (setq _mileage (round __mileage))
   (setq _in_high_voltage __in_high_voltage)
   (setq _vin (string __vin))
   (setq _task_id (string __task_id))
   (setq _navi_id (string __navi_id))
   (setq _task_type (round __task_type))
   (setq _act_type (round __act_type))
   (setq _target (string __target))
   (setq _sub_target (string __sub_target))
   self)
  (:state_flow
   (&optional __state_flow)
   (if __state_flow (setq _state_flow __state_flow)) _state_flow)
  (:task_mode
   (&optional __task_mode)
   (if __task_mode (setq _task_mode __task_mode)) _task_mode)
  (:chassis_total_hour
   (&optional __chassis_total_hour)
   (if __chassis_total_hour (setq _chassis_total_hour __chassis_total_hour)) _chassis_total_hour)
  (:drv_direction
   (&optional __drv_direction)
   (if __drv_direction (setq _drv_direction __drv_direction)) _drv_direction)
  (:firm_error_state
   (&optional __firm_error_state)
   (if __firm_error_state (setq _firm_error_state __firm_error_state)) _firm_error_state)
  (:vehicle_error_status
   (&optional __vehicle_error_status)
   (if __vehicle_error_status (setq _vehicle_error_status __vehicle_error_status)) _vehicle_error_status)
  (:faults
   (&rest __faults)
   (if (keywordp (car __faults))
       (send* _faults __faults)
     (progn
       (if __faults (setq _faults (car __faults)))
       _faults)))
  (:mileage
   (&optional __mileage)
   (if __mileage (setq _mileage __mileage)) _mileage)
  (:in_high_voltage
   (&optional (__in_high_voltage :null))
   (if (not (eq __in_high_voltage :null)) (setq _in_high_voltage __in_high_voltage)) _in_high_voltage)
  (:vin
   (&optional __vin)
   (if __vin (setq _vin __vin)) _vin)
  (:task_id
   (&optional __task_id)
   (if __task_id (setq _task_id __task_id)) _task_id)
  (:navi_id
   (&optional __navi_id)
   (if __navi_id (setq _navi_id __navi_id)) _navi_id)
  (:task_type
   (&optional __task_type)
   (if __task_type (setq _task_type __task_type)) _task_type)
  (:act_type
   (&optional __act_type)
   (if __act_type (setq _act_type __act_type)) _act_type)
  (:target
   (&optional __target)
   (if __target (setq _target __target)) _target)
  (:sub_target
   (&optional __sub_target)
   (if __sub_target (setq _sub_target __sub_target)) _sub_target)
  (:serialization-length
   ()
   (+
    ;; int32 _state_flow
    4
    ;; int32 _task_mode
    4
    ;; int32 _chassis_total_hour
    4
    ;; int32 _drv_direction
    4
    ;; int32 _firm_error_state
    4
    ;; int32 _vehicle_error_status
    4
    ;; mqtt_commx/fault_info_array _faults
    (send _faults :serialization-length)
    ;; int32 _mileage
    4
    ;; bool _in_high_voltage
    1
    ;; string _vin
    4 (length _vin)
    ;; string _task_id
    4 (length _task_id)
    ;; string _navi_id
    4 (length _navi_id)
    ;; int32 _task_type
    4
    ;; int32 _act_type
    4
    ;; string _target
    4 (length _target)
    ;; string _sub_target
    4 (length _sub_target)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _state_flow
       (write-long _state_flow s)
     ;; int32 _task_mode
       (write-long _task_mode s)
     ;; int32 _chassis_total_hour
       (write-long _chassis_total_hour s)
     ;; int32 _drv_direction
       (write-long _drv_direction s)
     ;; int32 _firm_error_state
       (write-long _firm_error_state s)
     ;; int32 _vehicle_error_status
       (write-long _vehicle_error_status s)
     ;; mqtt_commx/fault_info_array _faults
       (send _faults :serialize s)
     ;; int32 _mileage
       (write-long _mileage s)
     ;; bool _in_high_voltage
       (if _in_high_voltage (write-byte -1 s) (write-byte 0 s))
     ;; string _vin
       (write-long (length _vin) s) (princ _vin s)
     ;; string _task_id
       (write-long (length _task_id) s) (princ _task_id s)
     ;; string _navi_id
       (write-long (length _navi_id) s) (princ _navi_id s)
     ;; int32 _task_type
       (write-long _task_type s)
     ;; int32 _act_type
       (write-long _act_type s)
     ;; string _target
       (write-long (length _target) s) (princ _target s)
     ;; string _sub_target
       (write-long (length _sub_target) s) (princ _sub_target s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _state_flow
     (setq _state_flow (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _task_mode
     (setq _task_mode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _chassis_total_hour
     (setq _chassis_total_hour (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _drv_direction
     (setq _drv_direction (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _firm_error_state
     (setq _firm_error_state (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _vehicle_error_status
     (setq _vehicle_error_status (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; mqtt_commx/fault_info_array _faults
     (send _faults :deserialize buf ptr-) (incf ptr- (send _faults :serialization-length))
   ;; int32 _mileage
     (setq _mileage (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; bool _in_high_voltage
     (setq _in_high_voltage (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _vin
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _vin (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _task_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _task_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _navi_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _navi_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _task_type
     (setq _task_type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _act_type
     (setq _act_type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _target
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _target (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _sub_target
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _sub_target (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get mqtt_commx::resp_iot :md5sum-) "3464ad6bcd20665bf6b59cba1ab9629c")
(setf (get mqtt_commx::resp_iot :datatype-) "mqtt_commx/resp_iot")
(setf (get mqtt_commx::resp_iot :definition-)
      "int32 state_flow
int32 task_mode
int32 chassis_total_hour
int32 drv_direction

int32 firm_error_state
int32 vehicle_error_status
fault_info_array faults
int32 mileage

bool in_high_voltage
string vin
string task_id
string navi_id
int32 task_type

int32 act_type
string target
string sub_target
================================================================================
MSG: mqtt_commx/fault_info_array
fault_info[] fault_info_data
int64 timestamp
================================================================================
MSG: mqtt_commx/fault_info
string desc
int64 code
int32 level

")



(provide :mqtt_commx/resp_iot "3464ad6bcd20665bf6b59cba1ab9629c")


