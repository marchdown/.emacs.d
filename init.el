;;;; get current directory
(setq emacs-init-file load-file-name)
(setq user-emacs-directory
      (file-name-directory emacs-init-file))
(setq custom-file (expand-file-name "emacs-customizations.el" user-emacs-directory))
(load custom-file)
(setq backup-directory-alist
      (list (cons "." (expand-file-name "backup" user-emacs-directory))))

;;;; Packages
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-eshell
                                  starter-kit-bindings scpaste
                                  markdown-mode marmalade
                                  color-theme
                                  auctex
                                  go-mode
                                  haskell-mode
;;                                  clojure-mode
                         color-theme-zenburn))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;;; mode associations
(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

;;;; Keybindings
(if (eq window-system 'ns)
    (load "cmd-keybindings.el"))

;; Yegge's advice
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(global-set-key (kbd "C-c o") 'occur)

;; These key combos are bound by default. So tread lightly here.
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

(global-set-key "\C-x/" 'comment-or-uncomment-region)

;;;; Clojure
(defvar inferior-lisp "java -cp ~/clojure/clojure.jar clojure.main")

;;;; Org-mode

(defun org-transpose-table-at-point ()
  "Transpose orgmode table at point, eliminate hlines"
  (interactive)
  (let ((contents
         (apply #'mapcar* #'list
                ;; remove 'hline from list
                (remove-if-not 'listp
                               ;; signals error if not table
                               (org-table-to-lisp)))))
    (delete-region (org-table-begin) (org-table-end))
    (insert (mapconcat (lambda(x) (concat "| " (mapconcat 'identity x " | " ) "  |\n" ))
                       contents ""))
    (org-table-align)))

;(defvar inferior-octave-program
;"/Applications/Octave.app/Contents/MacOS/Octave")

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
