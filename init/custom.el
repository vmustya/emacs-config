(setq-default indent-tabs-mode nil)
(setq make-backup-files nil)
(setq auto-save-default nil)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
