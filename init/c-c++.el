(my-require-and-eval (irony nil irony)
                     (add-hook 'c++-mode-hook 'irony-mode)
                     (add-hook 'c-mode-hook 'irony-mode)
                     (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(my-require-and-eval (company nil company)
                     (my-check-or-install-package 'company-irony)
                     (eval-after-load 'company
                       '(add-to-list 'company-backends 'company-irony))
                     (add-hook 'c++-mode-hook 'company-mode)
                     (add-hook 'c-mode-hook 'company-mode))

(my-require-and-eval (flycheck nil flycheck)
                     (my-check-or-install-package 'flycheck-irony)
                     (eval-after-load 'flycheck
                       '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
                     (add-hook 'c++-mode-hook 'flycheck-mode)
                     (add-hook 'c-mode-hook 'flycheck-mode))

(my-require-and-eval (ggtags nil ggtags)
                     (add-hook 'c-mode-common-hook
                               (lambda ()
                                 (when (derived-mode-p 'c-mode 'c++-mode)
                                   (modify-syntax-entry ?_ "w")
                                   (ggtags-mode t)))))

(my-require-and-eval (cedet nil cedet)
                     (add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
                     (add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
                     (add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
                     (add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
                     (add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)
                     (add-to-list 'semantic-default-submodes 'global-semantic-show-parser-state-mode)
                     (add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)

                     (add-to-list 'semantic-default-submodes 'global-semantic-mode)

                     (setq semantic-idle-scheduler-idle-time 10)

                     (semantic-mode t)

                     (semanticdb-enable-gnu-global-databases 'c-mode)
                     (semanticdb-enable-gnu-global-databases 'c++-mode)

                     (add-hook 'semantic-init-hooks
                               (lambda ()
                                 (imenu-add-to-menubar "TAGS"))))

(my-require-and-eval (google-c-style nil google-c-style)
                     (add-hook 'c-mode-common-hook 'google-set-c-style)
                     (add-hook 'c-mode-common-hook 'google-make-newline-indent))
