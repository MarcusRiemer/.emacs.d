;; Web Mode
(require 'web-mode)

;; Editing all PHP and HTML files with web mode
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php?\\'" . web-mode))

;; Highlight matching elements and their whole column
(setq web-mode-enable-current-element-highlight t)
;;(setq web-mode-enable-current-column-highlight t)

;; For the time being, we assume that all HTML files
;; use the liquid syntax
(setq web-mode-engines-alist
      '(("django"  . "\\.html\\'"))
)

(defun my-web-mode-hook () 
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (local-set-key (kbd "RET") 'newline-and-indent)
) 
(add-hook 'web-mode-hook 'my-web-mode-hook)
