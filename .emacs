(server-start)
(load "auctex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq outline-minor-mode-prefix 'o)
(setq TeX-PDF-mode t)

(defun turn-on-outline-minor-mode () (outline-minor-mode 1))
(add-hook 'LaTeX-mode-hook 'turn-on-outline-minor-mode) 
(setq outline-minor-mode-prefix "\C-c\C-o")


;; AucTex stuff
(add-hook 'LaTeX-mode-hook
   (lambda ()
     (LaTeX-add-environments
       '("lemma" LaTeX-env-label)
       '("definition" LaTeX-env-label)
       '("corollary" LaTeX-env-label)
       '("proposition" LaTeX-env-label)
       '("remark" LaTeX-env-label)
       '("conjecture" LaTeX-env-label)
       '("question" LaTeX-env-label)
       '("theorem" LaTeX-env-label))))





;; RefTex stuff
(require 'reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-reftex)   ; with Emacs latex mode
;;(setq reftex-label-alist
;;   '(("lemma"   ?l "lemma:"  "~\\ref{%s}" t ("lemma"   "lemma.") -4)
;;     ("theorem" ?h "thm:" "~\\ref{%s}" t   ("theorem" "thm.") -4)
;;     ("corollary" ?c "cor:" "~\\ref{%s}" t   ("corollary" "cor.") -4)
;;     ("definition" ?d "dfn:" "~\\ref{%s}" t   ("definition" "dfn.") -4)
;;     ("proposition" ?p "prop:" "~\\ref{%s}" t   ("proposition" "prop.") -4)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-source-correlate-method (quote synctex))
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t)
 '(TeX-view-program-list (quote (("Okular" "okular --unique %o#src:%n%b"))))
 '(TeX-view-program-selection (quote ((output-dvi "xdvi") (output-pdf "Okular") (output-html "xdg-open"))))
 '(inhibit-startup-screen t)
 '(reftex-label-alist (quote (("test" 113 "test:" "~\\ref{%s}" t nil) ("lemma" 108 "lemma:" "~\\ref{%s}" t ("lemma" "lemma.") -4) ("theorem" 104 "thm:" "~\\ref{%s}" t ("theorem" "thm.") -4) ("corollary" 99 "cor:" "~\\ref{%s}" t ("corollary" "cor.") -4) ("definition" 100 "dfn:" "~\\ref{%s}" t ("definition" "dfn.") -4) ("proposition" 112 "prop:" "~\\ref{%s}" t ("proposition" "prop.") -4) ("conjecture" 67 "conj:" "~\\ref{%s}" t ("conjecture") -4) ("question" 121 "quest:" "~\\ref{%s}" t ("question") -4) ("remark" 114 "rmk:" "~\\ref{%s}" t ("remark")))))
 '(same-window-regexps (quote ("[*]Buffer List"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Macaulay 2 start
(load "~/.emacs-Macaulay2" t)
;; Macaulay 2 end


(add-to-list 'auto-mode-alist '("\\.sage\\'" . python-mode))

;; for secure CRT 
(global-set-key [(control h)] 'delete-backward-char)


;; for uninformative tex error messages
(setq LaTeX-command-style '(("" "%(PDF)%(latex) -file-line-error %S%(PDFout)")))

;; for Octave
(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))
(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))

;; turn off namespace indent in c++ mode
(defun my-c-setup ()
  (c-set-offset 'innamespace [0]))
(add-hook 'c++-mode-hook 'my-c-setup)


;; buffer stuff
(ido-mode 1)

