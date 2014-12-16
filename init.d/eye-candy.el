;;;; Eye candy
;(setq default-frame-alist '((tool-bar-lines . 0) (menu-bar-lines . 1) (width . 80) (height . 50)))
;(invert-face 'default)

;;;; <- http://bzg.fr/emacs-strip-tease.html

(setq initial-scratch-message ";; This is Emacs. You can do anything in Emacs. Anything at all.
;; your agenda is at C-<f12>
")

(setq inhibit-startup-message t)

;; This is bound to f11 in Emacs 24.4
;; (toggle-frame-fullscreen)

;; Who use the bar to scroll?
(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)


;; (show-paren-mode 1)
;; (setq show-paren-delay 0)

;; http://stackoverflow.com/questions/6344474/how-can-i-make-emacs-highlight-lines-that-go-over-80-chars
;; free of trailing whitespace and to use 80-column width, standard indentation
(setq whitespace-style '(trailing lines space-before-tab
                                  indentation space-after-tab)
      whitespace-line-column 80)


(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'dorsey t)

(load-theme 'brin t)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (paredit-mode)
	    (load-theme 'odersky t)))

(add-hook 'clojure-mode-hook
	  (lambda ()
	    (paredit-mode)
;	    (load-theme 'hikey t)	    
;	    (load-theme 'fogus t)
	    (load-theme 'granger t)))

(add-hook 'haskell-mode-hook
	  (lambda ()
	    (haskell-indentation-mode)
	    (pretty-symbols-mode)
	    (paredit-mode)
	    (load-theme 'spolsky t)))

(add-hook 'python-mode-hook
	  (lambda ()
	    (paredit-mode)
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



