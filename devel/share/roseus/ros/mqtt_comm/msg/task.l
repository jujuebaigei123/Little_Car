;; Auto-generated. Do not edit!


(when (boundp 'mqtt_comm::task)
  (if (not (find-package "MQTT_COMM"))
    (make-package "MQTT_COMM"))
  (shadow 'task (find-package "MQTT_COMM")))
(unless (find-package "MQTT_COMM::TASK")
  (make-package "MQTT_COMM::TASK"))

(in-package "ROS")
;;//! \htmlinclude task.msg.html


(defclass mqtt_comm::task
  :super ros::object
  :slots (_stamp _taskId _cmd _subcmd _final_path _only_akm _accordingPathdir _path ))

(defmethod mqtt_comm::task
  (:init
   (&key
    ((:stamp __stamp) (instance ros::time :init))
    ((:taskId __taskId) "")
    ((:cmd __cmd) "")
    ((:subcmd __subcmd) "")
    ((:final_path __final_path) nil)
    ((:only_akm __only_akm) nil)
    ((:accordingPathdir __accordingPathdir) nil)
    ((:path __path) ())
    )
   (send-super :init)
   (setq _stamp __stamp)
   (setq _taskId (string __taskId))
   (setq _cmd (string __cmd))
   (setq _subcmd (string __subcmd))
   (setq _final_path __final_path)
   (setq _only_akm __only_akm)
   (setq _accordingPathdir __accordingPathdir)
   (setq _path __path)
   self)
  (:stamp
   (&optional __stamp)
   (if __stamp (setq _stamp __stamp)) _stamp)
  (:taskId
   (&optional __taskId)
   (if __taskId (setq _taskId __taskId)) _taskId)
  (:cmd
   (&optional __cmd)
   (if __cmd (setq _cmd __cmd)) _cmd)
  (:subcmd
   (&optional __subcmd)
   (if __subcmd (setq _subcmd __subcmd)) _subcmd)
  (:final_path
   (&optional (__final_path :null))
   (if (not (eq __final_path :null)) (setq _final_path __final_path)) _final_path)
  (:only_akm
   (&optional (__only_akm :null))
   (if (not (eq __only_akm :null)) (setq _only_akm __only_akm)) _only_akm)
  (:accordingPathdir
   (&optional (__accordingPathdir :null))
   (if (not (eq __accordingPathdir :null)) (setq _accordingPathdir __accordingPathdir)) _accordingPathdir)
  (:path
   (&rest __path)
   (if (keywordp (car __path))
       (send* _path __path)
     (progn
       (if __path (setq _path (car __path)))
       _path)))
  (:serialization-length
   ()
   (+
    ;; time _stamp
    8
    ;; string _taskId
    4 (length _taskId)
    ;; string _cmd
    4 (length _cmd)
    ;; string _subcmd
    4 (length _subcmd)
    ;; bool _final_path
    1
    ;; bool _only_akm
    1
    ;; bool _accordingPathdir
    1
    ;; mqtt_comm/path_point[] _path
    (apply #'+ (send-all _path :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; time _stamp
       (write-long (send _stamp :sec) s) (write-long (send _stamp :nsec) s)
     ;; string _taskId
       (write-long (length _taskId) s) (princ _taskId s)
     ;; string _cmd
       (write-long (length _cmd) s) (princ _cmd s)
     ;; string _subcmd
       (write-long (length _subcmd) s) (princ _subcmd s)
     ;; bool _final_path
       (if _final_path (write-byte -1 s) (write-byte 0 s))
     ;; bool _only_akm
       (if _only_akm (write-byte -1 s) (write-byte 0 s))
     ;; bool _accordingPathdir
       (if _accordingPathdir (write-byte -1 s) (write-byte 0 s))
     ;; mqtt_comm/path_point[] _path
     (write-long (length _path) s)
     (dolist (elem _path)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; time _stamp
     (send _stamp :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _stamp :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _taskId
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _taskId (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _cmd
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _cmd (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _subcmd
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _subcmd (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _final_path
     (setq _final_path (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _only_akm
     (setq _only_akm (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _accordingPathdir
     (setq _accordingPathdir (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; mqtt_comm/path_point[] _path
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _path (let (r) (dotimes (i n) (push (instance mqtt_comm::path_point :init) r)) r))
     (dolist (elem- _path)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get mqtt_comm::task :md5sum-) "56ba4c02399269a508181e421f1e9b96")
(setf (get mqtt_comm::task :datatype-) "mqtt_comm/task")
(setf (get mqtt_comm::task :definition-)
      "time stamp
string taskId
string cmd
string subcmd
bool final_path
bool only_akm
bool accordingPathdir
path_point[] path



================================================================================
MSG: mqtt_comm/path_point
float32 vehSpeed
float64 pointX
float64 pointY
float64 pointHA
bool actEnable
string caption
path_point_action[] actions
float32[] if_point1
float32[] if_point2



================================================================================
MSG: mqtt_comm/path_point_action
string caption
float32[] params



")



(provide :mqtt_comm/task "56ba4c02399269a508181e421f1e9b96")


