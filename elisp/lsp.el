;; (use-package lsp-mode
;;   :init
;;   ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
;;   ;; (setq lsp-keymap-prefix "C-c l")

;;   ;; ;; https://emacs-lsp.github.io/lsp-mode/tutorials/how-to-turn-off/
;;   (setq lsp-enable-symbol-highlighting nil)     ;; 1
;;   (setq lsp-ui-doc-enable nil)                  ;; 2
;;   (setq lsp-lens-enable nil)                    ;; 3
;;   (setq lsp-headerline-breadcrumb-enable nil)   ;; 4
;;   (setq lsp-ui-sideline-enable nil)             ;; 5 & 6 & 9
;;   (setq lsp-modeline-code-actions-enable nil)   ;; 7
;;   (setq lsp-diagnostics-provider :none)         ;; 8
;;   (setq lsp-eldoc-enable-hover nil)             ;; 10
;;   (setq lsp-modeline-diagnostics-enable nil)    ;; 11
;;   (setq lsp-signature-auto-activate nil)        ;; 12  you could manually request them via `lsp-signature-activate`
;;   (setq lsp-signature-render-documentation nil) ;; 13

;;   ;; lsp-format-buffer

;;   :hook (
;;          (elixir-ts-mode . lsp)
;; ;;         (heex-ts-mode . lsp)
;;          (ruby-mode . lsp))
;;   :commands lsp)

;; (use-package helm-lsp :commands helm-lsp-workspace-symbol)
