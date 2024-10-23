(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")

  ;; https://emacs-lsp.github.io/lsp-mode/tutorials/how-to-turn-off/
  (setq lsp-lens-enable nil)
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-signature-auto-activate nil) ;; you could manually request them via `lsp-signature-activate`
  (setq lsp-signature-render-documentation nil)
  (setq lsp-eldoc-enable-hover nil)

  :hook (
         (elixir-ts-mode . lsp)
;;         (heex-ts-mode . lsp)
         (ruby-mode . lsp))
  :commands lsp)

(use-package lsp-ui :commands lsp-ui-mode)
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
