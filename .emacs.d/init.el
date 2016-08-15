;;package
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

;;auto-install
(require 'auto-install)
(auto-install-compatibility-setup)

;;theme 
(load-theme 'twilight t)
