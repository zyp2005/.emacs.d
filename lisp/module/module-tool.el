;;; core-init -- 配置文件的开始
;;; Commentary:
;;; Code:
;(use-package ivy
;  :config                            ; 在加载插件后执行一些命令
;  (ivy-mode 1)                       ; 加载后启动 ivy-mode
;  (setq ivy-use-virtual-buffers t)   ; 一些官网提供的固定配置
;  (setq ivy-count-format "(%d/%d) "))
;
;(use-package helm
;  :config
;    (global-set-key (kbd "M-x") #'helm-M-x)
;    (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
;    (global-set-key (kbd "C-x C-f") #'helm-find-files)
;    (helm-mode 1)
;    (helm-autoresize-mode t)
;    (setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x
;    (helm-ff-icon-mode t)
;    )



(use-package vertico
  :init
  (vertico-mode)
  (setq read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t
      completion-ignore-case t)
  ;vertico-multiform-mode 可设置各模式的显示方式
    )



;(use-package lsp-bridge
;  :straight (lsp-bridge :type git
;			:host github
;			:repo "manateelazycat/lsp-bridge"
;			)
;  :load-path "~/.emacs.d/straight/repos/lsp-bridge/"
;  :config (global-lsp-bridge-mode))

(use-package marginalia
  :init
    (marginalia-mode))

(use-package orderless
  :ensure t
  :config
    (orderless-define-completion-style orderless+initialism
    (orderless-matching-styles '(orderless-initialise
				orderless-literal
				orderless-regexp)))
    (setq completion-category-overrides
	'((command (styles orderless+initialism))
	    (symbol (styles orderless+initialism))
	    (variable (styles orderless+initialism))))
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

;(use-package el-patch
;  :straight (el-patch :type git :host github :repo "raxod502/el-patch"
;                      :fork (:host github
;                             :repo "your-name/el-patch")))

(use-package all-the-icons)

(use-package flycheck
  :hook                        ; 为模式设置 hook
  (prog-mode . flycheck-mode))

;(use-package amx
;  :init (amx-mode))

(use-package ace-window
  :bind (("C-x o" . 'ace-window)))

;(use-package go-translate
;  :init
;  (setq gts-translate-list '(("en" "zh")))
;  (setq gts-default-translator
;	(gts-translator
;	 :picker (gts-prompt-picker)
;	 :engines (list (gts-bing-engine))
;	 :rendwe (gts-buffer-render)
;	 :splitter (gts-paragraph-splitter))))


(use-package treemacs)

(use-package dashboard
   :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "A NWE DAY,ZYP!")
  (setq dashboard-icon-type 'all-the-icons)
  (setq dashboard-set-file-icons t))

(provide 'module-tool)
