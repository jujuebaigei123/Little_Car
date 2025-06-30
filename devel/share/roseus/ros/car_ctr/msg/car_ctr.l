;; Auto-generated. Do not edit!


(when (boundp 'car_ctr::car_ctr)
  (if (not (find-package "CAR_CTR"))
    (make-package "CAR_CTR"))
  (shadow 'car_ctr (find-package "CAR_CTR")))
(unless (find-package "CAR_CTR::CAR_CTR")
  (make-package "CAR_CTR::CAR_CTR"))

(in-package "ROS")
;;//! \htmlinclude car_ctr.msg.html


(defclass car_ctr::car_ctr
  :super ros::object
  :slots (_enable _turnmode _speed _angle ))

(defmethod car_ctr::car_ctr
  (:init
   (&key
    ((:enable __enable) 0)
    ((:turnmode __turnmode) 0)
    ((:speed __speed) 0.0)
    ((:angle __angle) 0.0)
    )
   (send-super :init)
   (setq _enable (round __enable))
   (setq _turnmode (round __turnmode))
   (setq _speed (float __speed))
   (setq _angle (float __angle))
   self)
  (:enable
   (&optional __enable)
   (if __enable (setq _enable __enable)) _enable)
  (:turnmode
   (&optional __turnmode)
   (if __turnmode (setq _turnmode __turnmode)) _turnmode)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:serialization-length
   ()
   (+
    ;; int32 _enable
    4
    ;; int32 _turnmode
    4
    ;; float32 _speed
    4
    ;; float32 _angle
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _enable
       (write-long _enable s)
     ;; int32 _turnmode
       (write-long _turnmode s)
     ;; float32 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _enable
     (setq _enable (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _turnmode
     (setq _turnmode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _speed
     (setq _speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angle
     (setq _angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get car_ctr::car_ctr :md5sum-) "730d29df159fab35648f2f22bf88d85e")
(setf (get car_ctr::car_ctr :datatype-) "car_ctr/car_ctr")
(setf (get car_ctr::car_ctr :definition-)
      "int32 enable
int32 turnmode    #  0-阿克曼    1-斜行  2-横移模式  4-自转模式  x-差速模式  
float32 speed
float32 angle
")



(provide :car_ctr/car_ctr "730d29df159fab35648f2f22bf88d85e")


