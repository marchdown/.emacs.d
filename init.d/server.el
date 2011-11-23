(require 'edit-server)
(edit-server-start)

;;;;; Start either gnuserv or emacsserver for external access
(if (and (or
          (eq 'windows-nt system-type)
          (featurep 'xemacs))
         (locate-library "gnuserv")
         (locate-file "gnuserv" exec-path '(".exe" "")))
    (progn (require 'gnuserv)
           (gnuserv-start))
  (when (not (eq 'windows-nt system-type)) (server-start)))

;; Start up edit-server for Google Chrome Emacs integration
(if (and (daemonp) (locate-library "edit-server"))
    (progn
      (require 'edit-server)
      (edit-server-start)))



