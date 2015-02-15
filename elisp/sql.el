;; SQL Mode
(setq sql-mysql-login-params
      '((user :default "fh_abbild")
        (database :default "fh_abbild")
        (server :default "db-uebung.fh-wedel.de")))
(add-hook 'sql-interactive-mode-hook '(lambda () (toggle-truncate-lines 1)))
