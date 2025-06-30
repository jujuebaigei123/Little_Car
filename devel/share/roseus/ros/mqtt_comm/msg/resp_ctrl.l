;; Auto-generated. Do not edit!


(when (boundp 'mqtt_comm::resp_ctrl)
  (if (not (find-package "MQTT_COMM"))
    (make-package "MQTT_COMM"))
  (shadow 'resp_ctrl (find-package "MQTT_COMM")))
(unless (find-package "MQTT_COMM::RESP_CTRL")
  (make-package "MQTT_COMM::RESP_CTRL"))

(in-package "ROS")
;;//! \htmlinclude resp_ctrl.msg.html


(defclass mqtt_comm::resp_ctrl
  :super ros::object
  :slots (_msgType _agvId _timestamp _cmdId _value _ctrlType ))

(defmethod mqtt_comm::resp_ctrl
  (:init
   (&key
    ((:msgType __msgType) "")
    ((:agvId __agvId) "")
    ((:timestamp __timestamp) 0)
    ((:cmdId __cmdId) 0)
    ((:value __value) 0)
    ((:ctrlType __ctrlType) "")
    )
   (send-super :init)
   (setq _msgType (string __msgType))
   (setq _agvId (string __agvId))
   (setq _timestamp (round __timestamp))
   (setq _cmdId (round __cmdId))
   (setq _value (round __value))
   (setq _ctrlType (string __ctrlType))
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
  (:cmdId
   (&optional __cmdId)
   (if __cmdId (setq _cmdId __cmdId)) _cmdId)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:ctrlType
   (&optional __ctrlType)
   (if __ctrlType (setq _ctrlType __ctrlType)) _ctrlType)
  (:serialization-length
   ()
   (+
    ;; string _msgType
    4 (length _msgType)
    ;; string _agvId
    4 (length _agvId)
    ;; int64 _timestamp
    8
    ;; int32 _cmdId
    4
    ;; int32 _value
    4
    ;; string _ctrlType
    4 (length _ctrlType)
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
     ;; int32 _cmdId
       (write-long _cmdId s)
     ;; int32 _value
       (write-long _value s)
     ;; string _ctrlType
       (write-long (length _ctrlType) s) (princ _ctrlType s)
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
   ;; int32 _cmdId
     (setq _cmdId (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _value
     (setq _value (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _ctrlType
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _ctrlType (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get mqtt_comm::resp_ctrl :md5sum-) "2f21ac2d8dc240a3fa431fbec8909886")
(setf (get mqtt_comm::resp_ctrl :datatype-) "mqtt_comm/resp_ctrl")
(setf (get mqtt_comm::resp_ctrl :definition-)
      "string msgType
string agvId
int64 timestamp
int32 cmdId
int32 value
string ctrlType




")



(provide :mqtt_comm/resp_ctrl "2f21ac2d8dc240a3fa431fbec8909886")


