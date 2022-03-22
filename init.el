;;; core-init -- 配置文件的开始
;;; Commentary:
;;; Code:
(let ((minver "25.1"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "26.1")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

(add-to-list 'load-path "~/.emacs.d/lisp/core/") ; 设定源码加载路径
(require 'core-init) ;; emacs配置的开始
(provide 'init)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(restart-emacs which-key use-package undo-tree powerline mwim lua-mode lsp-ui lsp-treemacs lsp-ivy gruvbox-theme good-scroll general flycheck ewal-doom-themes evil doom-modeline company-quickhelp color-theme-approximate amx)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
