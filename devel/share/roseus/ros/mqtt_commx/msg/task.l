;; Auto-generated. Do not edit!


(when (boundp 'mqtt_commx::task)
  (if (not (find-package "MQTT_COMMX"))
    (make-package "MQTT_COMMX"))
  (shadow 'task (find-package "MQTT_COMMX")))
(unless (find-package "MQTT_COMMX::TASK")
  (make-package "MQTT_COMMX::TASK"))

(in-package "ROS")
;;//! \htmlinclude task.msg.html


(defclass mqtt_commx::task
  :super ros::object
  :slots (_stamp _cmd _subcmd _path _final_path _task_id ))

(defmethod mqtt_commx::task
  (:init
   (&key
    ((:stamp __stamp) (instance ros::time :init))
    ((:cmd __cmd) "")
    ((:subcmd __subcmd) "")
    ((:path __path) ())
    ((:final_path __final_path) nil)
    ((:task_id __task_id) "")
    )
   (send-super :init)
   (setq _stamp __stamp)
   (setq _cmd (string __cmd))
   (setq _subcmd (string __subcmd))
   (setq _path __path)
   (setq _final_path __final_path)
   (setq _task_id (string __task_id))
   self)
  (:stamp
   (&optional __stamp)
   (if __stamp (setq _stamp __stamp)) _stamp)
  (:cmd
   (&optional __cmd)
   (if __cmd (setq _cmd __cmd)) _cmd)
  (:subcmd
   (&optional __subcmd)
   (if __subcmd (setq _subcmd __subcmd)) _subcmd)
  (:path
   (&rest __path)
   (if (keywordp (car __path))
       (send* _path __path)
     (progn
       (if __path (setq _path (car __path)))
       _path)))
  (:final_path
   (&optional (__final_path :null))
   (if (not (eq __final_path :null)) (setq _final_path __final_path)) _final_path)
  (:task_id
   (&optional __task_id)
   (if __task_id (setq _task_id __task_id)) _task_id)
  (:serialization-length
   ()
   (+
    ;; time _stamp
    8
    ;; string _cmd
    4 (length _cmd)
    ;; string _subcmd
    4 (length _subcmd)
    ;; mqtt_commx/path_point[] _path
    (apply #'+ (send-all _path :serialization-length)) 4
    ;; bool _final_path
    1
    ;; string _task_id
    4 (length _task_id)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; time _stamp
       (write-long (send _stamp :sec) s) (write-long (send _stamp :nsec) s)
     ;; string _cmd
       (write-long (length _cmd) s) (princ _cmd s)
     ;; string _subcmd
       (write-long (length _subcmd) s) (princ _subcmd s)
     ;; mqtt_commx/path_point[] _path
     (write-long (length _path) s)
     (dolist (elem _path)
       (send elem :serialize s)
       )
     ;; bool _final_path
       (if _final_path (write-byte -1 s) (write-byte 0 s))
     ;; string _task_id
       (write-long (length _task_id) s) (princ _task_id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; time _stamp
     (send _stamp :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _stamp :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _cmd
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _cmd (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _subcmd
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _subcmd (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; mqtt_commx/path_point[] _path
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _path (let (r) (dotimes (i n) (push (instance mqtt_commx::path_point :init) r)) r))
     (dolist (elem- _path)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; bool _final_path
     (setq _final_path (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _task_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _task_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get mqtt_commx::task :md5sum-) "bde58ca2fd96754ea94604b71e597ab7")
(setf (get mqtt_commx::task :datatype-) "mqtt_commx/task")
(setf (get mqtt_commx::task :definition-)
      "time stamp         #时间戳
string cmd         #任务
string subcmd      #交通信号灯、控制状态
path_point[] path  #路径
bool final_path
string task_id



================================================================================
MSG: mqtt_commx/path_point
float32 vehSpeed
float64 pointX
float64 pointY
float64 pointHA

")



(provide :mqtt_commx/task "bde58ca2fd96754ea94604b71e597ab7")


