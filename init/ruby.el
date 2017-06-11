(my-require-and-eval (ruby-mode nil ruby-mode)
                     (add-to-list 'auto-mode-alist
                                  '("\\.\\(?:cap\\|gemspec\\|irbrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
                     (add-to-list 'auto-mode-alist
                                  '("\\(?:Brewfile\\|Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'"))
                     (my-require-and-eval (ruby-block nil ruby-block)
                                          (add-hook 'ruby-mode-hook
                                                    (lambda ()
                                                      (ruby-block-mode t)
                                                      (setq ruby-block-highlight-toggle t)))))
