(set-face-background 'vertical-border "blue")
(set-face-foreground 'vertical-border "black")

(set-face-background 'modeline "blue")
(set-face-foreground 'modeline "black")

;; when on white background
;; (set-face-background 'vertical-border "black")
;; (set-face-foreground 'vertical-border "white")

;; (set-face-background 'modeline "black")
;; (set-face-foreground 'modeline "white")

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
       '(("\\.coffee.erb\\'" . coffee-mode))
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
(add-hook 'coffee-mode-hook 'modal-cmd-mode)
(add-hook 'occur-mode-hook 'modal-cmd-mode)

;;; Modal-mode setup
;;;
(require 'modal-mode)
(setq default-major-mode 'modal-fundamental-mode)
(modal-mode 1)
(when window-system
  (modal-mode-line-background-mode 1))
;;;
;;; end modal-mode setup

(defun coffee-custom ()
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 2))

(setq tab-width 2)

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))





;;;;;;;;;; search open buffers for a string ;;;;;;;;;;

(defcustom search-all-buffers-ignored-files (list (rx-to-string '(and bos (or ".bash_history" "TAGS") eos)))
  "Files to ignore when searching buffers via \\[search-all-buffers]."
  :type 'editable-list)

(require 'grep)
(defun search-all-buffers (regexp prefix)
  "Searches file-visiting buffers for occurence of REGEXP.  With
prefix > 1 (i.e., if you type C-u \\[search-all-buffers]),
searches all buffers."
  (interactive (list (grep-read-regexp)
                     current-prefix-arg))
  (message "Regexp is %s; prefix is %s" regexp prefix)
  (multi-occur
   (if (member prefix '(4 (4)))
       (buffer-list)
     (remove-if
      (lambda (b) (some (lambda (rx) (string-match rx  (file-name-nondirectory (buffer-file-name b)))) search-all-buffers-ignored-files))
      (remove-if-not 'buffer-file-name (buffer-list))))

   regexp))

;;;;;;;;;; search open buffers for a string ;;;;;;;;;;

(add-hook 'sgml-mode-hook 'zencoding-mode)
(require 'zencoding-mode)
