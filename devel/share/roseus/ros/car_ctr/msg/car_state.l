;; Auto-generated. Do not edit!


(when (boundp 'car_ctr::car_state)
  (if (not (find-package "CAR_CTR"))
    (make-package "CAR_CTR"))
  (shadow 'car_state (find-package "CAR_CTR")))
(unless (find-package "CAR_CTR::CAR_STATE")
  (make-package "CAR_CTR::CAR_STATE"))

(in-package "ROS")
;;//! \htmlinclude car_state.msg.html


(defclass car_ctr::car_state
  :super ros::object
  :slots (_enable _ctrmode _turnmode _speed _errcode ))

(defmethod car_ctr::car_state
  (:init
   (&key
    ((:enable __enable) nil)
    ((:ctrmode __ctrmode) 0)
    ((:turnmode __turnmode) 0)
    ((:speed __speed) (make-array 4 :initial-element 0.0 :element-type :float))
    ((:errcode __errcode) (make-array 8 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _enable __enable)
   (setq _ctrmode (round __ctrmode))
   (setq _turnmode (round __turnmode))
   (setq _speed __speed)
   (setq _errcode __errcode)
   self)
  (:enable
   (&optional (__enable :null))
   (if (not (eq __enable :null)) (setq _enable __enable)) _enable)
  (:ctrmode
   (&optional __ctrmode)
   (if __ctrmode (setq _ctrmode __ctrmode)) _ctrmode)
  (:turnmode
   (&optional __turnmode)
   (if __turnmode (setq _turnmode __turnmode)) _turnmode)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:errcode
   (&optional __errcode)
   (if __errcode (setq _errcode __errcode)) _errcode)
  (:serialization-length
   ()
   (+
    ;; bool _enable
    1
    ;; int32 _ctrmode
    4
    ;; int32 _turnmode
    4
    ;; float32[4] _speed
    (* 4    4)
    ;; int32[8] _errcode
    (* 4    8)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _enable
       (if _enable (write-byte -1 s) (write-byte 0 s))
     ;; int32 _ctrmode
       (write-long _ctrmode s)
     ;; int32 _turnmode
       (write-long _turnmode s)
     ;; float32[4] _speed
     (dotimes (i 4)
       (sys::poke (elt _speed i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; int32[8] _errcode
     (dotimes (i 8)
       (write-long (elt _errcode i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _enable
     (setq _enable (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int32 _ctrmode
     (setq _ctrmode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _turnmode
     (setq _turnmode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32[4] _speed
   (dotimes (i (length _speed))
     (setf (elt _speed i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; int32[8] _errcode
   (dotimes (i (length _errcode))
     (setf (elt _errcode i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     )
   ;;
   self)
  )

(setf (get car_ctr::car_state :md5sum-) "cb22e40eb79ad4fa4ade5e4b0b7218d3")
(setf (get car_ctr::car_state :datatype-) "car_ctr/car_state")
(setf (get car_ctr::car_state :definition-)
      "bool enable
int32 ctrmode
int32 turnmode    # 0-阿克曼  1-差速模式  2-自转模式  3-横移模式  4-斜行    
float32[4] speed
int32[8] errcode
")



(provide :car_ctr/car_state "cb22e40eb79ad4fa4ade5e4b0b7218d3")


