;; Auto-generated. Do not edit!


(when (boundp 'gps::MyGPS_msg)
  (if (not (find-package "GPS"))
    (make-package "GPS"))
  (shadow 'MyGPS_msg (find-package "GPS")))
(unless (find-package "GPS::MYGPS_MSG")
  (make-package "GPS::MYGPS_MSG"))

(in-package "ROS")
;;//! \htmlinclude MyGPS_msg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass gps::MyGPS_msg
  :super ros::object
  :slots (_header _Lat _Lon _UTM_X _UTM_Y _Angle _map_x _map_y _raw_UTM_X _raw_UTM_Y _raw_Angle _raw_map_x _raw_map_y _mqtt_angle _Vel _Quality _HeartBeat ))

(defmethod gps::MyGPS_msg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:Lat __Lat) 0.0)
    ((:Lon __Lon) 0.0)
    ((:UTM_X __UTM_X) 0.0)
    ((:UTM_Y __UTM_Y) 0.0)
    ((:Angle __Angle) 0.0)
    ((:map_x __map_x) 0.0)
    ((:map_y __map_y) 0.0)
    ((:raw_UTM_X __raw_UTM_X) 0.0)
    ((:raw_UTM_Y __raw_UTM_Y) 0.0)
    ((:raw_Angle __raw_Angle) 0.0)
    ((:raw_map_x __raw_map_x) 0.0)
    ((:raw_map_y __raw_map_y) 0.0)
    ((:mqtt_angle __mqtt_angle) 0.0)
    ((:Vel __Vel) 0.0)
    ((:Quality __Quality) 0)
    ((:HeartBeat __HeartBeat) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _Lat (float __Lat))
   (setq _Lon (float __Lon))
   (setq _UTM_X (float __UTM_X))
   (setq _UTM_Y (float __UTM_Y))
   (setq _Angle (float __Angle))
   (setq _map_x (float __map_x))
   (setq _map_y (float __map_y))
   (setq _raw_UTM_X (float __raw_UTM_X))
   (setq _raw_UTM_Y (float __raw_UTM_Y))
   (setq _raw_Angle (float __raw_Angle))
   (setq _raw_map_x (float __raw_map_x))
   (setq _raw_map_y (float __raw_map_y))
   (setq _mqtt_angle (float __mqtt_angle))
   (setq _Vel (float __Vel))
   (setq _Quality (round __Quality))
   (setq _HeartBeat (round __HeartBeat))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:Lat
   (&optional __Lat)
   (if __Lat (setq _Lat __Lat)) _Lat)
  (:Lon
   (&optional __Lon)
   (if __Lon (setq _Lon __Lon)) _Lon)
  (:UTM_X
   (&optional __UTM_X)
   (if __UTM_X (setq _UTM_X __UTM_X)) _UTM_X)
  (:UTM_Y
   (&optional __UTM_Y)
   (if __UTM_Y (setq _UTM_Y __UTM_Y)) _UTM_Y)
  (:Angle
   (&optional __Angle)
   (if __Angle (setq _Angle __Angle)) _Angle)
  (:map_x
   (&optional __map_x)
   (if __map_x (setq _map_x __map_x)) _map_x)
  (:map_y
   (&optional __map_y)
   (if __map_y (setq _map_y __map_y)) _map_y)
  (:raw_UTM_X
   (&optional __raw_UTM_X)
   (if __raw_UTM_X (setq _raw_UTM_X __raw_UTM_X)) _raw_UTM_X)
  (:raw_UTM_Y
   (&optional __raw_UTM_Y)
   (if __raw_UTM_Y (setq _raw_UTM_Y __raw_UTM_Y)) _raw_UTM_Y)
  (:raw_Angle
   (&optional __raw_Angle)
   (if __raw_Angle (setq _raw_Angle __raw_Angle)) _raw_Angle)
  (:raw_map_x
   (&optional __raw_map_x)
   (if __raw_map_x (setq _raw_map_x __raw_map_x)) _raw_map_x)
  (:raw_map_y
   (&optional __raw_map_y)
   (if __raw_map_y (setq _raw_map_y __raw_map_y)) _raw_map_y)
  (:mqtt_angle
   (&optional __mqtt_angle)
   (if __mqtt_angle (setq _mqtt_angle __mqtt_angle)) _mqtt_angle)
  (:Vel
   (&optional __Vel)
   (if __Vel (setq _Vel __Vel)) _Vel)
  (:Quality
   (&optional __Quality)
   (if __Quality (setq _Quality __Quality)) _Quality)
  (:HeartBeat
   (&optional __HeartBeat)
   (if __HeartBeat (setq _HeartBeat __HeartBeat)) _HeartBeat)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _Lat
    8
    ;; float64 _Lon
    8
    ;; float64 _UTM_X
    8
    ;; float64 _UTM_Y
    8
    ;; float64 _Angle
    8
    ;; float64 _map_x
    8
    ;; float64 _map_y
    8
    ;; float64 _raw_UTM_X
    8
    ;; float64 _raw_UTM_Y
    8
    ;; float64 _raw_Angle
    8
    ;; float64 _raw_map_x
    8
    ;; float64 _raw_map_y
    8
    ;; float64 _mqtt_angle
    8
    ;; float64 _Vel
    8
    ;; int8 _Quality
    1
    ;; int8 _HeartBeat
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _Lat
       (sys::poke _Lat (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _Lon
       (sys::poke _Lon (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _UTM_X
       (sys::poke _UTM_X (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _UTM_Y
       (sys::poke _UTM_Y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _Angle
       (sys::poke _Angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _map_x
       (sys::poke _map_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _map_y
       (sys::poke _map_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _raw_UTM_X
       (sys::poke _raw_UTM_X (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _raw_UTM_Y
       (sys::poke _raw_UTM_Y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _raw_Angle
       (sys::poke _raw_Angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _raw_map_x
       (sys::poke _raw_map_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _raw_map_y
       (sys::poke _raw_map_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _mqtt_angle
       (sys::poke _mqtt_angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _Vel
       (sys::poke _Vel (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int8 _Quality
       (write-byte _Quality s)
     ;; int8 _HeartBeat
       (write-byte _HeartBeat s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _Lat
     (setq _Lat (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _Lon
     (setq _Lon (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _UTM_X
     (setq _UTM_X (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _UTM_Y
     (setq _UTM_Y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _Angle
     (setq _Angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _map_x
     (setq _map_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _map_y
     (setq _map_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _raw_UTM_X
     (setq _raw_UTM_X (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _raw_UTM_Y
     (setq _raw_UTM_Y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _raw_Angle
     (setq _raw_Angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _raw_map_x
     (setq _raw_map_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _raw_map_y
     (setq _raw_map_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _mqtt_angle
     (setq _mqtt_angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _Vel
     (setq _Vel (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int8 _Quality
     (setq _Quality (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _Quality 127) (setq _Quality (- _Quality 256)))
   ;; int8 _HeartBeat
     (setq _HeartBeat (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _HeartBeat 127) (setq _HeartBeat (- _HeartBeat 256)))
   ;;
   self)
  )

(setf (get gps::MyGPS_msg :md5sum-) "026ac90c0e99c71302e8b4f4029817a8")
(setf (get gps::MyGPS_msg :datatype-) "gps/MyGPS_msg")
(setf (get gps::MyGPS_msg :definition-)
      "Header header 
float64 Lat
float64 Lon
float64 UTM_X
float64 UTM_Y
float64 Angle
float64 map_x
float64 map_y

float64 raw_UTM_X
float64 raw_UTM_Y
float64 raw_Angle
float64 raw_map_x
float64 raw_map_y

float64 mqtt_angle

float64 Vel
int8 Quality
int8 HeartBeat



================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :gps/MyGPS_msg "026ac90c0e99c71302e8b4f4029817a8")


