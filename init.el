;; Remove all those rather annoying toolbars and menus
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Use marmalade and melpa packages
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
  '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)

(package-initialize)


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
(projectile-global-mode)
(global-set-key (kbd "C-S-s") 'projectile-switch-project)

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
