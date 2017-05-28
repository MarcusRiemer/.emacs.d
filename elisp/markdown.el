(eval-after-load "markdown-mode"
  '(progn
    (define-key markdown-mode-map (kbd "M-<right>") nil) ;; unbind M-right
    (define-key markdown-mode-map (kbd "M-<left>") nil))) ;; unbind M-left
