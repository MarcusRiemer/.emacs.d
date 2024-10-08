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

;; Lets use a theme :)
(load-theme 'ample-zen t)

;; Grabbing filenames from buffers
(load-file (expand-file-name "elisp/copy-filename.el" user-emacs-directory))

;; Packages are loaded, it's time for serious stuff
(load-file (expand-file-name "elisp/asdf.el" user-emacs-directory))
(load-file (expand-file-name "elisp/go.el" user-emacs-directory))
(load-file (expand-file-name "elisp/elixir.el" user-emacs-directory))
(load-file (expand-file-name "elisp/helm-projectile.el"user-emacs-directory))
(load-file (expand-file-name "elisp/company.el" user-emacs-directory))
(load-file (expand-file-name "elisp/markdown.el" user-emacs-directory))
(load-file (expand-file-name "elisp/web.el" user-emacs-directory))
(load-file (expand-file-name "elisp/latex.el" user-emacs-directory))
(load-file (expand-file-name "elisp/javascript.el" user-emacs-directory))
(load-file (expand-file-name "elisp/typescript.el" user-emacs-directory))
(load-file (expand-file-name "elisp/elixir.el" user-emacs-directory))
(load-file (expand-file-name "elisp/magit.el" user-emacs-directory))
(load-file (expand-file-name "elisp/spelling.el" user-emacs-directory))
(load-file (expand-file-name "elisp/prettier.el" user-emacs-directory))
(load-file (expand-file-name "elisp/lsp.el" user-emacs-directory))

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
   '(mise helm-lsp lsp-ui auto-dark elixir-ts-mode graphql-mode dired-quick-sort prettier lsp-mode web-mode eglot helm-flyspell helm-ag graphviz-dot-mode helm projectile flycheck yaxception yaml-mode tide sass-mode nyan-mode markdown-mode magit log4e json-mode highlight-symbol helm-projectile haskell-mode go-mode f company buffer-move auto-complete auctex ample-zen-theme adaptive-wrap))
 '(prettier-enabled-parsers '(angular css html typescript))
 '(ruby-insert-encoding-magic-comment nil)
 '(safe-local-variable-values
   '((TeX-command-extra-options . "-shell-escape")
     (TeX-master . t)))
 '(tide-server-max-response-length 1024000)
 '(tide-sync-request-timeout 120)
 '(typescript-indent-level 2))
(put 'dired-find-alternate-file 'disabled nil)
(put 'downcase-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
