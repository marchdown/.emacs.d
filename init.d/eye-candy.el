;;;; Eye candy
;(setq default-frame-alist '((tool-bar-lines . 0) (menu-bar-lines . 1) (width . 80) (height . 50)))
;(invert-face 'default)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'dorsey t)

(load-theme 'brin t)

(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (paredit-mode)
	    (rainbow-delimiters-mode)
	    (load-theme 'odersky t)))

(add-hook 'clojure-mode-hook
	  (lambda ()
	    (paredit-mode)
	    (rainbow-delimiters-mode)
;	    (load-theme 'hikey t)	    
;	    (load-theme 'fogus t)
	    (load-theme 'granger t)))

(add-hook 'haskell-mode-hook
	  (lambda ()
	    (haskell-indentation-mode)
	    (pretty-symbols-mode)
	    (paredit-mode)
	    (rainbow-delimiters-mode)
	    (load-theme 'spolsky t)))

(add-hook 'python-mode-hook
	  (lambda ()
	    (paredit-mode)
	    (rainbow-delimiters-mode)
	    (load-theme 'graham t)))




;(require 'color-theme)
;(if (require 'color-theme-zenburn) (color-theme-zenburn) nil) 
;(set-fontset-font "fontset-default" 'cyrillic '("Anonymous Pro". "unicode-bmp"))
;(set-default-font "Anonymous Pro")
;;фубарчек
;(set-default-font "Terminus")

(load "emacs-rc-pretty-lambda.el")
                                        ;(set-default-font "Menlo")
;(set-default-font "Monaco")


;(set-default-font "Courier")
;(set-default-font "Verdana")
;(prefer-coding-system 'utf-8)
;(set-face-attribute 'default nil :family "Anonymous Pro" :height 140)
;"фывачхя"
;"řŘR ασδφ΄λκξ"



