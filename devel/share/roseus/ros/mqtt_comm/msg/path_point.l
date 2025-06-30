;; Auto-generated. Do not edit!


(when (boundp 'mqtt_comm::path_point)
  (if (not (find-package "MQTT_COMM"))
    (make-package "MQTT_COMM"))
  (shadow 'path_point (find-package "MQTT_COMM")))
(unless (find-package "MQTT_COMM::PATH_POINT")
  (make-package "MQTT_COMM::PATH_POINT"))

(in-package "ROS")
;;//! \htmlinclude path_point.msg.html


(defclass mqtt_comm::path_point
  :super ros::object
  :slots (_vehSpeed _pointX _pointY _pointHA _actEnable _caption _actions _if_point1 _if_point2 ))

(defmethod mqtt_comm::path_point
  (:init
   (&key
    ((:vehSpeed __vehSpeed) 0.0)
    ((:pointX __pointX) 0.0)
    ((:pointY __pointY) 0.0)
    ((:pointHA __pointHA) 0.0)
    ((:actEnable __actEnable) nil)
    ((:caption __caption) "")
    ((:actions __actions) ())
    ((:if_point1 __if_point1) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:if_point2 __if_point2) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _vehSpeed (float __vehSpeed))
   (setq _pointX (float __pointX))
   (setq _pointY (float __pointY))
   (setq _pointHA (float __pointHA))
   (setq _actEnable __actEnable)
   (setq _caption (string __caption))
   (setq _actions __actions)
   (setq _if_point1 __if_point1)
   (setq _if_point2 __if_point2)
   self)
  (:vehSpeed
   (&optional __vehSpeed)
   (if __vehSpeed (setq _vehSpeed __vehSpeed)) _vehSpeed)
  (:pointX
   (&optional __pointX)
   (if __pointX (setq _pointX __pointX)) _pointX)
  (:pointY
   (&optional __pointY)
   (if __pointY (setq _pointY __pointY)) _pointY)
  (:pointHA
   (&optional __pointHA)
   (if __pointHA (setq _pointHA __pointHA)) _pointHA)
  (:actEnable
   (&optional (__actEnable :null))
   (if (not (eq __actEnable :null)) (setq _actEnable __actEnable)) _actEnable)
  (:caption
   (&optional __caption)
   (if __caption (setq _caption __caption)) _caption)
  (:actions
   (&rest __actions)
   (if (keywordp (car __actions))
       (send* _actions __actions)
     (progn
       (if __actions (setq _actions (car __actions)))
       _actions)))
  (:if_point1
   (&optional __if_point1)
   (if __if_point1 (setq _if_point1 __if_point1)) _if_point1)
  (:if_point2
   (&optional __if_point2)
   (if __if_point2 (setq _if_point2 __if_point2)) _if_point2)
  (:serialization-length
   ()
   (+
    ;; float32 _vehSpeed
    4
    ;; float64 _pointX
    8
    ;; float64 _pointY
    8
    ;; float64 _pointHA
    8
    ;; bool _actEnable
    1
    ;; string _caption
    4 (length _caption)
    ;; mqtt_comm/path_point_action[] _actions
    (apply #'+ (send-all _actions :serialization-length)) 4
    ;; float32[] _if_point1
    (* 4    (length _if_point1)) 4
    ;; float32[] _if_point2
    (* 4    (length _if_point2)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _vehSpeed
       (sys::poke _vehSpeed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float64 _pointX
       (sys::poke _pointX (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pointY
       (sys::poke _pointY (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pointHA
       (sys::poke _pointHA (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _actEnable
       (if _actEnable (write-byte -1 s) (write-byte 0 s))
     ;; string _caption
       (write-long (length _caption) s) (princ _caption s)
     ;; mqtt_comm/path_point_action[] _actions
     (write-long (length _actions) s)
     (dolist (elem _actions)
       (send elem :serialize s)
       )
     ;; float32[] _if_point1
     (write-long (length _if_point1) s)
     (dotimes (i (length _if_point1))
       (sys::poke (elt _if_point1 i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _if_point2
     (write-long (length _if_point2) s)
     (dotimes (i (length _if_point2))
       (sys::poke (elt _if_point2 i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _vehSpeed
     (setq _vehSpeed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float64 _pointX
     (setq _pointX (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pointY
     (setq _pointY (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pointHA
     (setq _pointHA (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _actEnable
     (setq _actEnable (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _caption
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _caption (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; mqtt_comm/path_point_action[] _actions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _actions (let (r) (dotimes (i n) (push (instance mqtt_comm::path_point_action :init) r)) r))
     (dolist (elem- _actions)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; float32[] _if_point1
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _if_point1 (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _if_point1 i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _if_point2
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _if_point2 (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _if_point2 i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get mqtt_comm::path_point :md5sum-) "8db6d631c8eb6e7558d6959de9b84eeb")
(setf (get mqtt_comm::path_point :datatype-) "mqtt_comm/path_point")
(setf (get mqtt_comm::path_point :definition-)
      "float32 vehSpeed
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



(provide :mqtt_comm/path_point "8db6d631c8eb6e7558d6959de9b84eeb")


