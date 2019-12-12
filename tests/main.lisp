(defpackage webapp/tests/main
  (:use :cl
        :webapp
        :rove))
(in-package :webapp/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :cl-sample)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
