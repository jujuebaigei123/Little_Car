;; Auto-generated. Do not edit!


(when (boundp 'mqtt_commx::cmd_resp)
  (if (not (find-package "MQTT_COMMX"))
    (make-package "MQTT_COMMX"))
  (shadow 'cmd_resp (find-package "MQTT_COMMX")))
(unless (find-package "MQTT_COMMX::CMD_RESP")
  (make-package "MQTT_COMMX::CMD_RESP"))

(in-package "ROS")
;;//! \htmlinclude cmd_resp.msg.html


(defclass mqtt_commx::cmd_resp
  :super ros::object
  :slots (_header _code ))

(defmethod mqtt_commx::cmd_resp
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

(setf (get mqtt_commx::cmd_resp :md5sum-) "e6208cf7671e976e6c3061bf8dbdd136")
(setf (get mqtt_commx::cmd_resp :datatype-) "mqtt_commx/cmd_resp")
(setf (get mqtt_commx::cmd_resp :definition-)
      "cmd_Header header
int32 code
================================================================================
MSG: mqtt_commx/cmd_Header
string trace_id
string trans_id
string che_id
string timestamp
string version
")



(provide :mqtt_commx/cmd_resp "e6208cf7671e976e6c3061bf8dbdd136")


