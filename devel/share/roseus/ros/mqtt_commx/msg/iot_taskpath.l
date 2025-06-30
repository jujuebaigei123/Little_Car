;; Auto-generated. Do not edit!


(when (boundp 'mqtt_commx::iot_taskpath)
  (if (not (find-package "MQTT_COMMX"))
    (make-package "MQTT_COMMX"))
  (shadow 'iot_taskpath (find-package "MQTT_COMMX")))
(unless (find-package "MQTT_COMMX::IOT_TASKPATH")
  (make-package "MQTT_COMMX::IOT_TASKPATH"))

(in-package "ROS")
;;//! \htmlinclude iot_taskpath.msg.html


(defclass mqtt_commx::iot_taskpath
  :super ros::object
  :slots (_header _taskId _navi_id _seq_num _route_direction _dest_type _path _route_update _is_final_navi ))

(defmethod mqtt_commx::iot_taskpath
  (:init
   (&key
    ((:header __header) (instance mqtt_commx::cmd_Header :init))
    ((:taskId __taskId) "")
    ((:navi_id __navi_id) "")
    ((:seq_num __seq_num) 0)
    ((:route_direction __route_direction) 0)
    ((:dest_type __dest_type) 0)
    ((:path __path) ())
    ((:route_update __route_update) nil)
    ((:is_final_navi __is_final_navi) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _taskId (string __taskId))
   (setq _navi_id (string __navi_id))
   (setq _seq_num (round __seq_num))
   (setq _route_direction (round __route_direction))
   (setq _dest_type (round __dest_type))
   (setq _path __path)
   (setq _route_update __route_update)
   (setq _is_final_navi __is_final_navi)
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
  (:navi_id
   (&optional __navi_id)
   (if __navi_id (setq _navi_id __navi_id)) _navi_id)
  (:seq_num
   (&optional __seq_num)
   (if __seq_num (setq _seq_num __seq_num)) _seq_num)
  (:route_direction
   (&optional __route_direction)
   (if __route_direction (setq _route_direction __route_direction)) _route_direction)
  (:dest_type
   (&optional __dest_type)
   (if __dest_type (setq _dest_type __dest_type)) _dest_type)
  (:path
   (&rest __path)
   (if (keywordp (car __path))
       (send* _path __path)
     (progn
       (if __path (setq _path (car __path)))
       _path)))
  (:route_update
   (&optional (__route_update :null))
   (if (not (eq __route_update :null)) (setq _route_update __route_update)) _route_update)
  (:is_final_navi
   (&optional (__is_final_navi :null))
   (if (not (eq __is_final_navi :null)) (setq _is_final_navi __is_final_navi)) _is_final_navi)
  (:serialization-length
   ()
   (+
    ;; mqtt_commx/cmd_Header _header
    (send _header :serialization-length)
    ;; string _taskId
    4 (length _taskId)
    ;; string _navi_id
    4 (length _navi_id)
    ;; int32 _seq_num
    4
    ;; int32 _route_direction
    4
    ;; int32 _dest_type
    4
    ;; mqtt_commx/iot_path_point[] _path
    (apply #'+ (send-all _path :serialization-length)) 4
    ;; bool _route_update
    1
    ;; bool _is_final_navi
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; mqtt_commx/cmd_Header _header
       (send _header :serialize s)
     ;; string _taskId
       (write-long (length _taskId) s) (princ _taskId s)
     ;; string _navi_id
       (write-long (length _navi_id) s) (princ _navi_id s)
     ;; int32 _seq_num
       (write-long _seq_num s)
     ;; int32 _route_direction
       (write-long _route_direction s)
     ;; int32 _dest_type
       (write-long _dest_type s)
     ;; mqtt_commx/iot_path_point[] _path
     (write-long (length _path) s)
     (dolist (elem _path)
       (send elem :serialize s)
       )
     ;; bool _route_update
       (if _route_update (write-byte -1 s) (write-byte 0 s))
     ;; bool _is_final_navi
       (if _is_final_navi (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; mqtt_commx/cmd_Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _taskId
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _taskId (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _navi_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _navi_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _seq_num
     (setq _seq_num (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _route_direction
     (setq _route_direction (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _dest_type
     (setq _dest_type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; mqtt_commx/iot_path_point[] _path
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _path (let (r) (dotimes (i n) (push (instance mqtt_commx::iot_path_point :init) r)) r))
     (dolist (elem- _path)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; bool _route_update
     (setq _route_update (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _is_final_navi
     (setq _is_final_navi (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get mqtt_commx::iot_taskpath :md5sum-) "b090287600ee4263cb79e16674b501c4")
(setf (get mqtt_commx::iot_taskpath :datatype-) "mqtt_commx/iot_taskpath")
(setf (get mqtt_commx::iot_taskpath :definition-)
      "cmd_Header header

#task
string taskId             #作业任务的id
string navi_id            #导航任务编号
int32 seq_num             #顺序号
int32 route_direction     #路径方向
int32 dest_type           #目的地类型
iot_path_point[] path         #路径
bool route_update       
bool is_final_navi









================================================================================
MSG: mqtt_commx/cmd_Header
string trace_id
string trans_id
string che_id
string timestamp
string version
================================================================================
MSG: mqtt_commx/iot_path_point
int32 direction
int32 type
int32 driving_direction
string id
float32 speed_vmax
float32 vmax_dev
int32 lane_type

float64 pointX
float64 pointY
float64 pointHA

")



(provide :mqtt_commx/iot_taskpath "b090287600ee4263cb79e16674b501c4")


