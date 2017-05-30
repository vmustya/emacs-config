(require 'cl)

(defun my-check-or-install-package (pkg)
  (or (package-installed-p pkg)
      (package-install pkg)))

(defun my-load-init (modules)
  "Load initialization files"
  (dolist (x modules)
    (load (format "%s/init/%s" +my-emacs-config-dir+ x) t)))

(defun my-add-to-path (dir)
  "Add directory 'dir' in +my-emacs-config-dir+ to 'load-path'"
  (let ((name
         (etypecase dir
                    (symbol (format "%s/%s" +my-emacs-config-dir+ dir))
                    (string dir))))
    (when (file-exists-p name)
      (add-to-list 'load-path name))))

(defmacro* my-require-and-eval ((feature &optional add-to-path package-name) &body body)
  "Execute code if feature was loaded successfully"
  `(progn
     ,(when package-name
        `(my-check-or-install-package ',package-name))
     ,(when add-to-path
        `(my-add-to-path ',add-to-path))
     (if (require ',feature nil t)
         (progn ,@body)
       (message "my-require-and-eval: require filed for '%s'" ',feature))))
