
(defconst +my-emacs-config-dir+ "~/.emacs.d")

(setq custom-file (format "%s/custom.el" +my-emacs-config-dir+))
(setq emacs-instance "general")
(load (format "%s/functions.el" +my-emacs-config-dir+))

;; Uncomment if you need proxy usage
;; (my-load-init '(proxy))

(package-initialize)

(my-load-init (append '(package custom cmake c-c++ evil iface ido paredit yaml)
                      (ecase system-type
                        ('gnu/linux '(exwm lisp ruby))
                        ('windows-nt '()))))
