(require 'auto-complete)
(require 'auto-complete-config)

(global-auto-complete-mode t)
(global ac-complete-mode-map "/M-TAB" 'ac-next)

(define-key ac-complete-mode-map "/C-n" 'ac-next)
(define-key ac-complete-mode-map "/C-p" 'ac-previous)
