;; (require 'org-latex)
;; (unless (boundp 'org-export-latex-classes)
;;   (setq org-export-latex-classes nil))
;; (add-to-list 'org-export-latex-classes
;;              '("article"
;;                "\\documentclass{article}
;; \\usepackage{polyglossia} \\setmainlanguage{russian} \\setotherlanguage{english} \\newfontfamily \\russianfont[Script=Cyrillic]{Hoefler Text}
;; %\\usepackage{fixltx2e}
;; %\\usepackage{graphicx}
;; %\\usepackage{longtable}
;; \\usepackage{float}
;; \\usepackage{wrapfig}
;; \\usepackage{soul}
;; \\usepackage{textcomp}
;; \\usepackage{marvosym}
;; \\usepackage{wasysym}
;; \\usepackage{latexsym}
;; \\usepackage{amssymb}
;; \\usepackage{hyperref}
;; \\tolerance=1000

;;             [NO-DEFAULT-PACKAGES]
;;             [NO-PACKAGES]"
;; 	       ("\\section{%s}" . "\\section*{%s}")))

;; (setq org-latex-to-pdf-process (list "latexmk -pdflatex=xelatex -pdf -quiet %f"))
