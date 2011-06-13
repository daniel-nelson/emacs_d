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

(require 'pbcopy)
(turn-on-pbcopy)

;; feature-mode for cucumber
(add-to-list 'load-path (concat dotfiles-dir "dnelson/feature-mode"))
;; and load it
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))


;; word-counting function from http://www.neverfriday.com/sweetfriday/2008/06/emacs-tip-word-counting-with-a.html
(defun count-words ()
  (interactive)
  (message "Word count: %s" (how-many "\\w+" (point-min) (point-max))))

(setq auto-mode-alist
      (append
       '(("\\.haml\\'" . haml-mode))
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))
