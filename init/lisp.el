(setq blink-matching-paren nil)
(show-paren-mode t)

(setq slime-additional-font-lock-keywords nil)

(my-require-and-eval (slime nil slime)
  (defun load-slime ()
    (slime-setup '(slime-fancy
                   slime-sbcl-exts slime-scheme
                   slime-sprof
                   slime-asdf
                   slime-indentation))
    (let ((slime-fasls-directory (expand-file-name
                                  "~/lisp/fasls/from-slime/")))
      (make-directory slime-fasls-directory t)
      (setq slime-compile-file-options
            `(:fasl-directory ,slime-fasls-directory)))
    (make-directory "~/.config/emacs/" t)
    (setq
     lisp-indent-function 'common-lisp-indent-function
     slime-complete-symbol-function 'slime-fuzzy-complete-symbol
     slime-net-coding-system 'utf-8-unix
     slime-startup-animation nil
     slime-auto-select-connection 'always
     ;; common-lisp-hyperspec-root
     ;; (concat "file:/" (expand-file-name "~/doc/comp/lang/lisp/HyperSpec/"))
     slime-kill-without-query-p t
     slime-when-complete-filename-expand t
     slime-description-autofocus t
     slime-repl-history-remove-duplicates t
     slime-repl-history-trim-whitespaces t
     slime-fuzzy-explanation ""
     slime-repl-history-file "~/.config/emacs/slime-history.eld"
     slime-asdf-collect-notes t
     slime-inhibit-pipelining nil
     ;; slime-compilation-finished-hook 'slime-list-compiler-notes
     slime-load-failed-fasl 'always
     lisp-loop-indent-subclauses nil
     lisp-loop-indent-forms-like-keywords t
     lisp-lambda-list-keyword-parameter-alignment t
     slime-export-symbol-representation-auto t
     slime-export-save-file t
     slime-edit-uses-xrefs (remove :depends-on slime-edit-uses-xrefs)
     eldoc-echo-area-use-multiline-p nil)

    (setq slime-lisp-implementations
          '((sbcl ("/usr/bin/sbcl"))
            (ecl ("/usr/bin/ecl"))))

    (when (boundp 'slime-repl-mode-map)
      (define-key slime-repl-mode-map "\C-c\C-u" 'slime-repl-delete-current-input)
      (define-key slime-repl-mode-map [tab] 'slime-complete-symbol))

    (define-key slime-mode-map "\C-c\M-i" 'slime-inspect-definition)
    (define-key slime-editing-map "\C-c\M-d" 'slime-disassemble-definition)
    (define-key slime-editing-map "\C-c\M-D" 'slime-disassemble-full-definition)

    (defun slime-disassemble-full-definition ()
      "Disassemble definition at point"
      (interactive)
      (slime-eval-describe
       `(swank::with-buffer-syntax
            ()
          (cl:with-output-to-string
              (cl:*standard-output*)
            (cl:let ((cl:*print-readably* cl:nil))
              (sb-disassem:disassemble-code-component
               (cl:eval (cl:read-from-string ,(slime-definition-at-point t))))))))))

  (load-slime))
