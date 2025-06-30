;; Auto-generated. Do not edit!


(when (boundp 'mqtt_commx::network_heartbeat)
  (if (not (find-package "MQTT_COMMX"))
    (make-package "MQTT_COMMX"))
  (shadow 'network_heartbeat (find-package "MQTT_COMMX")))
(unless (find-package "MQTT_COMMX::NETWORK_HEARTBEAT")
  (make-package "MQTT_COMMX::NETWORK_HEARTBEAT"))

(in-package "ROS")
;;//! \htmlinclude network_heartbeat.msg.html


(defclass mqtt_commx::network_heartbeat
  :super ros::object
  :slots (_status ))

(defmethod mqtt_commx::network_heartbeat
  (:init
   (&key
    ((:status __status) 0)
    )
   (send-super :init)
   (setq _status (round __status))
   self)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:serialization-length
   ()
   (+
    ;; int32 _status
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _status
       (write-long _status s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _status
     (setq _status (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get mqtt_commx::network_heartbeat :md5sum-) "86791dcf1de997ec7de5a0de7e4dcfcc")
(setf (get mqtt_commx::network_heartbeat :datatype-) "mqtt_commx/network_heartbeat")
(setf (get mqtt_commx::network_heartbeat :definition-)
      "int32 status    # 0 网络不通，1 网络通信正常

")



(provide :mqtt_commx/network_heartbeat "86791dcf1de997ec7de5a0de7e4dcfcc")


