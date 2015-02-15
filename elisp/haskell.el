;; Haskell indentation mode
(require 'haskell-cabal)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'font-lock-mode)
(setq haskell-ghci-program-name "cabal")
(setq haskell-ghci-program-args '("repl"))
(setq haskell-program-name "cabal repl")
