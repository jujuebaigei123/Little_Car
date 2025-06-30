;; Auto-generated. Do not edit!


(when (boundp 'mqtt_comm::resp_task)
  (if (not (find-package "MQTT_COMM"))
    (make-package "MQTT_COMM"))
  (shadow 'resp_task (find-package "MQTT_COMM")))
(unless (find-package "MQTT_COMM::RESP_TASK")
  (make-package "MQTT_COMM::RESP_TASK"))

(in-package "ROS")
;;//! \htmlinclude resp_task.msg.html


(defclass mqtt_comm::resp_task
  :super ros::object
  :slots (_msgType _agvId _timestamp _taskId _subTaskIndex ))

(defmethod mqtt_comm::resp_task
  (:init
   (&key
    ((:msgType __msgType) "")
    ((:agvId __agvId) "")
    ((:timestamp __timestamp) 0)
    ((:taskId __taskId) 0)
    ((:subTaskIndex __subTaskIndex) 0)
    )
   (send-super :init)
   (setq _msgType (string __msgType))
   (setq _agvId (string __agvId))
   (setq _timestamp (round __timestamp))
   (setq _taskId (round __taskId))
   (setq _subTaskIndex (round __subTaskIndex))
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
  (:subTaskIndex
   (&optional __subTaskIndex)
   (if __subTaskIndex (setq _subTaskIndex __subTaskIndex)) _subTaskIndex)
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
    ;; int32 _subTaskIndex
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
     ;; int32 _subTaskIndex
       (write-long _subTaskIndex s)
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
   ;; int32 _subTaskIndex
     (setq _subTaskIndex (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get mqtt_comm::resp_task :md5sum-) "f2056e3d4cb90d20081cfa1340bb02a1")
(setf (get mqtt_comm::resp_task :datatype-) "mqtt_comm/resp_task")
(setf (get mqtt_comm::resp_task :definition-)
      "string msgType
string agvId
int64 timestamp
# recvtask_value value
int32 taskId
int32 subTaskIndex




")



(provide :mqtt_comm/resp_task "f2056e3d4cb90d20081cfa1340bb02a1")


