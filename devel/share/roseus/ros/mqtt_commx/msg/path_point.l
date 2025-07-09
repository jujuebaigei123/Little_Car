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
  :slots (_id _pointX _pointY _pointHA _vehSpeed ))

(defmethod mqtt_commx::path_point
  (:init
   (&key
    ((:id __id) "")
    ((:pointX __pointX) 0.0)
    ((:pointY __pointY) 0.0)
    ((:pointHA __pointHA) 0.0)
    ((:vehSpeed __vehSpeed) 0.0)
    )
   (send-super :init)
   (setq _id (string __id))
   (setq _pointX (float __pointX))
   (setq _pointY (float __pointY))
   (setq _pointHA (float __pointHA))
   (setq _vehSpeed (float __vehSpeed))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:pointX
   (&optional __pointX)
   (if __pointX (setq _pointX __pointX)) _pointX)
  (:pointY
   (&optional __pointY)
   (if __pointY (setq _pointY __pointY)) _pointY)
  (:pointHA
   (&optional __pointHA)
   (if __pointHA (setq _pointHA __pointHA)) _pointHA)
  (:vehSpeed
   (&optional __vehSpeed)
   (if __vehSpeed (setq _vehSpeed __vehSpeed)) _vehSpeed)
  (:serialization-length
   ()
   (+
    ;; string _id
    4 (length _id)
    ;; float64 _pointX
    8
    ;; float64 _pointY
    8
    ;; float64 _pointHA
    8
    ;; float32 _vehSpeed
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _id
       (write-long (length _id) s) (princ _id s)
     ;; float64 _pointX
       (sys::poke _pointX (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pointY
       (sys::poke _pointY (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pointHA
       (sys::poke _pointHA (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float32 _vehSpeed
       (sys::poke _vehSpeed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _pointX
     (setq _pointX (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pointY
     (setq _pointY (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pointHA
     (setq _pointHA (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float32 _vehSpeed
     (setq _vehSpeed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get mqtt_commx::path_point :md5sum-) "8408613975c254abac6a9cd9adbad530")
(setf (get mqtt_commx::path_point :datatype-) "mqtt_commx/path_point")
(setf (get mqtt_commx::path_point :definition-)
      "string id
float64 pointX
float64 pointY
float64 pointHA
float32 vehSpeed

")



(provide :mqtt_commx/path_point "8408613975c254abac6a9cd9adbad530")


