
(cl:in-package :asdf)

(defsystem "gps-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "MyGPS_msg" :depends-on ("_package_MyGPS_msg"))
    (:file "_package_MyGPS_msg" :depends-on ("_package"))
  ))