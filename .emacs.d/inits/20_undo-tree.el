;; undo-tree.el configuration
(require 'undo-tree)
;; auto start undo-tree
(global-undo-tree-mode t)
;; key configuration
(global-set-key (kbd "M-/") 'undo-tree-redo)
