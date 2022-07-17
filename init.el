;;; core-init -- 配置文件的开始
;;; Commentary:
;;; Code:

(let ((minver "25.1"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "26.1")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

(add-to-list 'load-path "~/.emacs.d/lisp/core/") ; 设定源码加载路径
(add-to-list 'custom-theme-load-path "~/.emacs.d/theme")
(setq comp-speed 4)
(require 'core-init) ;; emacs配置的开始
;;(global-tree-sitter-mode)
;;(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(warning-suppress-types '((comp) (use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
