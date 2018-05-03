(my-require-and-eval (ruby-mode nil ruby-mode)
                     (add-to-list 'auto-mode-alist
                                  '("\\.\\(?:cap\\|gemspec\\|irbrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
                     (add-to-list 'auto-mode-alist
                                  '("\\(?:Brewfile\\|Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'"))

                     ;; A REPL buffer connected to a Ruby subprocess
                     (my-require-and-eval (inf-ruby nil inf-ruby)
                                          (autoload 'inf-ruby-minor-mode "inf-ruby" "Run an inferior Ruby process" t)
                                          (add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
                                          (add-hook 'compilation-filter-hook 'inf-ruby-auto-enter))

                     ;; 'end' keyword autoinsertion
                     (my-require-and-eval (ruby-end nil ruby-end)
                                          (add-hook 'ruby-mode-hook 'ruby-end-mode))

                     ;; Block start highlighting
                     (my-require-and-eval (ruby-block nil ruby-block)
                                          (add-hook 'ruby-mode-hook
                                                    (lambda ()
                                                      (ruby-block-mode t)
                                                      (setq ruby-block-highlight-toggle t))))

                     ;; Autocompletion and code navigation
                     (my-require-and-eval (robe nil robe)
                                          (add-hook 'ruby-mode-hook 'robe-mode))

                                          ;; Autocompletion
                                          (my-require-and-eval (company nil company)
                                                               (add-hook 'ruby-mode-hook
                                                                         (lambda ()
                                                                           (company-mode t)
                                                                           (robe-start t)))
                                                               (eval-after-load 'company
                                                                 '(add-to-list 'company-backends 'company-robe)))

                     ;; Syntax checking
                     (my-require-and-eval (flymake-ruby nil flymake-ruby)
                                          (add-hook 'ruby-mode-hook 'flymake-ruby-load)))
