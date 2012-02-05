;;;; Command is the new Meta.
(if (eq window-system 'ns)
    (progn
      (setq mac-option-modifier nil)
      (setq mac-command-modifier 'meta)
      ;;     (global-set-key "\C-\tab" 'completion-at-point)
      ))
;;If Command is Meta, then some Cmd- bindings should be remapped
(global-set-key (kbd "M-n") 'make-frame-command)
(global-set-key (kbd "M-w") 'delete-frame)
;(global-unset-key (kbd "M-`"))
;(global-unset-key (kbd "M-TAB"))
;(global-set-key (kbd <C-tab>)  'dabbrev-expand)
(global-set-key (kbd "M-`") 'other-frame)


;;;; Completion. Note that M-tab corresponds to command+tab on a mac.
(global-set-key (kbd "M-/") 'dabbrev-expand)
(global-set-key (kbd "M-?") 'complete-symbol)

(global-set-key (kbd "C-S-v") 'scroll-up-command)
(global-set-key (kbd "C-v") 'scroll-down-command)
(global-set-key (kbd "M-v") 'yank)
