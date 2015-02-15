;; Web Mode
(require 'web-mode)
(defun my-web-mode-hook () 
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (local-set-key (kbd "RET") 'newline-and-indent)
) 
(add-hook 'web-mode-hook 'my-web-mode-hook)
