;; elispディレクトリの読み込み設定をしてない場合は下記を記述
(add-to-list 'load-path "~/.emacs.d/elisp")
 
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits/")

;;package
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-rep.org/packages/"))


;;auto-install
(require 'auto-install)
(auto-install-compatibility-setup)

;;mozc
(require 'mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")

;;theme 
(load-theme 'twilight t)

;; not make backup-file
(setq make-backup-files nil)

;; remove autosave
(setq delete-auto-save-files t)

;;view space and tab
;(global-whitespace-mode 1)
