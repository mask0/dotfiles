;;; Cask 設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'cask "~/.cask/cask.el")
(cask-initialize)


;;; init-loader 設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'init-loader)

(setq init-loader-show-log-after-init "error-only")
(init-loader-load "~/.emacs.d/inits")
