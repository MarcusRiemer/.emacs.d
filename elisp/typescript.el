(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1)

  ;; Custom keybindings
  (local-set-key (kbd "C-c r") 'tide-rename-symbol)
  (local-set-key (kbd "C-c f") 'tide-fix)
  )

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; if you use treesitter based typescript-ts-mode (emacs 29+)
(add-hook 'typescript-ts-mode-hook #'setup-tide-mode)