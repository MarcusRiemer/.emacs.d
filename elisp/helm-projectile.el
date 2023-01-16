;; Working with helm
(projectile-global-mode)

(semantic-mode 1)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-r") 'helm-projectile)
(global-set-key (kbd "C-t") 'helm-semantic-or-imenu)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

(global-set-key (kbd "C-c C-s") 'helm-do-ag-project-root)
