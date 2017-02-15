;;window move key
(global-set-key (kbd "C-<left>") 'windmove-left)
(global-set-key (kbd "C-<down>") 'windmove-down)
(global-set-key (kbd "C-<up>") 'windmove-up)
(global-set-key (kbd "C-<right>") 'windmove-right)

;;undo-tree key
(global-set-key (kbd "M-/") 'undo-tree-redo)

;;yes or no is y or n
(fset 'yes-or-no-p 'y-or-n-p)

recentf-open-files key
(global-set-key (kbd "C-c o") 'recentf-open-files)
