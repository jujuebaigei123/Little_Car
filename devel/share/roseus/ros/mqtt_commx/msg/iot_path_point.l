;; Auto-generated. Do not edit!


(when (boundp 'mqtt_commx::iot_path_point)
  (if (not (find-package "MQTT_COMMX"))
    (make-package "MQTT_COMMX"))
  (shadow 'iot_path_point (find-package "MQTT_COMMX")))
(unless (find-package "MQTT_COMMX::IOT_PATH_POINT")
  (make-package "MQTT_COMMX::IOT_PATH_POINT"))

(in-package "ROS")
;;//! \htmlinclude iot_path_point.msg.html


(defclass mqtt_commx::iot_path_point
  :super ros::object
  :slots (_direction _type _driving_direction _id _speed_vmax _vmax_dev _lane_type _pointX _pointY _pointHA ))

(defmethod mqtt_commx::iot_path_point
  (:init
   (&key
    ((:direction __direction) 0)
    ((:type __type) 0)
    ((:driving_direction __driving_direction) 0)
    ((:id __id) "")
    ((:speed_vmax __speed_vmax) 0.0)
    ((:vmax_dev __vmax_dev) 0.0)
    ((:lane_type __lane_type) 0)
    ((:pointX __pointX) 0.0)
    ((:pointY __pointY) 0.0)
    ((:pointHA __pointHA) 0.0)
    )
   (send-super :init)
   (setq _direction (round __direction))
   (setq _type (round __type))
   (setq _driving_direction (round __driving_direction))
   (setq _id (string __id))
   (setq _speed_vmax (float __speed_vmax))
   (setq _vmax_dev (float __vmax_dev))
   (setq _lane_type (round __lane_type))
   (setq _pointX (float __pointX))
   (setq _pointY (float __pointY))
   (setq _pointHA (float __pointHA))
   self)
  (:direction
   (&optional __direction)
   (if __direction (setq _direction __direction)) _direction)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:driving_direction
   (&optional __driving_direction)
   (if __driving_direction (setq _driving_direction __driving_direction)) _driving_direction)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:speed_vmax
   (&optional __speed_vmax)
   (if __speed_vmax (setq _speed_vmax __speed_vmax)) _speed_vmax)
  (:vmax_dev
   (&optional __vmax_dev)
   (if __vmax_dev (setq _vmax_dev __vmax_dev)) _vmax_dev)
  (:lane_type
   (&optional __lane_type)
   (if __lane_type (setq _lane_type __lane_type)) _lane_type)
  (:pointX
   (&optional __pointX)
   (if __pointX (setq _pointX __pointX)) _pointX)
  (:pointY
   (&optional __pointY)
   (if __pointY (setq _pointY __pointY)) _pointY)
  (:pointHA
   (&optional __pointHA)
   (if __pointHA (setq _pointHA __pointHA)) _pointHA)
  (:serialization-length
   ()
   (+
    ;; int32 _direction
    4
    ;; int32 _type
    4
    ;; int32 _driving_direction
    4
    ;; string _id
    4 (length _id)
    ;; float32 _speed_vmax
    4
    ;; float32 _vmax_dev
    4
    ;; int32 _lane_type
    4
    ;; float64 _pointX
    8
    ;; float64 _pointY
    8
    ;; float64 _pointHA
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _direction
       (write-long _direction s)
     ;; int32 _type
       (write-long _type s)
     ;; int32 _driving_direction
       (write-long _driving_direction s)
     ;; string _id
       (write-long (length _id) s) (princ _id s)
     ;; float32 _speed_vmax
       (sys::poke _speed_vmax (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vmax_dev
       (sys::poke _vmax_dev (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _lane_type
       (write-long _lane_type s)
     ;; float64 _pointX
       (sys::poke _pointX (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pointY
       (sys::poke _pointY (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pointHA
       (sys::poke _pointHA (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _direction
     (setq _direction (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _type
     (setq _type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _driving_direction
     (setq _driving_direction (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _speed_vmax
     (setq _speed_vmax (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vmax_dev
     (setq _vmax_dev (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _lane_type
     (setq _lane_type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _pointX
     (setq _pointX (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pointY
     (setq _pointY (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pointHA
     (setq _pointHA (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get mqtt_commx::iot_path_point :md5sum-) "f109249047779f0f5bde21421b2af811")
(setf (get mqtt_commx::iot_path_point :datatype-) "mqtt_commx/iot_path_point")
(setf (get mqtt_commx::iot_path_point :definition-)
      "int32 direction
int32 type
int32 driving_direction
string id
float32 speed_vmax
float32 vmax_dev
int32 lane_type

float64 pointX
float64 pointY
float64 pointHA

")



(provide :mqtt_commx/iot_path_point "f109249047779f0f5bde21421b2af811")


