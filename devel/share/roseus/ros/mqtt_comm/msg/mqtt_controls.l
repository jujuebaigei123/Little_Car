;; Auto-generated. Do not edit!


(when (boundp 'mqtt_comm::mqtt_controls)
  (if (not (find-package "MQTT_COMM"))
    (make-package "MQTT_COMM"))
  (shadow 'mqtt_controls (find-package "MQTT_COMM")))
(unless (find-package "MQTT_COMM::MQTT_CONTROLS")
  (make-package "MQTT_COMM::MQTT_CONTROLS"))

(in-package "ROS")
;;//! \htmlinclude mqtt_controls.msg.html


(defclass mqtt_comm::mqtt_controls
  :super ros::object
  :slots (_msgType _ctrlType _value ))

(defmethod mqtt_comm::mqtt_controls
  (:init
   (&key
    ((:msgType __msgType) "")
    ((:ctrlType __ctrlType) "")
    ((:value __value) 0)
    )
   (send-super :init)
   (setq _msgType (string __msgType))
   (setq _ctrlType (string __ctrlType))
   (setq _value (round __value))
   self)
  (:msgType
   (&optional __msgType)
   (if __msgType (setq _msgType __msgType)) _msgType)
  (:ctrlType
   (&optional __ctrlType)
   (if __ctrlType (setq _ctrlType __ctrlType)) _ctrlType)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; string _msgType
    4 (length _msgType)
    ;; string _ctrlType
    4 (length _ctrlType)
    ;; int32 _value
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _msgType
       (write-long (length _msgType) s) (princ _msgType s)
     ;; string _ctrlType
       (write-long (length _ctrlType) s) (princ _ctrlType s)
     ;; int32 _value
       (write-long _value s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _msgType
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _msgType (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _ctrlType
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _ctrlType (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _value
     (setq _value (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get mqtt_comm::mqtt_controls :md5sum-) "72ea1fe4c09d3fce0f4c7c6c75183cc5")
(setf (get mqtt_comm::mqtt_controls :datatype-) "mqtt_comm/mqtt_controls")
(setf (get mqtt_comm::mqtt_controls :definition-)
      "string msgType
string ctrlType
int32 value






")



(provide :mqtt_comm/mqtt_controls "72ea1fe4c09d3fce0f4c7c6c75183cc5")


