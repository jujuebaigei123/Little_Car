;; Auto-generated. Do not edit!


(when (boundp 'mqtt_comm::mqtt_task)
  (if (not (find-package "MQTT_COMM"))
    (make-package "MQTT_COMM"))
  (shadow 'mqtt_task (find-package "MQTT_COMM")))
(unless (find-package "MQTT_COMM::MQTT_TASK")
  (make-package "MQTT_COMM::MQTT_TASK"))

(in-package "ROS")
;;//! \htmlinclude mqtt_task.msg.html


(defclass mqtt_comm::mqtt_task
  :super ros::object
  :slots (_msgType _timestamp _taskId _pathId _workIds ))

(defmethod mqtt_comm::mqtt_task
  (:init
   (&key
    ((:msgType __msgType) "")
    ((:timestamp __timestamp) 0)
    ((:taskId __taskId) "")
    ((:pathId __pathId) "")
    ((:workIds __workIds) "")
    )
   (send-super :init)
   (setq _msgType (string __msgType))
   (setq _timestamp (round __timestamp))
   (setq _taskId (string __taskId))
   (setq _pathId (string __pathId))
   (setq _workIds (string __workIds))
   self)
  (:msgType
   (&optional __msgType)
   (if __msgType (setq _msgType __msgType)) _msgType)
  (:timestamp
   (&optional __timestamp)
   (if __timestamp (setq _timestamp __timestamp)) _timestamp)
  (:taskId
   (&optional __taskId)
   (if __taskId (setq _taskId __taskId)) _taskId)
  (:pathId
   (&optional __pathId)
   (if __pathId (setq _pathId __pathId)) _pathId)
  (:workIds
   (&optional __workIds)
   (if __workIds (setq _workIds __workIds)) _workIds)
  (:serialization-length
   ()
   (+
    ;; string _msgType
    4 (length _msgType)
    ;; int64 _timestamp
    8
    ;; string _taskId
    4 (length _taskId)
    ;; string _pathId
    4 (length _pathId)
    ;; string _workIds
    4 (length _workIds)
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
     ;; string _taskId
       (write-long (length _taskId) s) (princ _taskId s)
     ;; string _pathId
       (write-long (length _pathId) s) (princ _pathId s)
     ;; string _workIds
       (write-long (length _workIds) s) (princ _workIds s)
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
   ;; string _taskId
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _taskId (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _pathId
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _pathId (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _workIds
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _workIds (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get mqtt_comm::mqtt_task :md5sum-) "5572e97389f79226a529e1c9cb1b09e6")
(setf (get mqtt_comm::mqtt_task :datatype-) "mqtt_comm/mqtt_task")
(setf (get mqtt_comm::mqtt_task :definition-)
      "string msgType
int64 timestamp
string taskId
string pathId
string workIds



")



(provide :mqtt_comm/mqtt_task "5572e97389f79226a529e1c9cb1b09e6")


