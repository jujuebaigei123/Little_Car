;; Auto-generated. Do not edit!


(when (boundp 'mqtt_commx::fault_info_array)
  (if (not (find-package "MQTT_COMMX"))
    (make-package "MQTT_COMMX"))
  (shadow 'fault_info_array (find-package "MQTT_COMMX")))
(unless (find-package "MQTT_COMMX::FAULT_INFO_ARRAY")
  (make-package "MQTT_COMMX::FAULT_INFO_ARRAY"))

(in-package "ROS")
;;//! \htmlinclude fault_info_array.msg.html


(defclass mqtt_commx::fault_info_array
  :super ros::object
  :slots (_fault_info_data _timestamp ))

(defmethod mqtt_commx::fault_info_array
  (:init
   (&key
    ((:fault_info_data __fault_info_data) ())
    ((:timestamp __timestamp) 0)
    )
   (send-super :init)
   (setq _fault_info_data __fault_info_data)
   (setq _timestamp (round __timestamp))
   self)
  (:fault_info_data
   (&rest __fault_info_data)
   (if (keywordp (car __fault_info_data))
       (send* _fault_info_data __fault_info_data)
     (progn
       (if __fault_info_data (setq _fault_info_data (car __fault_info_data)))
       _fault_info_data)))
  (:timestamp
   (&optional __timestamp)
   (if __timestamp (setq _timestamp __timestamp)) _timestamp)
  (:serialization-length
   ()
   (+
    ;; mqtt_commx/fault_info[] _fault_info_data
    (apply #'+ (send-all _fault_info_data :serialization-length)) 4
    ;; int64 _timestamp
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; mqtt_commx/fault_info[] _fault_info_data
     (write-long (length _fault_info_data) s)
     (dolist (elem _fault_info_data)
       (send elem :serialize s)
       )
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
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; mqtt_commx/fault_info[] _fault_info_data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _fault_info_data (let (r) (dotimes (i n) (push (instance mqtt_commx::fault_info :init) r)) r))
     (dolist (elem- _fault_info_data)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
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
   ;;
   self)
  )

(setf (get mqtt_commx::fault_info_array :md5sum-) "3b519e6234e93bf86de021428c1d9d96")
(setf (get mqtt_commx::fault_info_array :datatype-) "mqtt_commx/fault_info_array")
(setf (get mqtt_commx::fault_info_array :definition-)
      "fault_info[] fault_info_data
int64 timestamp
================================================================================
MSG: mqtt_commx/fault_info
string desc
int64 code
int32 level

")



(provide :mqtt_commx/fault_info_array "3b519e6234e93bf86de021428c1d9d96")


