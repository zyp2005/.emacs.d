;;; core-init -- 配置文件的开始
;;; Commentary:
;;; Code:
(use-package undo-tree
  :init (global-undo-tree-mode))

(use-package good-scroll
  :init (good-scroll-mode))

(use-package doom-themes
  :init (load-theme 'doom-gruvbox-material t))

(use-package color-theme-approximate
  :config (color-theme-approximate-on))

(use-package doom-modeline
  :init
  (doom-modeline-mode 1)
  (setq doom-modeline-bar-width 8))

(use-package which-key
  :config
    ;; Allow C-h to trigger which-key before it is done automatically
    (setq which-key-show-early-on-C-h t)
    ;; make sure which-key doesn't show normally but refreshes quickly after it is
    ;; triggered.
    (setq which-key-idle-delay 1)
    (setq which-key-idle-secondary-delay 0.05)
    (which-key-mode))



(provide 'module-ui)
