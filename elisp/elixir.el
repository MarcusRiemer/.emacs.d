(use-package
 emacs
 :ensure nil
 :custom

 ;; Should use:
 ;; (mapc #'treesit-install-language-grammar (mapcar #'car treesit-language-source-alist))
 ;; at least once per installation or while changing this list
 (treesit-language-source-alist
  '((heex "https://github.com/phoenixframework/tree-sitter-heex")
    (elixir "https://github.com/elixir-lang/tree-sitter-elixir")))

 (major-mode-remap-alist
  '((elixir-mode . elixir-ts-mode)))
)