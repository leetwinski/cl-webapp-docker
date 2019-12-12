(ql:register-local-projects)
(ql:quickload :webapp)
(save-lisp-and-die "app" :executable t :toplevel #'webapp:main)
