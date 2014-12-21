;;;;
;; this file gets loaded from init.d/keybindings.el if window-system is 'ns

;;;; Command is the new Meta.
(if (eq window-system 'ns)
    (progn
      (setq mac-option-modifier nil)
      (setq mac-command-modifier 'meta)
;;     (global-set-key "\C-\tab" 'completion-at-point)
      ))
;;If Command is Meta, so some Cmd- bindings should be remapped
;(global-set-key (kbd "M-q") 'fill-paragraph)          ;; emacs default, bound
;(global-set-key (kbd "M-q") 'save-buffers-kill-emacs) ;; OS X default NOT bound
;(global-set-key (kbd "s-q") 'save-buffers-kill-emacs) ;; OS X default, bound
(global-set-key (kbd "M-n") 'make-frame-command)
(global-set-key (kbd "M-w") 'delete-frame)

;(global-unset-key (kbd "M-`"))
;(global-unset-key (kbd "M-TAB"))
;(global-set-key (kbd <C-tab>)  'dabbrev-expand)
(global-set-key (kbd "M-`") 'other-frame)
;(global-set-key (kbd "M-~") 'not-modified) ;; emacs default, unbound
(global-set-key (kbd "M-~") 'ns-prev-frame)

;;;; Completion. Note that M-tab corresponds to command+tab on a mac.
(global-set-key (kbd "M-/") 'dabbrev-expand)
(global-set-key (kbd "M-?") 'complete-symbol)

;(global-set-key (kbd "C-S-v") 'scroll-up-command) ;; way too clumsy
(global-set-key (kbd "C-v") 'scroll-down-command)
;(global-set-key (kbd "M-v") 'yank)
(global-set-key (kbd "M-v") 'scroll-up-command)
