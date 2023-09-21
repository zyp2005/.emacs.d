;;; core-option -- 基础设定
;;; Commentary:
;;; Code:
(defconst *spell-check-support-enabled* nil) ;; 如果您愿意，请使用 t 启用
(defconst *is-a-mac* (eq system-type 'darwin))

;; 在启动期间和之后调整垃圾收集阈值

(let ((init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold most-positive-fixnum)
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold (* 128 1024 1024)))))

(defvar k-gc-timer
  (run-with-idle-timer 15 t
                       'garbage-collect))
(defmacro k-time (&rest body)
  "Measure and return the time it takes evaluating BODY."
  `(let ((time (current-time)))
     ,@body
     (float-time (time-since time))))
(defvar k-gc-timer
  (run-with-idle-timer 15 t
                       (lambda ()
                         (message "Garbage Collector has run for %.06fsec"
                                  (k-time (garbage-collect))))))

;(electric-pair-mode t)                       ; 自动补全括号
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
(setq-default default-tab-width 4)
(setq tab-width 4)
(setq-default c-basic-offset 4)
(global-hl-line-mode 1)
(setq-default  tab-width 4) ;; 表示一个 tab 4个字符宽
(setq-default indent-tabs-mode nil) ;; nil 表示将 tab 替换成空格
(savehist-mode 1)                            ; （可选）打开 Buffer 历史记录保存
(display-line-numbers-mode)
(setq-default display-line-numbers-type 'relative)   ; （可选）显示相对行号
(add-to-list 'default-frame-alist '(width . 90))  ; （可选）设定启动图形界面时的初始 Frame 宽度（字符数）
(add-to-list 'default-frame-alist '(height . 55)) ; （可选）设定启动图形界面时的初始 Frame 高度（字符数）


;;cc-mode
(c-add-style "microsoft"
	    '("stroustrup"
		(c-offsets-alist
		(access-label . /)
		(innamespace . -)
		(inline-open . 0)
		(inher-cont . c-lineup-multi-inher)
		(arglist-cont-nonempty . +)
		(template-args-cont . +)
		(block-close . 0)
		(substatement . 0))))
(setq c-default-style "microsoft")
;; 字体
(set-face-attribute 'default nil :font (font-spec :family "Source Code Pro" :size 28))


(provide 'core-option)

;;; core-option.el ends here

