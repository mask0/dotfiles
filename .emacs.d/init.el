;; elispディレクトリの読み込み設定をしてない場合は下記を記述
(add-to-list 'load-path "~/.emacs.d/elisp")
 
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits/")

;;package
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-rep.org/packages/"))

;;theme 
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(setq molokai-theme-kit t)
(load-theme 'molokai t)

;;auto-install
(require 'auto-install)
(auto-install-compatibility-setup)

;;mozc
(require 'mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")

;; not make backup-file
(setq make-backup-files nil)

;; remove autosave
(setq delete-auto-save-files t)

;;view space and tab
;(global-whitespace-mode 1)
