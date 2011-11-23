;;;; Cyrillic Colemak 
;;;; Cyrillic _and_ Cmd-as-meta
(global-set-key (kbd "M-о") 'make-frame-command)
(global-set-key (kbd "M-ц") 'delete-frame)
(global-set-key (kbd "M-я") 'other-frame)
(global-set-key (kbd "C-е") 'keyboard-quit)
(global-set-key (kbd "C-к") 'previous-line)
(global-set-key (kbd "C-л") 'move-end-of-line)
(global-set-key (kbd "C-о") 'next-line)
(global-set-key (kbd "C-п") 'delete-char)
(global-set-key (kbd "C-т") 'kill-line)
(global-set-key (kbd "C-ш") 'universal-argument)

;(global-set-key (kbd "C-ц") 'kill-region)

(global-set-key (kbd "C-щ") 'yank)
(global-set-key (kbd "C-г") 'recenter-top-bottom)
(global-set-key (kbd "C-м") 'scroll-up-command)
(global-set-key (kbd "M-м") 'scroll-down-command)
(global-set-key (kbd "M-щ") 'yank-pop)
(global-set-key (kbd "C-ф") 'move-beginning-of-line)
(global-set-key (kbd "M-г") 'downcase-word)
(global-set-key (kbd "M-и") 'backward-word)
(global-set-key (kbd "C-и") 'backward-char) 
(global-set-key (kbd "M-у") 'forward-char)
(global-set-key (kbd "M-у") 'forward-word)
(global-set-key (kbd "M-ч") 'execute-extended-command)
(global-set-key (kbd "M-ш") 'upcase-word)
(global-set-key (kbd "M-с") 'capitalize-word)
(global-set-key (kbd "M-ь") 'back-to-indentation)
(global-set-key (kbd "M-п") 'kill-word)
