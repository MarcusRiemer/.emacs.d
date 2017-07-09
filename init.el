;; Remove all those rather annoying toolbars and menus
(if (display-graphic-p)
    (tool-bar-mode -1))
(menu-bar-mode -1)
(scroll-bar-mode -1)

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

;; Nicer keyboard navigation
(global-set-key (kbd "M-<left>")  'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<up>")    'windmove-up)
(global-set-key (kbd "M-<down>")  'windmove-down)

;; Remove prompt when killing a buffer
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;; Faster than the default scp
(setq tramp-default-method "ssh")

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Loading various more or less organized parts of my config
(load-file "~/.emacs.d/elisp/proxy.el")

;; Load plugins now, otherwise
(require 'package)

;; Melpa packages
(add-to-list 'package-archives
  '("melpa" . "http://melpa.org/packages/") t)

(setq package-enable-at-startup nil) ; To avoid initializing twice
(package-initialize)

;; Making sure all relevant packages are installed
(setq my-package-list '(adaptive-wrap ample-zen-theme auctex buffer-move company ecb flycheck go-mode haskell-mode projectile helm helm-projectile magit nyan-mode tide web-mode))
(mapc #'package-install my-package-list)

;; Turn on nicer line wrapping
(global-visual-line-mode t) ;; Making sure we are wrapping at word boundaries
(require 'adaptive-wrap)
(add-hook 'visual-line-mode-hook 'adaptive-wrap-prefix-mode)

;; All important nyan cat!
(if (display-graphic-p)
    (nyan-mode))

;; Allow flipping buffers
(defun win-swap () "Swap windows using buffer-move.el" (interactive) (if (null (windmove-find-other-window 'right)) (buf-move-left) (buf-move-right)))

;; Packages are loaded, it's time for serious stuff
(load-file "~/.emacs.d/elisp/helm-projectile.el")
(load-file "~/.emacs.d/elisp/company.el")
(load-file "~/.emacs.d/elisp/markdown.el")
;; (load-file "~/.emacs.d/elisp/ecb.el")
;; (load-file "~/.emacs.d/elisp/haskell.el")
;; (load-file "~/.emacs.d/elisp/python.el")
(load-file "~/.emacs.d/elisp/web.el")
;; (load-file "~/.emacs.d/elisp/sql.el")
(load-file "~/.emacs.d/elisp/latex.el")
(load-file "~/.emacs.d/elisp/javascript.el")
;; (load-file "~/.emacs.d/elisp/go.el")
(load-file "~/.emacs.d/elisp/typescript.el")
(load-file "~/.emacs.d/elisp/magit.el")

(load-file "~/.emacs.d/static/nginx-mode.el")

;; Lets use a theme :)
(global-hl-line-mode 1)
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
     (output-pdf "Evince")
     (output-html "xdg-open"))))
 '(adaptive-wrap-extra-indent 4)
 '(ansi-color-names-vector
   ["#212121" "#CC5542" "#6aaf50" "#7d7c61" "#5180b3" "#DC8CC3" "#9b55c3" "#bdbdb3"])
 '(custom-safe-themes
   (quote
    ("8cf56691a70156f611ac86d0bbcbc7dee7673df195de5918f34bfdc6814ffd39" default)))
 '(ecb-layout-window-sizes
   (quote
    (("left13"
      (ecb-directories-buffer-name 0.17721518987341772 . 0.9863013698630136))
     ("left15"
      (ecb-directories-buffer-name 0.1694915254237288 . 0.6712328767123288)
      (ecb-methods-buffer-name 0.1694915254237288 . 0.3287671232876712))
     ("left7"
      (ecb-directories-buffer-name 0.17872340425531916 . 0.589041095890411)
      (ecb-history-buffer-name 0.17872340425531916 . 0.1643835616438356)
      (ecb-methods-buffer-name 0.17872340425531916 . 0.2465753424657534))
     ("left8"
      (ecb-directories-buffer-name 0.20425531914893616 . 0.3013698630136986)
      (ecb-sources-buffer-name 0.20425531914893616 . 0.2328767123287671)
      (ecb-methods-buffer-name 0.20425531914893616 . 0.3013698630136986)
      (ecb-history-buffer-name 0.20425531914893616 . 0.1643835616438356)))))
 '(ecb-options-version "2.40")
 '(fci-rule-color "#2e2e2e")
 '(git-commit-summary-max-length 999)
 '(magit-tag-arguments (quote ("--annotate")))
 '(nxml-slash-auto-complete-flag t)
 '(package-selected-packages
   (quote
    (helm projectile flycheck yaxception yaml-mode web-mode tide thrift spacegray-theme sass-mode nyan-mode markdown-mode magit log4e json-mode highlight-symbol helm-projectile haskell-mode go-mode f ecb company buffer-move auto-complete auctex ample-zen-theme adaptive-wrap)))
 '(safe-local-variable-values (quote ((TeX-master . t))))
 '(vc-annotate-background "#3b3b3b")
 '(vc-annotate-color-map
   (quote
    ((20 . "#dd5542")
     (40 . "#CC5542")
     (60 . "#fb8512")
     (80 . "#baba36")
     (100 . "#bdbc61")
     (120 . "#7d7c61")
     (140 . "#6abd50")
     (160 . "#6aaf50")
     (180 . "#6aa350")
     (200 . "#6a9550")
     (220 . "#6a8550")
     (240 . "#6a7550")
     (260 . "#9b55c3")
     (280 . "#6CA0A3")
     (300 . "#528fd1")
     (320 . "#5180b3")
     (340 . "#6380b3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
