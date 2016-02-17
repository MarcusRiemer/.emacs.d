;; Activate company mode globally
(add-hook 'after-init-hook 'global-company-mode)

;; Complete on C-SPC
(global-set-key (kbd "C-SPC") 'company-complete)
