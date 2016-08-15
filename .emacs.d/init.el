;Emacs configuration file
;created by Takashi Higasa


(add-to-list 'load-path "~/.emacs.d/elisp")
(prefer-coding-system 'utf-8)

(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

;;行番号を表示
(global-linum-mode t)

;;タイトルバーにフルパスを表示
(setq frame-title-format
	  (format "%%f - Emacs@%s" (system-name)))

;;メニューバー，タイトルバーを非表示
(menu-bar-mode 0)
(tool-bar-mode 0)

;;TABの表示幅を4に設定
(setq-default tab-width 4)

;; 起動時のメッセージを表示しない
(setq inhibit-startup-message t)

;;カッコを対応させる
(show-paren-mode t)

;;バックアップを残さない
(setq make-backup-files nil)

;;モードラインに割合表示を総行数表示
(defvar my-lines-page-mode t)
(defvar my-mode-line-format)
(when my-lines-page-mode
  (setq my-mode-line-format "%d")
  (if size-indication-mode
      (setq my-mode-line-format (concat my-mode-line-format " of %%I")))
  (cond ((and (eq line-number-mode t) (eq column-number-mode t))
         (setq my-mode-line-format (concat my-mode-line-format " (%%l,%%c)")))
        ((eq line-number-mode t)
         (setq my-mode-line-format (concat my-mode-line-format " L%%l")))
        ((eq column-number-mode t)
         (setq my-mode-line-format (concat my-mode-line-format " C%%c"))))

  (setq mode-line-position
        '(:eval (format my-mode-line-format
                        (count-lines (point-max) (point-min))))))

;;mozc
(require 'mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")

;;theme
(deftheme twilight
  "Twilight color theme")

(custom-theme-set-faces
 'twilight
 '(default ((t (:background "#141414" :foreground "#f8f8f8"))))
 '(cursor ((t (:foreground "#a7a7a7"))))
 '(region ((t (:background "#27292a"))))
 '(blue ((t (:foreground "blue"))))
 '(border-glyph ((t (nil))))
 '(buffers-tab ((t (:background "#141414" :foreground "#CACACA"))))
 '(font-lock-builtin-face ((t (:foreground "#CACACA"))))
 '(font-lock-comment-face ((t (:foreground "#5F5A60"))))
 '(font-lock-constant-face ((t (:foreground "#CF6A4C"))))
 '(font-lock-doc-string-face ((t (:foreground "DarkOrange"))))
 '(font-lock-function-name-face ((t (:foreground "#9B703F"))))
 '(font-lock-keyword-face ((t (:foreground "#CDA869"))))
 '(font-lock-preprocessor-face ((t (:foreground "Aquamarine"))))
 '(font-lock-reference-face ((t (:foreground "SlateBlue"))))
 '(font-lock-regexp-grouping-backslash ((t (:foreground "#E9C062"))))
 '(font-lock-regexp-grouping-construct ((t (:foreground "red"))))
 '(minibuffer-prompt ((t (:foreground "#5F5A60"))))
 '(ido-subdir ((t (:foreground "#CF6A4C"))))
 '(ido-first-match ((t (:foreground "#8F9D6A"))))
 '(ido-only-match ((t (:foreground "#8F9D6A"))))
 '(mumamo-background-chunk-submode ((t (:background "#222222")))) 
 '(font-lock-string-face ((t (:foreground "#8F9D6A"))))
 '(font-lock-type-face ((t (:foreground "#9B703F"))))
 '(font-lock-variable-name-face ((t (:foreground "#7587A6"))))
 '(font-lock-warning-face ((t (:background "#EE799F" :foreground "red"))))
 '(gui-element ((t (:background "#D4D0C8" :foreground "black"))))
 '(region ((t (:background "#27292A"))))
 '(mode-line ((t (:background "grey75" :foreground "black"))))
 '(highlight ((t (:background "#111111"))))
 '(highline-face ((t (:background "SeaGreen"))))
 '(left-margin ((t (nil))))
 '(text-cursor ((t (:background "yellow" :foreground "black"))))
 '(toolbar ((t (nil))))
 '(underline ((nil (:underline nil))))
 '(zmacs-region ((t (:background "snow" :foreground "blue")))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'twilight)


;; AutoInstall
(when (require 'auto-install nil t)
  (setq auto-install-directory "~/.emacs.d/elisp/")
  (auto-install-update-emacswiki-package-name t)
  (auto-install-compatibility-setup))


;;auto-complete
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories
    "~/.emacs.d/elisp/ac-dict")
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default))
