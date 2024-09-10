;; Remove all those rather annoying toolbars and menus
(if (display-graphic-p)
    (tool-bar-mode -1))
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; And turn off that bell ...
(setq visible-bell 1)

;; Nobody ever wants tabs. but if so they are
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; Everybody wants UTF8 all the way
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(set-locale-environment "en.UTF-8")
(prefer-coding-system 'utf-8)

;; overwrite selected text
(delete-selection-mode t)

;; Write backup files to own directory
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))   ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

;; Delete trailing whitespace when saving
(add-hook 'before-save-hook
          'delete-trailing-whitespace)

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

;; Load plugins now, otherwise
(require 'package)

;; Melpa packages
(add-to-list 'package-archives
  '("melpa" . "http://melpa.org/packages/") t)

(setq package-enable-at-startup nil) ; To avoid initializing twice
(package-initialize)

;; Making sure all relevant packages are installed
(setq my-package-list '(prettier adaptive-wrap ample-zen-theme auctex buffer-move company flycheck go-mode haskell-mode projectile helm helm-projectile magit nyan-mode tide web-mode lsp-mode lsp-ui helm-lsp use-package auto-dark))
(mapc #'package-install my-package-list)

;; This is only needed once, near the top of the file
(eval-when-compile
  (require 'use-package))

;; Turn on nicer line wrapping
(global-visual-line-mode t) ;; Making sure we are wrapping at word boundaries
(require 'adaptive-wrap)
(add-hook 'visual-line-mode-hook 'adaptive-wrap-prefix-mode)

;; All important nyan cat!
(if (display-graphic-p)
    (nyan-mode))

;; Grabbing filenames from buffers
(load-file "~/.emacs.d/elisp/copy-filename.el")

;; Packages are loaded, it's time for serious stuff
(load-file "~/.emacs.d/elisp/asdf.el")
(load-file "~/.emacs.d/elisp/go.el")
(load-file "~/.emacs.d/elisp/elixir.el")
(load-file "~/.emacs.d/elisp/helm-projectile.el")
(load-file "~/.emacs.d/elisp/company.el")
(load-file "~/.emacs.d/elisp/markdown.el")
(load-file "~/.emacs.d/elisp/web.el")
(load-file "~/.emacs.d/elisp/latex.el")
(load-file "~/.emacs.d/elisp/javascript.el")
(load-file "~/.emacs.d/elisp/typescript.el")
(load-file "~/.emacs.d/elisp/elixir.el")
(load-file "~/.emacs.d/elisp/magit.el")
(load-file "~/.emacs.d/elisp/spelling.el")
(load-file "~/.emacs.d/elisp/prettier.el")
(load-file "~/.emacs.d/elisp/lsp.el")

;; Lets use a theme :)
(load-theme 'ample-zen t)

;; Allow flipping buffers
(defun win-swap () "Swap windows using buffer-move.el" (interactive) (if (null (windmove-find-other-window 'right)) (buf-move-left) (buf-move-right)))

;; Inserting a random uuid at point
(defun insert-random-uuid ()
  (interactive)
  (shell-command "uuidgen" t))

;; And set some variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-engine 'xetex)
 '(TeX-view-program-selection
   '(((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "Evince")
     (output-html "xdg-open")))
 '(adaptive-wrap-extra-indent 4)
 '(ansi-color-names-vector
   ["#212121" "#CC5542" "#6aaf50" "#7d7c61" "#5180b3" "#DC8CC3" "#9b55c3" "#bdbdb3"])
 '(create-lockfiles nil)
 '(custom-safe-themes
   '("8cf56691a70156f611ac86d0bbcbc7dee7673df195de5918f34bfdc6814ffd39" default))
 '(fci-rule-color "#2e2e2e")
 '(git-commit-summary-max-length 999)
 '(helm-buffer-max-length nil)
 '(lsp-disabled-clients '(ruby-ls rubocop-ls))
 '(lsp-ruby-lsp-use-bundler t)
 '(lsp-solargraph-use-bundler t)
 '(magit-tag-arguments '("--annotate"))
 '(mode-require-final-newline nil)
 '(nxml-slash-auto-complete-flag t)
 '(package-selected-packages
   '(helm-lsp lsp-ui auto-dark elixir-ts-mode graphql-mode dired-quick-sort prettier lsp-mode web-mode eglot helm-flyspell helm-ag graphviz-dot-mode helm projectile flycheck yaxception yaml-mode tide sass-mode nyan-mode markdown-mode magit log4e json-mode highlight-symbol helm-projectile haskell-mode go-mode f company buffer-move auto-complete auctex ample-zen-theme adaptive-wrap))
 '(prettier-enabled-parsers '(angular css html typescript))
 '(ruby-insert-encoding-magic-comment nil)
 '(safe-local-variable-values
   '((TeX-command-extra-options . "-shell-escape")
     (TeX-master . t)))
 '(tide-server-max-response-length 1024000)
 '(tide-sync-request-timeout 120)
 '(typescript-indent-level 2)
 '(vc-annotate-background "#3b3b3b")
 '(vc-annotate-color-map
   '((20 . "#dd5542")
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
     (360 . "#DC8CC3")))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#212121" :foreground "#bdbdb3" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight semi-bold :height 110 :width normal :foundry "ADBO" :family "Source Code Pro")))))
(put 'dired-find-alternate-file 'disabled nil)
(put 'downcase-region 'disabled nil)
