;; Remove all those rather annoying toolbars and menus
(tool-bar-mode -1)
(menu-bar-mode -1)

;; And turn off that bell ...
(setq visible-bell 1)

;; Nobody ever wants tabs
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)

;; Everybody wants UTF8 all the way
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(set-locale-environment "en.UTF-8")
(prefer-coding-system 'utf-8)

;; Write backup files to own directory
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Old visual studio habits die slowly, I want to
;; compile via F5 ...
(setq compilation-ask-about-save nil)
(global-set-key [f5] 'compile)

;; Loading various more or less organized parts of my config
(load-file "~/.emacs.d/elisp/proxy.el")

;; Load plugins now, otherwise
(require 'package)

;; Melpa packages
(add-to-list 'package-archives
  '("melpa" . "http://melpa.org/packages/") t)

(setq package-enable-at-startup nil) ; To avoid initializing twice
(package-initialize)

;; Turn on nicer line wrapping
(global-visual-line-mode t) ;; Making sure we are wrapping at word boundaries
(require 'adaptive-wrap)
(add-hook 'visual-line-mode-hook 'adaptive-wrap-prefix-mode)

(nyan-mode)

;; Packages are loaded, it's time for serious stuff
(load-file "~/.emacs.d/elisp/helm-projectile.el")
(load-file "~/.emacs.d/elisp/ecb.el")
(load-file "~/.emacs.d/elisp/haskell.el")
(load-file "~/.emacs.d/elisp/python.el")
(load-file "~/.emacs.d/elisp/web.el")
(load-file "~/.emacs.d/elisp/sql.el")
(load-file "~/.emacs.d/elisp/latex.el")
(load-file "~/.emacs.d/elisp/javascript.el")
(load-file "~/.emacs.d/elisp/go.el")
(load-file "~/.emacs.d/elisp/typescript.el")

;; Lets use a theme :)
(global-hl-line-mode 1)
(global-linum-mode 1)
(load-theme 'ample-zen t)

;; And set some variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-selection
   (quote
    (((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "Okular")
     (output-html "xdg-open"))))
 '(adaptive-wrap-extra-indent 4)
 '(ecb-layout-window-sizes
   (quote
    (("left7"
      (ecb-directories-buffer-name 0.17872340425531916 . 0.589041095890411)
      (ecb-history-buffer-name 0.17872340425531916 . 0.1643835616438356)
      (ecb-methods-buffer-name 0.17872340425531916 . 0.2465753424657534))
     ("left8"
      (ecb-directories-buffer-name 0.20425531914893616 . 0.3013698630136986)
      (ecb-sources-buffer-name 0.20425531914893616 . 0.2328767123287671)
      (ecb-methods-buffer-name 0.20425531914893616 . 0.3013698630136986)
      (ecb-history-buffer-name 0.20425531914893616 . 0.1643835616438356)))))
 '(ecb-options-version "2.40")
 '(safe-local-variable-values (quote ((TeX-master . t)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
