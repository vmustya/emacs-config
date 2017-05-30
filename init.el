
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defconst +my-emacs-config-dir+ "~/.emacs.d")

(setq custom-file (format "%s/custom.el" +my-emacs-config-dir+))
(setq emacs-instance "general")
(load (format "%s/functions.el" +my-emacs-config-dir+))

(my-load-init '(package exwm custom evil iface ido paredit c-c++))

(setq make-backup-files nil)
