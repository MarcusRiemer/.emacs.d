;; Working with projectile
;;(require 'projectile)
(projectile-global-mode)
(global-set-key (kbd "C-M-p") 'projectile-switch-project)
;; Working with helm
(semantic-mode 1)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-r") 'helm-projectile)
