;; Auto-generated. Do not edit!


(when (boundp 'mqtt_commx::cmd_Header)
  (if (not (find-package "MQTT_COMMX"))
    (make-package "MQTT_COMMX"))
  (shadow 'cmd_Header (find-package "MQTT_COMMX")))
(unless (find-package "MQTT_COMMX::CMD_HEADER")
  (make-package "MQTT_COMMX::CMD_HEADER"))

(in-package "ROS")
;;//! \htmlinclude cmd_Header.msg.html


(defclass mqtt_commx::cmd_Header
  :super ros::object
  :slots (_trace_id _trans_id _che_id _timestamp _version ))

(defmethod mqtt_commx::cmd_Header
  (:init
   (&key
    ((:trace_id __trace_id) "")
    ((:trans_id __trans_id) "")
    ((:che_id __che_id) "")
    ((:timestamp __timestamp) "")
    ((:version __version) "")
    )
   (send-super :init)
   (setq _trace_id (string __trace_id))
   (setq _trans_id (string __trans_id))
   (setq _che_id (string __che_id))
   (setq _timestamp (string __timestamp))
   (setq _version (string __version))
   self)
  (:trace_id
   (&optional __trace_id)
   (if __trace_id (setq _trace_id __trace_id)) _trace_id)
  (:trans_id
   (&optional __trans_id)
   (if __trans_id (setq _trans_id __trans_id)) _trans_id)
  (:che_id
   (&optional __che_id)
   (if __che_id (setq _che_id __che_id)) _che_id)
  (:timestamp
   (&optional __timestamp)
   (if __timestamp (setq _timestamp __timestamp)) _timestamp)
  (:version
   (&optional __version)
   (if __version (setq _version __version)) _version)
  (:serialization-length
   ()
   (+
    ;; string _trace_id
    4 (length _trace_id)
    ;; string _trans_id
    4 (length _trans_id)
    ;; string _che_id
    4 (length _che_id)
    ;; string _timestamp
    4 (length _timestamp)
    ;; string _version
    4 (length _version)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _trace_id
       (write-long (length _trace_id) s) (princ _trace_id s)
     ;; string _trans_id
       (write-long (length _trans_id) s) (princ _trans_id s)
     ;; string _che_id
       (write-long (length _che_id) s) (princ _che_id s)
     ;; string _timestamp
       (write-long (length _timestamp) s) (princ _timestamp s)
     ;; string _version
       (write-long (length _version) s) (princ _version s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _trace_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _trace_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _trans_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _trans_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _che_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _che_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _timestamp
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _timestamp (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _version
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _version (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get mqtt_commx::cmd_Header :md5sum-) "66f32081d780bd2a95b49f4e58ebf381")
(setf (get mqtt_commx::cmd_Header :datatype-) "mqtt_commx/cmd_Header")
(setf (get mqtt_commx::cmd_Header :definition-)
      "string trace_id
string trans_id
string che_id
string timestamp
string version
")



(provide :mqtt_commx/cmd_Header "66f32081d780bd2a95b49f4e58ebf381")


