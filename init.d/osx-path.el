   ;; read in PATH from .bashrc
   (if (not (getenv "TERM_PROGRAM"))
       (setenv "PATH"
               (shell-command-to-string "source $HOME/.profile && printf $PATH")))
