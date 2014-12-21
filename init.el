;;;; get current directory
(setq emacs-init-file load-file-name)
(load "$HOME/.emacs.d/init.d/registers.el")
;; (setq user-emacs-directory (file-name-directory emacs-init-file)) ;; something's wrong here

;;;;;;;;
;;;; There's something deeply wrong with slapping something on top of exec-path 
(add-to-list 'exec-path  "/usr/local/bin")
;;;; more comprehensive alternative:
;; (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
;; (setq exec-path (append exec-path '("/usr/local/bin")))

(add-to-list 'load-path (expand-file-name "libraries" user-emacs-directory))

(setq custom-file (expand-file-name "emacs-customizations.el" user-emacs-directory))
(load custom-file)
(setq backup-directory-alist
      (list (cons "." (expand-file-name "backup" user-emacs-directory))))
;;;; recentf
(require 'recentf)
(setq recentf-max-saved-items 200
      recentf-max-menu-items 15
      recentf-keep '(file-remote-p file-readable-p)
      recentf-auto-cleanup 'never) ;; disable before we start recentf!
(recentf-mode 1)

;;;; Packages
;; Package repos
(require 'package)
(add-to-list 'package-archives
 	     '("GNU ELPA" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives
 	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; packages themselves
(defvar my-packages
 '(
   scpaste
   gist
   marmalade
   better-defaults
   magit
   smex
   ido-ubiquitous
   rainbow-delimiters
   auctex
   markdown-mode
   go-mode
   haskell-mode
   clojure-mode
   paredit
   ;;;; from melpa
   cider   
   4clojure
   dash-at-point
   ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;;; Some of these reference packages, so packages should be loaded by now
;;;; Load everything else in init.d
(if (file-exists-p (expand-file-name "init.d/" user-emacs-directory))
    (dolist (file (directory-files (expand-file-name "init.d/" user-emacs-directory) t "\\.el$"))
      (load file)))

;;;; mode associations
(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.md$" . markdown-mode) auto-mode-alist))


;;;; My functions
(defun collect-word (arg)
  "Copy word under point to a separate buffer.
With argument ARG, use ARG as a buffer instead of *scratch*."
  (interactive "p")
  (copy-region-as-kill (progn (backward-word) (point)) (progn (forward-word) (point)))
  (other-window -1)
  (yank)
  (insert "
")
  (other-window -1)
)

(global-set-key "\M-p" 'collect-word)


(fset 'insert-index
      (lambda (&optional arg) "insert latex-like index." (interactive "p") (kmacro-exec-ring-item (quote ([36 36 left 95 123 125 left] 0 "%d")) arg)))

(global-set-key "\C-xi" 'insert-index)


;;;; Text mode
(add-hook 'text-mode-hook
	  (lambda () (auto-fill-mode -1) (visual-line-mode 1)))



