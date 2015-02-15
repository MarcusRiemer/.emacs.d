
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
