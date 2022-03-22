;;; core-init -- 配置文件的开始
;;; Commentary:
;;; Code:
(use-package ivy
  :config                            ; 在加载插件后执行一些命令
  (ivy-mode 1)                       ; 加载后启动 ivy-mode
  (setq ivy-use-virtual-buffers t)   ; 一些官网提供的固定配置
  (setq ivy-count-format "(%d/%d) "))

(use-package flycheck
  :hook                        ; 为模式设置 hook
  (prog-mode . flycheck-mode))

(use-package amx
  :init (amx-mode))

(use-package ace-window
  :bind (("C-x o" . 'ace-window)))

(use-package treemacs)


(provide 'module-tool)
