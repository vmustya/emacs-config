(my-require-and-eval (yaml-mode nil yaml-mode)
                     (my-require-and-eval (flycheck nil flycheck)
                                          (my-check-or-install-package 'flycheck-yamllint)
                                          (eval-after-load 'flycheck
                                            '(add-hook 'flycheck-mode-hook #'flycheck-yamllint-setup))
                                          (add-hook 'yaml-mode 'flycheck-mode)))
