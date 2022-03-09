;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

(let ((minver "25.1"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "26.1")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory)) ; 设定源码加载路径
; (require 'init-benchmarking) ;; 测量启动时间
(require 'hello) ;; emacs配置的开始

(defconst *spell-check-support-enabled* nil) ;; 如果您愿意，请使用 t 启用
(defconst *is-a-mac* (eq system-type 'darwin))

;; 在启动期间和之后调整垃圾收集阈值

(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

(electric-pair-mode t)                       ; 自动补全括号
(add-hook 'prog-mode-hook #'show-paren-mode) ; 编程模式下，光标在括号上时高亮另一个括号
(column-number-mode t)                       ; 在 Mode line 上显示列号
(global-auto-revert-mode t)                  ; 当另一程序修改了文件时，让 Emacs 及时刷新 Buffer
; (delete-selection-mode t)                    ; 选中文本后输入文本会替换文本（更符合我们习惯了的其它编辑器的逻辑）
(setq inhibit-startup-message t)             ; 关闭启动 Emacs 时的欢迎界面
(setq make-backup-files nil)                 ; 关闭文件自动备份
(add-hook 'prog-mode-hook #'hs-minor-mode)   ; 编程模式下，可以折叠代码块
(global-display-line-numbers-mode 1)         ; 在 Window 显示行号
(tool-bar-mode -2)                           ; 关闭 Tool bar
(when (display-graphic-p) (toggle-scroll-bar -1)) ; 图形界面时关闭滚动条
(setq-default indent-tabs-mode t)
(setq default-tab-width 4)
(setq tab-width 4)
(setq c-basic-offset 4)

(savehist-mode 1)                            ; （可选）打开 Buffer 历史记录保存
(setq display-line-numbers-type 'relative)   ; （可选）显示相对行号
(add-to-list 'default-frame-alist '(width . 90))  ; （可选）设定启动图形界面时的初始 Frame 宽度（字符数）
(add-to-list 'default-frame-alist '(height . 55)) ; （可选）设定启动图形界面时的初始 Frame 高度（字符数）

(global-set-key (kbd "RET") 'newline-and-indent)

(global-set-key (kbd "M-w") 'kill-region)              ; 交换 M-w 和 C-w，M-w 为剪切
(global-set-key (kbd "C-w") 'kill-ring-save)           ; 交换 M-w 和 C-w，C-w 为复制
(global-set-key (kbd "C-a") 'back-to-indentation)      ; 交换 C-a 和 M-m，C-a 为到缩进后的行首
(global-set-key (kbd "M-m") 'move-beginning-of-line)   ; 交换 C-a 和 M-m，M-m 为到真正的行首
(global-set-key (kbd "C-c '") 'comment-or-uncomment-region) ; 为选中的代码加注释/去注释

(global-set-key (kbd "C-j") nil)
;; 删去光标所在行（在图形界面时可以用 "C-S-<DEL>"，终端常会拦截这个按法)
(global-set-key (kbd "C-j C-k") 'kill-whole-line)


;; 自定义两个函数
;; Faster move cursor
(defun next-ten-lines()
  "Move cursor to next 10 lines."
  (interactive)
  (next-line 10))

(defun previous-ten-lines()
  "Move cursor to previous 10 lines."
  (interactive)
  (previous-line 10))
;; 绑定到快捷键
(global-set-key (kbd "M-n") 'next-ten-lines)            ; 光标向下移动 10 行
(global-set-key (kbd "M-p") 'previous-ten-lines)        ; 光标向上移动 10 行

(setq package-archives '(("gnu" . "https://elpa.zilongshanren.com/gnu")
                         ("melpa" . "https://elpa.zilongshanren.com/melpa/")
                         ("melpa-stable" . "https://elpa.zilongshanren.com/melpa-stable/")
                         ("org" . "https://elpa.zilongshanren.com/org/")))

(setq package-check-signature nil)
(require 'package)
(unless (bound-and-true-p package--initialized)
    (package-initialize))
(unless package-archive-contents
    (package-refresh-contents))
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))
(setq use-package-always-ensure t
        ; use-package-always-defer t
        use-package-always-demand nil
        use-package-expand-minimally t
        use-package-verbose t)

;; 字体
(set-face-attribute 'default nil :font (font-spec :family "Source Code Pro" :size 19))


(require 'use-package)

(use-package evil
  :init
  (evil-mode t)
  :config
  (evil-set-leader nil (kbd "C-SPC"))
  (evil-set-leader 'normal (kbd "SPC"))
  (evil-define-key 'normal 'global (kbd ";") 'evil-ex)
  ;; Searching
  )

(use-package powerline
  :config
  (powerline-center-evil-theme)
  (display-time-mode t))

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

(use-package mwim
  :bind
  ("C-a" . mwim-beginning-of-code-or-line)
  ("C-e" . mwim-end-of-code-or-line))

(use-package undo-tree
  :init (global-undo-tree-mode))

(use-package good-scroll
  :init (good-scroll-mode))

(use-package gruvbox-theme
  :init (load-theme 'gruvbox-dark-medium t))

(use-package color-theme-approximate
  :config (color-theme-approximate-on))

(use-package company
    :init
    (setq company-minimum-prefix-length 1
      company-idle-delay 0.0) ;; default is 0.2)
    (setq company-require-match nil) ; allow input string that do not match candidate words
    (setq company-tooltip-maximum-width 60)
    :config
    (global-company-mode))
    ;; (company-tng-configure-default)

(use-package company-quickhelp
:hook ((company-mode . company-quickhelp-mode)))

(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
    (setq lsp-keymap-prefix "C-c l")
    (setq read-process-output-max (* 1024 1024)) ;; 1mb
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (c-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration)
         (lsp-mode . lsp-ui-mode))
  :commands lsp)

;; optionally
(use-package lsp-ui
  :commands lsp-ui-mode
  :init
  (setq	lsp-ui-sideline-update-mode "line"
	lsp-ui-sideline-show-code-actions t
	lsp-ui-sideline-show-hover nil
	lsp-ui-sideline-show-diagnostics t
	lsp-ui-sideline-show-symbol t)
  :config
  (lsp-ui-mode))

(use-package treemacs)

;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)


(provide 'init)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("7661b762556018a44a29477b84757994d8386d6edee909409fabe0631952dad9" "83e0376b5df8d6a3fbdfffb9fb0e8cf41a11799d9471293a810deb7586c131e6" "b73a23e836b3122637563ad37ae8c7533121c2ac2c8f7c87b381dd7322714cd0" "c4063322b5011829f7fdd7509979b5823e8eea2abf1fe5572ec4b7af1dd78519" "1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf" "835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" "9b4ae6aa7581d529e20e5e503208316c5ef4c7005be49fdb06e5d07160b67adc" "171d1ae90e46978eb9c342be6658d937a83aaa45997b1d7af7657546cae5985b" default))
 '(package-selected-packages
   '(one-themes zpl-mode meow sniem use-package undo-tree smart-mode-line restart-emacs mwim material-theme lsp-ui lsp-treemacs lsp-ivy helm-lsp gruvbox-theme good-scroll flycheck evil doom-themes company-quickhelp company-box atom-one-dark-theme atom-dark-theme amx)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
