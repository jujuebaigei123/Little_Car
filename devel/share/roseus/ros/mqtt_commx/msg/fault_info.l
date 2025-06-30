;; Auto-generated. Do not edit!


(when (boundp 'mqtt_commx::fault_info)
  (if (not (find-package "MQTT_COMMX"))
    (make-package "MQTT_COMMX"))
  (shadow 'fault_info (find-package "MQTT_COMMX")))
(unless (find-package "MQTT_COMMX::FAULT_INFO")
  (make-package "MQTT_COMMX::FAULT_INFO"))

(in-package "ROS")
;;//! \htmlinclude fault_info.msg.html


(defclass mqtt_commx::fault_info
  :super ros::object
  :slots (_desc _code _level ))

(defmethod mqtt_commx::fault_info
  (:init
   (&key
    ((:desc __desc) "")
    ((:code __code) 0)
    ((:level __level) 0)
    )
   (send-super :init)
   (setq _desc (string __desc))
   (setq _code (round __code))
   (setq _level (round __level))
   self)
  (:desc
   (&optional __desc)
   (if __desc (setq _desc __desc)) _desc)
  (:code
   (&optional __code)
   (if __code (setq _code __code)) _code)
  (:level
   (&optional __level)
   (if __level (setq _level __level)) _level)
  (:serialization-length
   ()
   (+
    ;; string _desc
    4 (length _desc)
    ;; int64 _code
    8
    ;; int32 _level
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _desc
       (write-long (length _desc) s) (princ _desc s)
     ;; int64 _code
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _code (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _code) (= (length (_code . bv)) 2)) ;; bignum
              (write-long (ash (elt (_code . bv) 0) 0) s)
              (write-long (ash (elt (_code . bv) 1) -1) s))
             ((and (class _code) (= (length (_code . bv)) 1)) ;; big1
              (write-long (elt (_code . bv) 0) s)
              (write-long (if (>= _code 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _code s)(write-long (if (>= _code 0) 0 #xffffffff) s)))
     ;; int32 _level
       (write-long _level s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _desc
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _desc (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int64 _code
#+(or :alpha :irix6 :x86_64)
      (setf _code (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _code (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int32 _level
     (setq _level (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get mqtt_commx::fault_info :md5sum-) "95e3250e1d1ef52a3c756cce9a37436a")
(setf (get mqtt_commx::fault_info :datatype-) "mqtt_commx/fault_info")
(setf (get mqtt_commx::fault_info :definition-)
      "string desc
int64 code
int32 level

")



(provide :mqtt_commx/fault_info "95e3250e1d1ef52a3c756cce9a37436a")


