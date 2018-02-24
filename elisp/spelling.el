;; Use helm to go through autocomplete suggestions
(global-set-key (kbd "C-x s") 'helm-flyspell-correct)

;; Add typechecking for comments to most programming languages
(add-hook 'ruby-mode-hook
          (lambda () (flyspell-prog-mode)))

(add-hook 'tide-mode-hook
          (lambda () (flyspell-prog-mode)))

(add-hook 'web-mode-hook
          (lambda () (flyspell-prog-mode)))
