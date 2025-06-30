;; Auto-generated. Do not edit!


(when (boundp 'mqtt_commx::charge_station_notify)
  (if (not (find-package "MQTT_COMMX"))
    (make-package "MQTT_COMMX"))
  (shadow 'charge_station_notify (find-package "MQTT_COMMX")))
(unless (find-package "MQTT_COMMX::CHARGE_STATION_NOTIFY")
  (make-package "MQTT_COMMX::CHARGE_STATION_NOTIFY"))

(in-package "ROS")
;;//! \htmlinclude charge_station_notify.msg.html


(defclass mqtt_commx::charge_station_notify
  :super ros::object
  :slots (_header _code ))

(defmethod mqtt_commx::charge_station_notify
  (:init
   (&key
    ((:header __header) (instance mqtt_commx::cmd_Header :init))
    ((:code __code) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _code (round __code))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:code
   (&optional __code)
   (if __code (setq _code __code)) _code)
  (:serialization-length
   ()
   (+
    ;; mqtt_commx/cmd_Header _header
    (send _header :serialization-length)
    ;; int32 _code
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; mqtt_commx/cmd_Header _header
       (send _header :serialize s)
     ;; int32 _code
       (write-long _code s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; mqtt_commx/cmd_Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32 _code
     (setq _code (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get mqtt_commx::charge_station_notify :md5sum-) "e6208cf7671e976e6c3061bf8dbdd136")
(setf (get mqtt_commx::charge_station_notify :datatype-) "mqtt_commx/charge_station_notify")
(setf (get mqtt_commx::charge_station_notify :definition-)
      "cmd_Header header
int32 code   # 1 开始充电，2 停止充电

================================================================================
MSG: mqtt_commx/cmd_Header
string trace_id
string trans_id
string che_id
string timestamp
string version
")



(provide :mqtt_commx/charge_station_notify "e6208cf7671e976e6c3061bf8dbdd136")


