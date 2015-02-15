;; Set proxy for university laptop
(when (string= system-name "mri-tp")
  (setq url-proxy-services
   '(("no_proxy" . "^\\(localhost\\|10.*\\)")
     ("http" . "cwlan-cache.fh-wedel.de:3128")
     ("https" . "cwlan-cache.fh-wedel.de:3128"))))
