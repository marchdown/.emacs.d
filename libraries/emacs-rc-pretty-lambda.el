;;; emacs-rc-pretty-lambda.el ---

;; Unicode symbols in buffer
(defun unicode-symbol (name)
  "Translate a symbolic name for a Unicode character -- e.g., LEFT-ARROW
 or GREATER-THAN into an actual Unicode character code. "
  (decode-char 'ucs (case name
                      ('left-arrow 8592)
                      ('up-arrow 8593)
                      ('right-arrow 8594)
                      ('down-arrow 8595)
                      ('right-double-arrow 8658)
                      ('left-double-arrow 8656)
                      ('double-vertical-bar #X2551)
                      ('equal #X003d)
                      ('not-equal #X2260)
                      ('identical #X2261)
                      ('not-identical #X2262)
                      ('less-than #X003c)
                      ('greater-than #X003e)
                      ('less-than-or-equal-to #X2264)
                      ('greater-than-or-equal-to #X2265)
                      ('logical-and #X2227)
                      ('logical-or #X2228)
                      ('logical-neg #X00AC)
                      ('nil #X2205)
                      ('horizontal-ellipsis #X2026)
                      ('double-exclamation #X203C)
                      ('prime #X2032)
                      ('double-prime #X2033)
                      ('for-all #X2200)
                      ('there-exists #X2203)
                      ('element-of #X2208)
                      ('square-root #X221A)
                      ('squared #X00B2)
                      ('cubed #X00B3)
                      ('lambda #X03BB)
                      ('alpha #X03B1)
                      ('beta #X03B2)
                      ('gamma #X03B3)
                      ('delta #X03B4))))

(defun substitute-pattern-with-unicode (pattern symbol)
  "Add a font lock hook to replace the matched part of PATTERN with the
Unicode symbol SYMBOL looked up with UNICODE-SYMBOL."
  (interactive)
  (font-lock-add-keywords
   nil `((,pattern
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    ,(unicode-symbol symbol)
                                    'decompose-region)
                    nil))))))

(defun substitute-patterns-with-unicode (patterns)
  "Call SUBSTITUTE-PATTERN-WITH-UNICODE repeatedly."
  (mapcar #'(lambda (x)
              (substitute-pattern-with-unicode (car x)
                                               (cdr x)))
          patterns))


;; symbol replacements for erlang
(defun erlang-unicode ()
  (interactive)
  (substitute-patterns-with-unicode
   (list
    ;; (cons "\\(<<\\)" 'left-arrow)
    ;; (cons "\\(>>\\)" 'left-arrow)
    (cons "\\s \\(->\\)\\(\\s \\|$\\)" 'right-arrow))))
(add-hook 'erlang-mode-hook 'erlang-unicode)

;;; emacs-rc-pretty-lambda.el ends here

  (defun haskell-unicode ()
	(interactive)
	(substitute-patterns-with-unicode
	 (list
            (cons "\\s \\(<-\\)\\s " 'left-arrow)
            (cons "\\s \\(->\\)\\s " 'right-arrow)
            (cons "\\s \\(==\\)\\s " 'identical)
            (cons "\\s \\(/=\\)\\s " 'not-identical)
            (cons "\\s \\(()\\)\\(\\s \\|$\\)" 'nil)
            (cons "\\<\\(sqrt\\)\\>" 'square-root)
            (cons "\\s \\(&&\\)\\s " 'logical-and)
            (cons "\\s \\(||\\)\\s " 'logical-or)
            (cons "\\<\\(not\\)\\>" 'logical-neg)
            (cons "\\s \\(>\\)\\[^=\\]" 'greater-than)
            (cons "\\s \\(<\\)\\[^=\\]" 'less-than)
            (cons "\\s \\(>=\\)\\s " 'greater-than-or-equal-to)
            (cons "\\s \\(<=\\)\\s " 'less-than-or-equal-to)
            (cons "\\<\\(alpha\\)\\>" 'alpha)
            (cons "\\<\\(beta\\)\\>" 'beta)
            (cons "\\<\\(gamma\\)\\>" 'gamma)
            (cons "\\<\\(delta\\)\\>" 'delta)
            (cons "\\s \\(''\\)\\s " 'double-prime)
            (cons "\\s \\('\\)\\s " 'prime)
            (cons "\\s (?\\(\\\\\\)\\s *\\(\\w\\|_\\).*?\\s *->" 'lambda)
            (cons "\\s \\(!!\\)\\s " 'double-exclamation)
            (cons "\\s \\(\\.\\.\\)\\s " 'horizontal-ellipsis))))

(add-hook 'haskell-mode 'haskell-unicode)




  ;; (defun unicode-symbol (name)
  ;;   "Translate a symbolic name for a Unicode character -- e.g., LEFT-ARROW
  ;; or GREATER-THAN into an actual Unicode character code. "
  ;;   (decode-char 'ucs (case name
  ;;                       ;; arrows
  ;;                       ('left-arrow 8592)
  ;;                       ('up-arrow 8593)
  ;;                       ('right-arrow 8594)
  ;;                       ('down-arrow 8595)
  ;;                       ;; boxes
  ;;                       ('double-vertical-bar #X2551)
  ;;                       ;; relational operators
  ;;                       ('equal #X003d)
  ;;                       ('not-equal #X2260)
  ;;                       ('identical #X2261)
  ;;                       ('not-identical #X2262)
  ;;                       ('less-than #X003c)
  ;;                       ('greater-than #X003e)
  ;;                       ('less-than-or-equal-to #X2264)
  ;;                       ('greater-than-or-equal-to #X2265)
  ;;                       ;; logical operators
  ;;                       ('logical-and #X2227)
  ;;                       ('logical-or #X2228)
  ;;                       ('logical-neg #X00AC)
  ;;                       ;; misc
  ;;                       ('nil #X2205)
  ;;                       ('horizontal-ellipsis #X2026)
  ;;                       ('double-exclamation #X203C)
  ;;                       ('prime #X2032)
  ;;                       ('double-prime #X2033)
  ;;                       ('for-all #X2200)
  ;;                       ('there-exists #X2203)
  ;;                       ('element-of #X2208)
  ;;                       ;; mathematical operators
  ;;                       ('square-root #X221A)
  ;;                       ('squared #X00B2)
  ;;                       ('cubed #X00B3)
  ;;                       ;; letters
  ;;                       ('lambda #X03BB)
  ;;                       ('alpha #X03B1)
  ;;                       ('beta #X03B2)
  ;;                       ('gamma #X03B3)
  ;;                       ('delta #X03B4))))
                        
 
