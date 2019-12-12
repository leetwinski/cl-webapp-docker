(defpackage webapp
  (:use :cl :wookie)
  (:export #:main))
(in-package :webapp)

;; define our homepage route
(defroute (:get "/") (req res)
  (send-response res :body "Thanks for stopping by!"))

;; start serving requests!
(defun main ()
  (format t "initializing app on port ~a~%" 80)
  (load-plugins)
  (as:with-event-loop ()
    (start-server (make-instance 'listener :port 80))))
