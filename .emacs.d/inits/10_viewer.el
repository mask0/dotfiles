;;not view start-up
(setq inhibit-startup-message t)

;; delete menu-bar and tool-bar
(menu-bar-mode -1)
(tool-bar-mode -1)

;; view column-number and line-number
(column-number-mode t)
(global-linum-mode t)

;; hi-light cursor-line and brackets
(global-hl-line-mode t)
(show-paren-mode 1)

;; font size
(set-frame-font "ricty-14")
