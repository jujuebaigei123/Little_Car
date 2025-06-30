;; Auto-generated. Do not edit!


(when (boundp 'mqtt_comm::resp_video)
  (if (not (find-package "MQTT_COMM"))
    (make-package "MQTT_COMM"))
  (shadow 'resp_video (find-package "MQTT_COMM")))
(unless (find-package "MQTT_COMM::RESP_VIDEO")
  (make-package "MQTT_COMM::RESP_VIDEO"))

(in-package "ROS")
;;//! \htmlinclude resp_video.msg.html


(defclass mqtt_comm::resp_video
  :super ros::object
  :slots (_agvId _msgType _timestamp _result ))

(defmethod mqtt_comm::resp_video
  (:init
   (&key
    ((:agvId __agvId) "")
    ((:msgType __msgType) "")
    ((:timestamp __timestamp) 0)
    ((:result __result) 0)
    )
   (send-super :init)
   (setq _agvId (string __agvId))
   (setq _msgType (string __msgType))
   (setq _timestamp (round __timestamp))
   (setq _result (round __result))
   self)
  (:agvId
   (&optional __agvId)
   (if __agvId (setq _agvId __agvId)) _agvId)
  (:msgType
   (&optional __msgType)
   (if __msgType (setq _msgType __msgType)) _msgType)
  (:timestamp
   (&optional __timestamp)
   (if __timestamp (setq _timestamp __timestamp)) _timestamp)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; string _agvId
    4 (length _agvId)
    ;; string _msgType
    4 (length _msgType)
    ;; int64 _timestamp
    8
    ;; int32 _result
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _agvId
       (write-long (length _agvId) s) (princ _agvId s)
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
     ;; int32 _result
       (write-long _result s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _agvId
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _agvId (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
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
   ;; int32 _result
     (setq _result (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get mqtt_comm::resp_video :md5sum-) "a8df69503833d0a76a10ba40c1b67964")
(setf (get mqtt_comm::resp_video :datatype-) "mqtt_comm/resp_video")
(setf (get mqtt_comm::resp_video :definition-)
      "string agvId 
string msgType
int64 timestamp
int32 result 





")



(provide :mqtt_comm/resp_video "a8df69503833d0a76a10ba40c1b67964")


