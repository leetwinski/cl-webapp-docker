(declaim (optimize (speed 0) (safety 3)))
(ql:register-local-projects)
(ql:quickload :webapp/tests)
(asdf:test-system :webapp)

(let ((errors (third rove/core/suite:*last-suite-report*)))
  (when errors
    (uiop:quit 1)))
