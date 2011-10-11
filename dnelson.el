(set-face-background 'vertical-border "blue")
(set-face-foreground 'vertical-border "black")

(set-face-background 'modeline "blue")
(set-face-foreground 'modeline "black")

;; the following successfully replaced grep with ack in rgrep, but fails with
;; find-grep-dired
;;(custom-set-variables '(grep-program "ack -H -a --nogroup"))
(setq-default ispell-program-name "aspell")
(remove-hook 'text-mode-hook 'turn-on-auto-fill)

(set-keyboard-coding-system nil)

;;colorize comment text
(set-face-foreground 'font-lock-comment-face "red")
;;colorize comment delimiter
(set-face-foreground 'font-lock-comment-delimiter-face "red")


;;avoid error when first opening Ruby files
(require 'tramp-cmds)


(setq keybindings-file (concat dotfiles-dir "keybindings.el"))
(load keybindings-file 'noerror)

(require 'modeline-posn)
(add-hook 'emacs-lisp-mode-hook (lambda () (setq modelinepos-column-limit 120)))
(add-hook 'ruby-mode-hook (lambda () (setq modelinepos-column-limit 80)))
(add-hook 'feature-mode-hook (lambda () (setq modelinepos-column-limit 300)))
(add-hook 'haml-mode-hook (lambda () (setq modelinepos-column-limit 300)))

;; when on OSX
(require 'pbcopy)
(turn-on-pbcopy)
;; when on Ubuntu
;; (require 'xclip)
;; (turn-on-xclip)

;; feature-mode for cucumber
(add-to-list 'load-path (concat dotfiles-dir "dnelson/feature-mode"))
;; and load it
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

(defun toggle-beginning-end-of-buffer ()
  "If at the first line, move point to last line; otherwise, move point to first line."
  (interactive)
  (if (eq 0 (count-lines 1 (point)))
    (end-of-buffer)
    (beginning-of-buffer)))

;; word-counting function from http://www.neverfriday.com/sweetfriday/2008/06/emacs-tip-word-counting-with-a.html
(defun count-words ()
  (interactive)
  (message "Word count: %s" (how-many "\\w+" (point-min) (point-max))))

(setq auto-mode-alist
      (append
       '(("\\.haml\\'" . haml-mode))
       '(("\\.js\\'" . js2-mode))
       '(("\\.js.erb\\'" . js2-mode))
       '(("\\.scss\\'" . css-mode))
       auto-mode-alist))

(add-hook 'css-mode-hook 'modal-cmd-mode)
(add-hook 'feature-mode-hook 'modal-cmd-mode)
(add-hook 'haml-mode-hook 'modal-cmd-mode)
(add-hook 'html-mode-hook 'modal-cmd-mode)
(add-hook 'js2-mode-hook 'modal-cmd-mode)
(add-hook 'lisp-mode-hook 'modal-cmd-mode)
(add-hook 'ruby-mode-hook 'modal-cmd-mode)
(add-hook 'text-mode-hook 'modal-cmd-mode)
(add-hook 'yaml-mode-hook 'modal-cmd-mode)

;;; Modal-mode setup
;;;
(require 'modal-mode)
(setq default-major-mode 'modal-fundamental-mode)
(modal-mode 1)
(when window-system
  (modal-mode-line-background-mode 1))
;;;
;;; end modal-mode setup
