;;; core-init -- 配置文件的开始
;;; Commentary:
;;; Code:
(provide 'module-editor)

(use-package autopair
  :config (autopair-global-mode)
 )

;(use-package lsp-bridge
;  :straight (lsp-bridge :type git
;			:host github
;			:repo "manateelazycat/lsp-bridge"
;			)
;  :load-path "~/.emacs.d/straight/repos/lsp-bridge/"
;  :config (global-lsp-bridge-mode))
