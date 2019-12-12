(defsystem "webapp"
  :version "0.1.0"
  :author "leetwin"
  :license "LLGPL"
  :depends-on ("yason"
               "wookie")
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "webapp/tests"))))

(defsystem "webapp/tests"
  :author "leetwin"
  :license "LLGPL"
  :depends-on ("webapp"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for webapp"
  :perform (test-op (op c) (symbol-call :rove :run c)))
