;; Auto-generated. Do not edit!


(when (boundp 'pathtrack::track_state)
  (if (not (find-package "PATHTRACK"))
    (make-package "PATHTRACK"))
  (shadow 'track_state (find-package "PATHTRACK")))
(unless (find-package "PATHTRACK::TRACK_STATE")
  (make-package "PATHTRACK::TRACK_STATE"))

(in-package "ROS")
;;//! \htmlinclude track_state.msg.html


(defclass pathtrack::track_state
  :super ros::object
  :slots (_timestamp _stopReason _self_turn_ctr _turnmode_ctr _track_angle_err _track_dis_err _aim_range _steering_property ))

(defmethod pathtrack::track_state
  (:init
   (&key
    ((:timestamp __timestamp) 0)
    ((:stopReason __stopReason) "")
    ((:self_turn_ctr __self_turn_ctr) 0)
    ((:turnmode_ctr __turnmode_ctr) 0)
    ((:track_angle_err __track_angle_err) 0.0)
    ((:track_dis_err __track_dis_err) 0.0)
    ((:aim_range __aim_range) 0.0)
    ((:steering_property __steering_property) 0.0)
    )
   (send-super :init)
   (setq _timestamp (round __timestamp))
   (setq _stopReason (string __stopReason))
   (setq _self_turn_ctr (round __self_turn_ctr))
   (setq _turnmode_ctr (round __turnmode_ctr))
   (setq _track_angle_err (float __track_angle_err))
   (setq _track_dis_err (float __track_dis_err))
   (setq _aim_range (float __aim_range))
   (setq _steering_property (float __steering_property))
   self)
  (:timestamp
   (&optional __timestamp)
   (if __timestamp (setq _timestamp __timestamp)) _timestamp)
  (:stopReason
   (&optional __stopReason)
   (if __stopReason (setq _stopReason __stopReason)) _stopReason)
  (:self_turn_ctr
   (&optional __self_turn_ctr)
   (if __self_turn_ctr (setq _self_turn_ctr __self_turn_ctr)) _self_turn_ctr)
  (:turnmode_ctr
   (&optional __turnmode_ctr)
   (if __turnmode_ctr (setq _turnmode_ctr __turnmode_ctr)) _turnmode_ctr)
  (:track_angle_err
   (&optional __track_angle_err)
   (if __track_angle_err (setq _track_angle_err __track_angle_err)) _track_angle_err)
  (:track_dis_err
   (&optional __track_dis_err)
   (if __track_dis_err (setq _track_dis_err __track_dis_err)) _track_dis_err)
  (:aim_range
   (&optional __aim_range)
   (if __aim_range (setq _aim_range __aim_range)) _aim_range)
  (:steering_property
   (&optional __steering_property)
   (if __steering_property (setq _steering_property __steering_property)) _steering_property)
  (:serialization-length
   ()
   (+
    ;; int64 _timestamp
    8
    ;; string _stopReason
    4 (length _stopReason)
    ;; int32 _self_turn_ctr
    4
    ;; int32 _turnmode_ctr
    4
    ;; float32 _track_angle_err
    4
    ;; float32 _track_dis_err
    4
    ;; float32 _aim_range
    4
    ;; float32 _steering_property
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
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
     ;; string _stopReason
       (write-long (length _stopReason) s) (princ _stopReason s)
     ;; int32 _self_turn_ctr
       (write-long _self_turn_ctr s)
     ;; int32 _turnmode_ctr
       (write-long _turnmode_ctr s)
     ;; float32 _track_angle_err
       (sys::poke _track_angle_err (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _track_dis_err
       (sys::poke _track_dis_err (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _aim_range
       (sys::poke _aim_range (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _steering_property
       (sys::poke _steering_property (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
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
   ;; string _stopReason
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _stopReason (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _self_turn_ctr
     (setq _self_turn_ctr (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _turnmode_ctr
     (setq _turnmode_ctr (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _track_angle_err
     (setq _track_angle_err (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _track_dis_err
     (setq _track_dis_err (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _aim_range
     (setq _aim_range (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _steering_property
     (setq _steering_property (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get pathtrack::track_state :md5sum-) "976fb87d357afb82707050b80adee235")
(setf (get pathtrack::track_state :datatype-) "pathtrack/track_state")
(setf (get pathtrack::track_state :definition-)
      "int64 timestamp
string stopReason
int32 self_turn_ctr
int32 turnmode_ctr
float32 track_angle_err
float32 track_dis_err
float32 aim_range
float32 steering_property

")



(provide :pathtrack/track_state "976fb87d357afb82707050b80adee235")


