;; Remove all those rather annoying toolbars and menus
(tool-bar-mode -1)
(menu-bar-mode -1)

;; And turn off that bell ...
(setq visible-bell 1)

;; Nobody ever wants tabs
(setq-default indent-tabs-mode nil)

;; Everybody wants UTF8 all the way
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(set-locale-environment "en.UTF-8")
(prefer-coding-system 'utf-8)

;; Load plugins now, otherwise
(require 'package)

;; Use marmalade and melpa packages
(add-to-list 'package-archives
  '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
  '("melpa" . "http://melpa.org/packages/") t)

(setq package-enable-at-startup nil) ; To avoid initializing twice
(package-initialize)


;; Set proxy for university laptop
(when (string= system-name "mri-tp")
  (setq url-proxy-services
   '(("no_proxy" . "^\\(localhost\\|10.*\\)")
     ("http" . "cwlan-cache.fh-wedel.de:3128")
     ("https" . "cwlan-cache.fh-wedel.de:3128"))))

;; Old visual studio habits die slowly, I want to
;; compile via F5 ...
(setq compilation-ask-about-save nil)
(global-set-key [f5] 'compile)

;; Write backup files to own directory
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Turn on nicer line wrapping
(global-visual-line-mode t) ;; Making sure we are wrapping at word boundaries
(require 'adaptive-wrap)
(add-hook 'visual-line-mode-hook 'adaptive-wrap-prefix-mode)


;; Lets use a theme :)
(global-hl-line-mode 1)
(global-linum-mode 1)
(load-theme 'ample-zen t)

;; Working with projectile
;;(require 'projectile)
(projectile-global-mode)
(global-set-key (kbd "C-M-p") 'projectile-switch-project)

;; Working with helm
(semantic-mode 1)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "M-x")   'helm-M-x)
(global-set-key (kbd "C-r")   'helm-projectile)

;; Emacs Code Browser
(require 'ecb)
(setq ecb-tip-of-the-day nil)
(setq ecb-show-sources-in-directories-buffer 'always)
(setq ecb-layout-name "left7")

(global-set-key (kbd "C-1") 'ecb-goto-window-edit1)
(global-set-key (kbd "C-2") 'ecb-goto-window-directories)
(global-set-key (kbd "C-3") 'ecb-goto-window-history)
(global-set-key (kbd "C-4") 'ecb-goto-window-methods)


(defvar default-ecb-source-path ())

(add-hook 'ecb-basic-buffer-sync-hook
		  (lambda ()
			(when (functionp 'projectile-get-project-directories)
			  (when (projectile-project-p)
				(dolist (path-dir (projectile-get-project-directories))
				  (unless (member (list path-dir path-dir) default-ecb-source-path)
					(push (list path-dir path-dir) default-ecb-source-path)
					(customize-set-variable 'ecb-source-path default-ecb-source-path)
					))))))

(ecb-activate)

;; Haskell indentation mode
(require 'haskell-cabal)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'font-lock-mode)
(setq haskell-ghci-program-name "cabal")
(setq haskell-ghci-program-args '("repl"))
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

;; SQL Mode
(setq sql-mysql-login-params
      '((user :default "fh_abbild")
        (database :default "fh_abbild")
        (server :default "db-uebung.fh-wedel.de")))
(add-hook 'sql-interactive-mode-hook '(lambda () (toggle-truncate-lines 1))

;; And set some variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(adaptive-wrap-extra-indent 4)
 '(safe-local-variable-values (quote ((TeX-master . t))))
 '(ecb-layout-window-sizes
   (quote
    (("left8"
      (ecb-directories-buffer-name 0.20425531914893616 . 0.3013698630136986)
      (ecb-sources-buffer-name 0.20425531914893616 . 0.2328767123287671)
      (ecb-methods-buffer-name 0.20425531914893616 . 0.3013698630136986)
      (ecb-history-buffer-name 0.20425531914893616 . 0.1643835616438356)))))
 '(ecb-options-version "2.40"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
