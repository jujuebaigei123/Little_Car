;; Auto-generated. Do not edit!


(when (boundp 'mqtt_commx::act_status)
  (if (not (find-package "MQTT_COMMX"))
    (make-package "MQTT_COMMX"))
  (shadow 'act_status (find-package "MQTT_COMMX")))
(unless (find-package "MQTT_COMMX::ACT_STATUS")
  (make-package "MQTT_COMMX::ACT_STATUS"))

(in-package "ROS")
;;//! \htmlinclude act_status.msg.html


(defclass mqtt_commx::act_status
  :super ros::object
  :slots (_header _point _faults _act_type _chassis_total_hour _distance_to_target _drv_direction _empty _estop _firm_error_status _frame_ts _gear _in_high_voltage _is_charging _mileage _motion_mode _navi_id _operational_status _platform_state _soc _soh _speed _state_flow _sub_target _target _task_id _task_mode _task_type _turn_light _vehicle_error_status _vin ))

(defmethod mqtt_commx::act_status
  (:init
   (&key
    ((:header __header) (instance mqtt_commx::cmd_Header :init))
    ((:point __point) (instance mqtt_commx::Point :init))
    ((:faults __faults) ())
    ((:act_type __act_type) 0)
    ((:chassis_total_hour __chassis_total_hour) 0)
    ((:distance_to_target __distance_to_target) 0.0)
    ((:drv_direction __drv_direction) 0)
    ((:empty __empty) nil)
    ((:estop __estop) nil)
    ((:firm_error_status __firm_error_status) 0)
    ((:frame_ts __frame_ts) 0)
    ((:gear __gear) 0)
    ((:in_high_voltage __in_high_voltage) nil)
    ((:is_charging __is_charging) nil)
    ((:mileage __mileage) 0)
    ((:motion_mode __motion_mode) 0)
    ((:navi_id __navi_id) "")
    ((:operational_status __operational_status) 0)
    ((:platform_state __platform_state) 0)
    ((:soc __soc) 0)
    ((:soh __soh) 0)
    ((:speed __speed) 0.0)
    ((:state_flow __state_flow) 0)
    ((:sub_target __sub_target) "")
    ((:target __target) "")
    ((:task_id __task_id) "")
    ((:task_mode __task_mode) 0)
    ((:task_type __task_type) 0)
    ((:turn_light __turn_light) 0)
    ((:vehicle_error_status __vehicle_error_status) 0)
    ((:vin __vin) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _point __point)
   (setq _faults __faults)
   (setq _act_type (round __act_type))
   (setq _chassis_total_hour (round __chassis_total_hour))
   (setq _distance_to_target (float __distance_to_target))
   (setq _drv_direction (round __drv_direction))
   (setq _empty __empty)
   (setq _estop __estop)
   (setq _firm_error_status (round __firm_error_status))
   (setq _frame_ts (round __frame_ts))
   (setq _gear (round __gear))
   (setq _in_high_voltage __in_high_voltage)
   (setq _is_charging __is_charging)
   (setq _mileage (round __mileage))
   (setq _motion_mode (round __motion_mode))
   (setq _navi_id (string __navi_id))
   (setq _operational_status (round __operational_status))
   (setq _platform_state (round __platform_state))
   (setq _soc (round __soc))
   (setq _soh (round __soh))
   (setq _speed (float __speed))
   (setq _state_flow (round __state_flow))
   (setq _sub_target (string __sub_target))
   (setq _target (string __target))
   (setq _task_id (string __task_id))
   (setq _task_mode (round __task_mode))
   (setq _task_type (round __task_type))
   (setq _turn_light (round __turn_light))
   (setq _vehicle_error_status (round __vehicle_error_status))
   (setq _vin (string __vin))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:point
   (&rest __point)
   (if (keywordp (car __point))
       (send* _point __point)
     (progn
       (if __point (setq _point (car __point)))
       _point)))
  (:faults
   (&rest __faults)
   (if (keywordp (car __faults))
       (send* _faults __faults)
     (progn
       (if __faults (setq _faults (car __faults)))
       _faults)))
  (:act_type
   (&optional __act_type)
   (if __act_type (setq _act_type __act_type)) _act_type)
  (:chassis_total_hour
   (&optional __chassis_total_hour)
   (if __chassis_total_hour (setq _chassis_total_hour __chassis_total_hour)) _chassis_total_hour)
  (:distance_to_target
   (&optional __distance_to_target)
   (if __distance_to_target (setq _distance_to_target __distance_to_target)) _distance_to_target)
  (:drv_direction
   (&optional __drv_direction)
   (if __drv_direction (setq _drv_direction __drv_direction)) _drv_direction)
  (:empty
   (&optional (__empty :null))
   (if (not (eq __empty :null)) (setq _empty __empty)) _empty)
  (:estop
   (&optional (__estop :null))
   (if (not (eq __estop :null)) (setq _estop __estop)) _estop)
  (:firm_error_status
   (&optional __firm_error_status)
   (if __firm_error_status (setq _firm_error_status __firm_error_status)) _firm_error_status)
  (:frame_ts
   (&optional __frame_ts)
   (if __frame_ts (setq _frame_ts __frame_ts)) _frame_ts)
  (:gear
   (&optional __gear)
   (if __gear (setq _gear __gear)) _gear)
  (:in_high_voltage
   (&optional (__in_high_voltage :null))
   (if (not (eq __in_high_voltage :null)) (setq _in_high_voltage __in_high_voltage)) _in_high_voltage)
  (:is_charging
   (&optional (__is_charging :null))
   (if (not (eq __is_charging :null)) (setq _is_charging __is_charging)) _is_charging)
  (:mileage
   (&optional __mileage)
   (if __mileage (setq _mileage __mileage)) _mileage)
  (:motion_mode
   (&optional __motion_mode)
   (if __motion_mode (setq _motion_mode __motion_mode)) _motion_mode)
  (:navi_id
   (&optional __navi_id)
   (if __navi_id (setq _navi_id __navi_id)) _navi_id)
  (:operational_status
   (&optional __operational_status)
   (if __operational_status (setq _operational_status __operational_status)) _operational_status)
  (:platform_state
   (&optional __platform_state)
   (if __platform_state (setq _platform_state __platform_state)) _platform_state)
  (:soc
   (&optional __soc)
   (if __soc (setq _soc __soc)) _soc)
  (:soh
   (&optional __soh)
   (if __soh (setq _soh __soh)) _soh)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:state_flow
   (&optional __state_flow)
   (if __state_flow (setq _state_flow __state_flow)) _state_flow)
  (:sub_target
   (&optional __sub_target)
   (if __sub_target (setq _sub_target __sub_target)) _sub_target)
  (:target
   (&optional __target)
   (if __target (setq _target __target)) _target)
  (:task_id
   (&optional __task_id)
   (if __task_id (setq _task_id __task_id)) _task_id)
  (:task_mode
   (&optional __task_mode)
   (if __task_mode (setq _task_mode __task_mode)) _task_mode)
  (:task_type
   (&optional __task_type)
   (if __task_type (setq _task_type __task_type)) _task_type)
  (:turn_light
   (&optional __turn_light)
   (if __turn_light (setq _turn_light __turn_light)) _turn_light)
  (:vehicle_error_status
   (&optional __vehicle_error_status)
   (if __vehicle_error_status (setq _vehicle_error_status __vehicle_error_status)) _vehicle_error_status)
  (:vin
   (&optional __vin)
   (if __vin (setq _vin __vin)) _vin)
  (:serialization-length
   ()
   (+
    ;; mqtt_commx/cmd_Header _header
    (send _header :serialization-length)
    ;; mqtt_commx/Point _point
    (send _point :serialization-length)
    ;; mqtt_commx/fault_info[] _faults
    (apply #'+ (send-all _faults :serialization-length)) 4
    ;; int64 _act_type
    8
    ;; int64 _chassis_total_hour
    8
    ;; float64 _distance_to_target
    8
    ;; int64 _drv_direction
    8
    ;; bool _empty
    1
    ;; bool _estop
    1
    ;; int64 _firm_error_status
    8
    ;; int64 _frame_ts
    8
    ;; int64 _gear
    8
    ;; bool _in_high_voltage
    1
    ;; bool _is_charging
    1
    ;; int64 _mileage
    8
    ;; int64 _motion_mode
    8
    ;; string _navi_id
    4 (length _navi_id)
    ;; int64 _operational_status
    8
    ;; int64 _platform_state
    8
    ;; int64 _soc
    8
    ;; int64 _soh
    8
    ;; float64 _speed
    8
    ;; int64 _state_flow
    8
    ;; string _sub_target
    4 (length _sub_target)
    ;; string _target
    4 (length _target)
    ;; string _task_id
    4 (length _task_id)
    ;; int64 _task_mode
    8
    ;; int64 _task_type
    8
    ;; int64 _turn_light
    8
    ;; int64 _vehicle_error_status
    8
    ;; string _vin
    4 (length _vin)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; mqtt_commx/cmd_Header _header
       (send _header :serialize s)
     ;; mqtt_commx/Point _point
       (send _point :serialize s)
     ;; mqtt_commx/fault_info[] _faults
     (write-long (length _faults) s)
     (dolist (elem _faults)
       (send elem :serialize s)
       )
     ;; int64 _act_type
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _act_type (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _act_type) (= (length (_act_type . bv)) 2)) ;; bignum
              (write-long (ash (elt (_act_type . bv) 0) 0) s)
              (write-long (ash (elt (_act_type . bv) 1) -1) s))
             ((and (class _act_type) (= (length (_act_type . bv)) 1)) ;; big1
              (write-long (elt (_act_type . bv) 0) s)
              (write-long (if (>= _act_type 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _act_type s)(write-long (if (>= _act_type 0) 0 #xffffffff) s)))
     ;; int64 _chassis_total_hour
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _chassis_total_hour (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _chassis_total_hour) (= (length (_chassis_total_hour . bv)) 2)) ;; bignum
              (write-long (ash (elt (_chassis_total_hour . bv) 0) 0) s)
              (write-long (ash (elt (_chassis_total_hour . bv) 1) -1) s))
             ((and (class _chassis_total_hour) (= (length (_chassis_total_hour . bv)) 1)) ;; big1
              (write-long (elt (_chassis_total_hour . bv) 0) s)
              (write-long (if (>= _chassis_total_hour 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _chassis_total_hour s)(write-long (if (>= _chassis_total_hour 0) 0 #xffffffff) s)))
     ;; float64 _distance_to_target
       (sys::poke _distance_to_target (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int64 _drv_direction
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _drv_direction (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _drv_direction) (= (length (_drv_direction . bv)) 2)) ;; bignum
              (write-long (ash (elt (_drv_direction . bv) 0) 0) s)
              (write-long (ash (elt (_drv_direction . bv) 1) -1) s))
             ((and (class _drv_direction) (= (length (_drv_direction . bv)) 1)) ;; big1
              (write-long (elt (_drv_direction . bv) 0) s)
              (write-long (if (>= _drv_direction 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _drv_direction s)(write-long (if (>= _drv_direction 0) 0 #xffffffff) s)))
     ;; bool _empty
       (if _empty (write-byte -1 s) (write-byte 0 s))
     ;; bool _estop
       (if _estop (write-byte -1 s) (write-byte 0 s))
     ;; int64 _firm_error_status
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _firm_error_status (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _firm_error_status) (= (length (_firm_error_status . bv)) 2)) ;; bignum
              (write-long (ash (elt (_firm_error_status . bv) 0) 0) s)
              (write-long (ash (elt (_firm_error_status . bv) 1) -1) s))
             ((and (class _firm_error_status) (= (length (_firm_error_status . bv)) 1)) ;; big1
              (write-long (elt (_firm_error_status . bv) 0) s)
              (write-long (if (>= _firm_error_status 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _firm_error_status s)(write-long (if (>= _firm_error_status 0) 0 #xffffffff) s)))
     ;; int64 _frame_ts
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _frame_ts (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _frame_ts) (= (length (_frame_ts . bv)) 2)) ;; bignum
              (write-long (ash (elt (_frame_ts . bv) 0) 0) s)
              (write-long (ash (elt (_frame_ts . bv) 1) -1) s))
             ((and (class _frame_ts) (= (length (_frame_ts . bv)) 1)) ;; big1
              (write-long (elt (_frame_ts . bv) 0) s)
              (write-long (if (>= _frame_ts 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _frame_ts s)(write-long (if (>= _frame_ts 0) 0 #xffffffff) s)))
     ;; int64 _gear
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _gear (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _gear) (= (length (_gear . bv)) 2)) ;; bignum
              (write-long (ash (elt (_gear . bv) 0) 0) s)
              (write-long (ash (elt (_gear . bv) 1) -1) s))
             ((and (class _gear) (= (length (_gear . bv)) 1)) ;; big1
              (write-long (elt (_gear . bv) 0) s)
              (write-long (if (>= _gear 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _gear s)(write-long (if (>= _gear 0) 0 #xffffffff) s)))
     ;; bool _in_high_voltage
       (if _in_high_voltage (write-byte -1 s) (write-byte 0 s))
     ;; bool _is_charging
       (if _is_charging (write-byte -1 s) (write-byte 0 s))
     ;; int64 _mileage
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _mileage (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _mileage) (= (length (_mileage . bv)) 2)) ;; bignum
              (write-long (ash (elt (_mileage . bv) 0) 0) s)
              (write-long (ash (elt (_mileage . bv) 1) -1) s))
             ((and (class _mileage) (= (length (_mileage . bv)) 1)) ;; big1
              (write-long (elt (_mileage . bv) 0) s)
              (write-long (if (>= _mileage 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _mileage s)(write-long (if (>= _mileage 0) 0 #xffffffff) s)))
     ;; int64 _motion_mode
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _motion_mode (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _motion_mode) (= (length (_motion_mode . bv)) 2)) ;; bignum
              (write-long (ash (elt (_motion_mode . bv) 0) 0) s)
              (write-long (ash (elt (_motion_mode . bv) 1) -1) s))
             ((and (class _motion_mode) (= (length (_motion_mode . bv)) 1)) ;; big1
              (write-long (elt (_motion_mode . bv) 0) s)
              (write-long (if (>= _motion_mode 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _motion_mode s)(write-long (if (>= _motion_mode 0) 0 #xffffffff) s)))
     ;; string _navi_id
       (write-long (length _navi_id) s) (princ _navi_id s)
     ;; int64 _operational_status
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _operational_status (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _operational_status) (= (length (_operational_status . bv)) 2)) ;; bignum
              (write-long (ash (elt (_operational_status . bv) 0) 0) s)
              (write-long (ash (elt (_operational_status . bv) 1) -1) s))
             ((and (class _operational_status) (= (length (_operational_status . bv)) 1)) ;; big1
              (write-long (elt (_operational_status . bv) 0) s)
              (write-long (if (>= _operational_status 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _operational_status s)(write-long (if (>= _operational_status 0) 0 #xffffffff) s)))
     ;; int64 _platform_state
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _platform_state (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _platform_state) (= (length (_platform_state . bv)) 2)) ;; bignum
              (write-long (ash (elt (_platform_state . bv) 0) 0) s)
              (write-long (ash (elt (_platform_state . bv) 1) -1) s))
             ((and (class _platform_state) (= (length (_platform_state . bv)) 1)) ;; big1
              (write-long (elt (_platform_state . bv) 0) s)
              (write-long (if (>= _platform_state 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _platform_state s)(write-long (if (>= _platform_state 0) 0 #xffffffff) s)))
     ;; int64 _soc
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _soc (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _soc) (= (length (_soc . bv)) 2)) ;; bignum
              (write-long (ash (elt (_soc . bv) 0) 0) s)
              (write-long (ash (elt (_soc . bv) 1) -1) s))
             ((and (class _soc) (= (length (_soc . bv)) 1)) ;; big1
              (write-long (elt (_soc . bv) 0) s)
              (write-long (if (>= _soc 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _soc s)(write-long (if (>= _soc 0) 0 #xffffffff) s)))
     ;; int64 _soh
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _soh (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _soh) (= (length (_soh . bv)) 2)) ;; bignum
              (write-long (ash (elt (_soh . bv) 0) 0) s)
              (write-long (ash (elt (_soh . bv) 1) -1) s))
             ((and (class _soh) (= (length (_soh . bv)) 1)) ;; big1
              (write-long (elt (_soh . bv) 0) s)
              (write-long (if (>= _soh 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _soh s)(write-long (if (>= _soh 0) 0 #xffffffff) s)))
     ;; float64 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int64 _state_flow
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _state_flow (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _state_flow) (= (length (_state_flow . bv)) 2)) ;; bignum
              (write-long (ash (elt (_state_flow . bv) 0) 0) s)
              (write-long (ash (elt (_state_flow . bv) 1) -1) s))
             ((and (class _state_flow) (= (length (_state_flow . bv)) 1)) ;; big1
              (write-long (elt (_state_flow . bv) 0) s)
              (write-long (if (>= _state_flow 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _state_flow s)(write-long (if (>= _state_flow 0) 0 #xffffffff) s)))
     ;; string _sub_target
       (write-long (length _sub_target) s) (princ _sub_target s)
     ;; string _target
       (write-long (length _target) s) (princ _target s)
     ;; string _task_id
       (write-long (length _task_id) s) (princ _task_id s)
     ;; int64 _task_mode
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _task_mode (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _task_mode) (= (length (_task_mode . bv)) 2)) ;; bignum
              (write-long (ash (elt (_task_mode . bv) 0) 0) s)
              (write-long (ash (elt (_task_mode . bv) 1) -1) s))
             ((and (class _task_mode) (= (length (_task_mode . bv)) 1)) ;; big1
              (write-long (elt (_task_mode . bv) 0) s)
              (write-long (if (>= _task_mode 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _task_mode s)(write-long (if (>= _task_mode 0) 0 #xffffffff) s)))
     ;; int64 _task_type
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _task_type (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _task_type) (= (length (_task_type . bv)) 2)) ;; bignum
              (write-long (ash (elt (_task_type . bv) 0) 0) s)
              (write-long (ash (elt (_task_type . bv) 1) -1) s))
             ((and (class _task_type) (= (length (_task_type . bv)) 1)) ;; big1
              (write-long (elt (_task_type . bv) 0) s)
              (write-long (if (>= _task_type 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _task_type s)(write-long (if (>= _task_type 0) 0 #xffffffff) s)))
     ;; int64 _turn_light
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _turn_light (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _turn_light) (= (length (_turn_light . bv)) 2)) ;; bignum
              (write-long (ash (elt (_turn_light . bv) 0) 0) s)
              (write-long (ash (elt (_turn_light . bv) 1) -1) s))
             ((and (class _turn_light) (= (length (_turn_light . bv)) 1)) ;; big1
              (write-long (elt (_turn_light . bv) 0) s)
              (write-long (if (>= _turn_light 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _turn_light s)(write-long (if (>= _turn_light 0) 0 #xffffffff) s)))
     ;; int64 _vehicle_error_status
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _vehicle_error_status (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _vehicle_error_status) (= (length (_vehicle_error_status . bv)) 2)) ;; bignum
              (write-long (ash (elt (_vehicle_error_status . bv) 0) 0) s)
              (write-long (ash (elt (_vehicle_error_status . bv) 1) -1) s))
             ((and (class _vehicle_error_status) (= (length (_vehicle_error_status . bv)) 1)) ;; big1
              (write-long (elt (_vehicle_error_status . bv) 0) s)
              (write-long (if (>= _vehicle_error_status 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _vehicle_error_status s)(write-long (if (>= _vehicle_error_status 0) 0 #xffffffff) s)))
     ;; string _vin
       (write-long (length _vin) s) (princ _vin s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; mqtt_commx/cmd_Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; mqtt_commx/Point _point
     (send _point :deserialize buf ptr-) (incf ptr- (send _point :serialization-length))
   ;; mqtt_commx/fault_info[] _faults
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _faults (let (r) (dotimes (i n) (push (instance mqtt_commx::fault_info :init) r)) r))
     (dolist (elem- _faults)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; int64 _act_type
#+(or :alpha :irix6 :x86_64)
      (setf _act_type (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _act_type (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _chassis_total_hour
#+(or :alpha :irix6 :x86_64)
      (setf _chassis_total_hour (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _chassis_total_hour (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float64 _distance_to_target
     (setq _distance_to_target (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int64 _drv_direction
#+(or :alpha :irix6 :x86_64)
      (setf _drv_direction (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _drv_direction (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; bool _empty
     (setq _empty (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _estop
     (setq _estop (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int64 _firm_error_status
#+(or :alpha :irix6 :x86_64)
      (setf _firm_error_status (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _firm_error_status (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _frame_ts
#+(or :alpha :irix6 :x86_64)
      (setf _frame_ts (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _frame_ts (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _gear
#+(or :alpha :irix6 :x86_64)
      (setf _gear (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _gear (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; bool _in_high_voltage
     (setq _in_high_voltage (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _is_charging
     (setq _is_charging (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int64 _mileage
#+(or :alpha :irix6 :x86_64)
      (setf _mileage (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _mileage (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _motion_mode
#+(or :alpha :irix6 :x86_64)
      (setf _motion_mode (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _motion_mode (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; string _navi_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _navi_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int64 _operational_status
#+(or :alpha :irix6 :x86_64)
      (setf _operational_status (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _operational_status (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _platform_state
#+(or :alpha :irix6 :x86_64)
      (setf _platform_state (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _platform_state (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _soc
#+(or :alpha :irix6 :x86_64)
      (setf _soc (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _soc (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _soh
#+(or :alpha :irix6 :x86_64)
      (setf _soh (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _soh (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float64 _speed
     (setq _speed (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int64 _state_flow
#+(or :alpha :irix6 :x86_64)
      (setf _state_flow (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _state_flow (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; string _sub_target
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _sub_target (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _target
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _target (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _task_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _task_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int64 _task_mode
#+(or :alpha :irix6 :x86_64)
      (setf _task_mode (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _task_mode (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _task_type
#+(or :alpha :irix6 :x86_64)
      (setf _task_type (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _task_type (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _turn_light
#+(or :alpha :irix6 :x86_64)
      (setf _turn_light (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _turn_light (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _vehicle_error_status
#+(or :alpha :irix6 :x86_64)
      (setf _vehicle_error_status (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _vehicle_error_status (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; string _vin
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _vin (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get mqtt_commx::act_status :md5sum-) "3a229cb3686a6eb829168e6cd0fe7cda")
(setf (get mqtt_commx::act_status :datatype-) "mqtt_commx/act_status")
(setf (get mqtt_commx::act_status :definition-)
      "cmd_Header header
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



(provide :mqtt_commx/act_status "3a229cb3686a6eb829168e6cd0fe7cda")


