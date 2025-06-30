;; Auto-generated. Do not edit!


(when (boundp 'mqtt_comm::path_point_action)
  (if (not (find-package "MQTT_COMM"))
    (make-package "MQTT_COMM"))
  (shadow 'path_point_action (find-package "MQTT_COMM")))
(unless (find-package "MQTT_COMM::PATH_POINT_ACTION")
  (make-package "MQTT_COMM::PATH_POINT_ACTION"))

(in-package "ROS")
;;//! \htmlinclude path_point_action.msg.html


(defclass mqtt_comm::path_point_action
  :super ros::object
  :slots (_caption _params ))

(defmethod mqtt_comm::path_point_action
  (:init
   (&key
    ((:caption __caption) "")
    ((:params __params) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _caption (string __caption))
   (setq _params __params)
   self)
  (:caption
   (&optional __caption)
   (if __caption (setq _caption __caption)) _caption)
  (:params
   (&optional __params)
   (if __params (setq _params __params)) _params)
  (:serialization-length
   ()
   (+
    ;; string _caption
    4 (length _caption)
    ;; float32[] _params
    (* 4    (length _params)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _caption
       (write-long (length _caption) s) (princ _caption s)
     ;; float32[] _params
     (write-long (length _params) s)
     (dotimes (i (length _params))
       (sys::poke (elt _params i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _caption
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _caption (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32[] _params
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _params (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _params i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get mqtt_comm::path_point_action :md5sum-) "a5673b402e1654274f346fe24f513dd3")
(setf (get mqtt_comm::path_point_action :datatype-) "mqtt_comm/path_point_action")
(setf (get mqtt_comm::path_point_action :definition-)
      "string caption
float32[] params



")



(provide :mqtt_comm/path_point_action "a5673b402e1654274f346fe24f513dd3")


