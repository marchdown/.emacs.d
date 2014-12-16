;;;; get current directory
(setq emacs-init-file load-file-name)
(load "$HOME/.emacs.d/init.d/registers.el")
;; (setq user-emacs-directory (file-name-directory emacs-init-file)) ;; something's wrong here

;;;;;;;;
;;;; There's something deeply wrong with slapping something on top of exec-path 
(add-to-list 'exec-path "/usr/local/bin")
;;;; more comprehensive alternative:
;; (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
;; (setq exec-path (append exec-path '("/usr/local/bin")))

(require 'recentf)
(setq recentf-keep '(file-remote-p file-readable-p))
(setq recentf-auto-cleanup 'never) ;; disable before we start recentf!
(recentf-mode 1)

(setq custom-file (expand-file-name "emacs-customizations.el" user-emacs-directory))
(load custom-file)
(setq backup-directory-alist
      (list (cons "." (expand-file-name "backup" user-emacs-directory))))

(add-to-list 'load-path (expand-file-name "libraries" user-emacs-directory))
;;;; Load mac keybindings if on a mac
(if (eq window-system 'ns)
    (load (expand-file-name  "cmd-keybindings.el" user-emacs-directory)))

;;;; Packages
(require 'package)
(add-to-list 'package-archives
 	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
 '(
   ;; starter-kit starter-kit-lisp starter-kit-eshell
   ;; starter-kit-bindings scpaste
   marmalade
   markdown-mode
   ;; sublime-themes
   ;; color-theme
   rainbow-delimiters
   ;; color-theme-zenburn
   ;; auctex
   go-mode
   haskell-mode
   gist
   clojure-mode
   paredit
   slime
   slime-repl
   ;;swank-clojure

   ;;;; from melpa
   4clojure
   dash-at-point
 ))
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

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


;;;; Keybindings
(global-set-key (kbd "<f8>") 'gist-region-or-buffer)

;; Yegge's advice
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(global-set-key (kbd "C-c o") 'occur)

;; These key combos are bound by default. So tread lightly here.
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

(global-set-key "\C-x/" 'comment-or-uncomment-region)

;;;; Clojure setup
; the next lines are actively harmful
;(defvar inferior-lisp "java -cp ~/clojure/clojure.jar clojure.main")

;; (setq inferior-lisp-program "/home/user/my-clojure-startup-script.sh"
;;     inferior-lisp-load-command "(load \"%s\")\n"
;;     lisp-function-doc-command "(doc %s)\n"
;;     lisp-var-doc-command "(doc %s)\n")

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


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
;; (when
;;     (load
;;      (expand-file-name "~/.emacs.d/elpa/package.el"))
;;   (package-initialize))

(add-hook 'clojure-mode-hook
	  (lambda ()
	    (paredit-mode)
	    (rainbow-delimiters-mode)
	    (load-theme 'granger t)))

(add-hook 'haskell-mode-hook
	  (lambda ()
	    (haskell-indentation-mode)
	    (pretty-symbols-mode)
	    (paredit-mode)
	    (rainbow-delimiters-mode)
	    (load-theme 'spolsky t)))





