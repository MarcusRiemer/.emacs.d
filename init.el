;; Remove all those rather annoying toolbars and menus
(tool-bar-mode -1)
(menu-bar-mode -1)

;; And turn off that bell ...
(setq visible-bell 1)

;; Load plugins now, otherwise
(require 'package)
(setq package-enable-at-startup nil) ; To avoid initializing twice
(package-initialize)

;; Use marmalade and melpa packages
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)

;; Old visual studio habits die slowly, I want to
;; compile via F5 ...
(setq compilation-ask-about-save nil)
(global-set-key [f5] 'compile)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Working with projectile
;;(require 'projectile)
(projectile-global-mode)
(global-set-key (kbd "C-M-p") 'projectile-switch-project)

;; Working with helm
(semantic-mode 1)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "M-x")   'helm-M-x)
(global-set-key (kbd "C-r")   'helm-projectile)

;; Set proxy for university laptop
(when (string= system-name "marcus-hp")
  (setq url-proxy-services
   '(("no_proxy" . "^\\(localhost\\|10.*\\)")
     ("http" . "cwlan-cache.fh-wedel.de:3128")
     ("https" . "cwlan-cache.fh-wedel.de:3128"))))



;; Haskell indentation mode
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'font-lock-mode)

;; Use cabal as REPL environment
(setq haskell-program-name "cabal repl")

;; Python mode
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; Web Mode
(require 'web-mode)
(defun my-web-mode-hook () 
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (local-set-key (kbd "RET") 'newline-and-indent)
) 
(add-hook 'web-mode-hook 'my-web-mode-hook)

;; Turn on nicer line wrapping
(global-visual-line-mode t) ;; Making sure we are wrapping at word boundaries
(require 'adaptive-wrap)
(add-hook 'visual-line-mode-hook 'adaptive-wrap-prefix-mode)

;; And set some variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(adaptive-wrap-extra-indent 4)
 )
