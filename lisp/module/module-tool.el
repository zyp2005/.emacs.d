;;; core-init -- 配置文件的开始
;;; Commentary:
;;; Code:
;(use-package ivy
;  :config                            ; 在加载插件后执行一些命令
;  (ivy-mode 1)                       ; 加载后启动 ivy-mode
;  (setq ivy-use-virtual-buffers t)   ; 一些官网提供的固定配置
;  (setq ivy-count-format "(%d/%d) "))

(use-package helm
  :config
    (global-set-key (kbd "M-x") #'helm-M-x)
    (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
    (global-set-key (kbd "C-x C-f") #'helm-find-files)
    (helm-mode 1)
    (helm-autoresize-mode t))

(use-package flycheck
  :hook                        ; 为模式设置 hook
  (prog-mode . flycheck-mode))

;(use-package amx
;  :init (amx-mode))

(use-package ace-window
  :bind (("C-x o" . 'ace-window)))

(use-package go-translate
  :init
  (setq gts-translate-list '(("en" "zh")))
  (setq gts-default-translator
	(gts-translator
	 :picker (gts-prompt-picker)
	 :engines (list (gts-bing-engine))
	 :rendwe (gts-buffer-render)
	 :splitter (gts-paragraph-splitter))))


(use-package treemacs)


(provide 'module-tool)
