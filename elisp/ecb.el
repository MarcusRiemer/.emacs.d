
;; Emacs Code Browser, but only when using some kind
;; of sophisticated windowing system
(when (display-graphic-p)

  (require 'ecb)
  (setq ecb-tip-of-the-day nil)
  (setq ecb-show-sources-in-directories-buffer 'always)
  (setq ecb-layout-name "left13")

  (global-set-key (kbd "C-1") 'ecb-goto-window-edit1)
  (global-set-key (kbd "C-2") 'ecb-goto-window-directories)

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
)
