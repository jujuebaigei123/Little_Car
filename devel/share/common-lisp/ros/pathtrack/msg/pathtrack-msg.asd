
(cl:in-package :asdf)

(defsystem "pathtrack-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "track_state" :depends-on ("_package_track_state"))
    (:file "_package_track_state" :depends-on ("_package"))
  ))