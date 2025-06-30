;; Auto-generated. Do not edit!


(when (boundp 'mqtt_commx::path_point)
  (if (not (find-package "MQTT_COMMX"))
    (make-package "MQTT_COMMX"))
  (shadow 'path_point (find-package "MQTT_COMMX")))
(unless (find-package "MQTT_COMMX::PATH_POINT")
  (make-package "MQTT_COMMX::PATH_POINT"))

(in-package "ROS")
;;//! \htmlinclude path_point.msg.html


(defclass mqtt_commx::path_point
  :super ros::object
  :slots (_vehSpeed _pointX _pointY _pointHA ))

(defmethod mqtt_commx::path_point
  (:init
   (&key
    ((:vehSpeed __vehSpeed) 0.0)
    ((:pointX __pointX) 0.0)
    ((:pointY __pointY) 0.0)
    ((:pointHA __pointHA) 0.0)
    )
   (send-super :init)
   (setq _vehSpeed (float __vehSpeed))
   (setq _pointX (float __pointX))
   (setq _pointY (float __pointY))
   (setq _pointHA (float __pointHA))
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
   ;;
   self)
  )

(setf (get mqtt_commx::path_point :md5sum-) "6c29c28350be647e56acc4fdcf5724c5")
(setf (get mqtt_commx::path_point :datatype-) "mqtt_commx/path_point")
(setf (get mqtt_commx::path_point :definition-)
      "float32 vehSpeed
float64 pointX
float64 pointY
float64 pointHA

")



(provide :mqtt_commx/path_point "6c29c28350be647e56acc4fdcf5724c5")


