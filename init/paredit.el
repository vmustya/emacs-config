(my-require-and-eval (paredit nit paredit)
                     (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
                     (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
                     (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode))
