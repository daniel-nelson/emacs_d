;;Enable use of control key sequence instead of alt key
;;because the alt key is awkward to reach.
;;Also, I don't use emacs for e-mail, so make control-x m
;;act as the modifier sequence, rather than e-mail.
(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-x m") 'execute-extended-command)
(global-set-key (kbd "C-c C-m") 'execute-extended-command)
(global-set-key (kbd "C-c m") 'execute-extended-command)

(global-set-key (kbd "C-x z") 'undo)
(global-set-key (kbd "C-z") 'undo)

(global-set-key (kbd "C-t") 'beginning-of-buffer)
(global-set-key (kbd "C-x t") 'end-of-buffer)

(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c C-k") 'kill-region)

;;Make window navigation similar to screen (because 'n' is easier to
;;reach than 'o') and I never use set-goal-column
(global-set-key (kbd "C-x C-n") 'other-window)
;;(global-set-key "\C-x n" 'other-window) C-x n always waits for
;;further input
(global-set-key (kbd "C-x C-o") 'other-window)

;; thanks to http://nex-3.com/posts/45-efficient-window-switching-in-emacs
(defun select-previous-window ()
  "Switch to the previous window" 
  (interactive)
  (select-window (previous-window)))
(global-set-key (kbd "C-x p") 'select-previous-window)
(global-set-key (kbd "C-x C-p") 'select-previous-window)



;; shift-space was bound to something I never used, so often, when
;; typing, I would throw a Lisp error because I was still holding down
;; shift when I pressed the space bar
(global-set-key (kbd "S-SPC") " ")

;; Align your code in a pretty way.
(global-set-key (kbd "C-x \\") 'align-regexp)

;; Use regex searches by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
;;(global-set-key (kbd "M-s") 'isearch-forward-regexp)
;;(global-set-key (kbd "M-r") 'isearch-backward-regexp)
;;(global-set-key (kbd "C-q") 'query-replace)

;;C-i is by default bound to lisp-indent-line, which
;;is already bound to TAB, so make C-i indent-relative
;;Binding control-i apparently binds TAB as well, so
;;dont change control-i
;;(global-set-key (kbd "C-i") 'indent-relative)

(global-set-key "\C- " 'modal-cmd-mode)

;; modal mode makes \C-y \M-y mess up sometimes. start using modal mode
;; convention for yanking
(global-set-key (kbd "C-p") 'yank)
(global-set-key (kbd "M-p") 'yank-pop)
(global-set-key (kbd "C-y") 'modal-1off-copy-mode-enable)

;;assign macro execution to F5 key
;; (global-set-key [f5] 'call-last-kbd-macro)

;;activate Emacs Code Browser with F4
(global-set-key [f4] 'ecb-activate)
;;deactivate Emacs Code Browser with shift F4
(global-set-key [S-f4] 'ecb-deactivate)

(global-set-key (kbd "C-z") 'zencoding-expand-line)
