;; Auto-generated. Do not edit!


(when (boundp 'mqtt_commx::iot_controls)
  (if (not (find-package "MQTT_COMMX"))
    (make-package "MQTT_COMMX"))
  (shadow 'iot_controls (find-package "MQTT_COMMX")))
(unless (find-package "MQTT_COMMX::IOT_CONTROLS")
  (make-package "MQTT_COMMX::IOT_CONTROLS"))

(in-package "ROS")
;;//! \htmlinclude iot_controls.msg.html


(defclass mqtt_commx::iot_controls
  :super ros::object
  :slots (_header _taskId _sender _type ))

(defmethod mqtt_commx::iot_controls
  (:init
   (&key
    ((:header __header) (instance mqtt_commx::cmd_Header :init))
    ((:taskId __taskId) "")
    ((:sender __sender) "")
    ((:type __type) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _taskId (string __taskId))
   (setq _sender (string __sender))
   (setq _type (round __type))
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
  (:sender
   (&optional __sender)
   (if __sender (setq _sender __sender)) _sender)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:serialization-length
   ()
   (+
    ;; mqtt_commx/cmd_Header _header
    (send _header :serialization-length)
    ;; string _taskId
    4 (length _taskId)
    ;; string _sender
    4 (length _sender)
    ;; int64 _type
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; mqtt_commx/cmd_Header _header
       (send _header :serialize s)
     ;; string _taskId
       (write-long (length _taskId) s) (princ _taskId s)
     ;; string _sender
       (write-long (length _sender) s) (princ _sender s)
     ;; int64 _type
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _type (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _type) (= (length (_type . bv)) 2)) ;; bignum
              (write-long (ash (elt (_type . bv) 0) 0) s)
              (write-long (ash (elt (_type . bv) 1) -1) s))
             ((and (class _type) (= (length (_type . bv)) 1)) ;; big1
              (write-long (elt (_type . bv) 0) s)
              (write-long (if (>= _type 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _type s)(write-long (if (>= _type 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; mqtt_commx/cmd_Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _taskId
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _taskId (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _sender
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _sender (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int64 _type
#+(or :alpha :irix6 :x86_64)
      (setf _type (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _type (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(setf (get mqtt_commx::iot_controls :md5sum-) "b9b2f391bdff2d6855dabf27c7ac37e1")
(setf (get mqtt_commx::iot_controls :datatype-) "mqtt_commx/iot_controls")
(setf (get mqtt_commx::iot_controls :definition-)
      "cmd_Header header


string taskId  #作业任务的id
string sender  #默认值
int64 type     #作业命令：急停1、完成任务2、取消任务3、恢复行驶5、缓停8














================================================================================
MSG: mqtt_commx/cmd_Header
string trace_id
string trans_id
string che_id
string timestamp
string version
")



(provide :mqtt_commx/iot_controls "b9b2f391bdff2d6855dabf27c7ac37e1")


