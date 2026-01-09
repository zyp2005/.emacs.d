;;; core-init -- 配置文件的开始
;;; Commentary:
;;; Code:
(use-package quickrun
  :ensure t
  :commands (quickrun)
  :init
  (quickrun-add-command "c"
    '((:command . "gcc")
      (:exec . ("%c  %o -o %e %s"
		"%e %a"))
      (:remove . ("%e")))
    :default "c++"))

;;; 对verilog的支持
(use-package verilog-mode)


 ;; (set-face-attribute 'verilog-ts-font-lock-grouping-keywords-face nil :foreground "#8ec07c")  ;; 绿色 - 深橄榄绿
 ;; (set-face-attribute 'verilog-ts-font-lock-punctuation-face nil       :foreground "#d79921")  ;; 橙色 - 金色
 ;; (set-face-attribute 'verilog-ts-font-lock-operator-face nil          :foreground "#d79921" :weight 'extra-bold)  ;; 橙色 - 金色
 ;; (set-face-attribute 'verilog-ts-font-lock-brackets-face nil          :foreground "#d79921")  ;; 橙色 - 金色
 ;; (set-face-attribute 'verilog-ts-font-lock-parenthesis-face nil       :foreground "#b57614")  ;; 深橙色 - 深金色
 ;; (set-face-attribute 'verilog-ts-font-lock-curly-braces-face nil      :foreground "#b57614")  ;; 深橙色 - 深金色
 ;; (set-face-attribute 'verilog-ts-font-lock-port-connection-face nil   :foreground "#fb4934")  ;; 红色 - 鲜红色
 ;; (set-face-attribute 'verilog-ts-font-lock-dot-name-face nil          :foreground "#a89984")  ;; 灰色 - 浅灰色
 ;; (set-face-attribute 'verilog-ts-font-lock-brackets-content-face nil  :foreground "#b8bb26")  ;; 绿色 - 黄绿色
 ;; (set-face-attribute 'verilog-ts-font-lock-width-num-face nil         :foreground "#b8bb26")  ;; 绿色 - 黄绿色
 ;; (set-face-attribute 'verilog-ts-font-lock-width-type-face nil        :foreground "#8ec07c" :weight 'bold)  ;; 绿色 - 深橄榄绿（加粗）
 ;; (set-face-attribute 'verilog-ts-font-lock-module-face nil            :foreground "#83a598")  ;; 绿色 - 绿松石色
 ;; (set-face-attribute 'verilog-ts-font-lock-instance-face nil          :foreground "#8ec07c")  ;; 绿色 - 深橄榄绿
 ;; (set-face-attribute 'verilog-ts-font-lock-time-event-face nil        :foreground "#83a598" :weight 'bold)  ;; 绿色 - 绿松石色（加粗）
 ;; (set-face-attribute 'verilog-ts-font-lock-time-unit-face nil         :foreground "#d7afaf")  ;; 浅灰色 - 米色
 ;; (set-face-attribute 'verilog-ts-font-lock-preprocessor-face nil      :foreground "#d7afaf")  ;; 浅灰色 - 米色
 ;; (set-face-attribute 'verilog-ts-font-lock-modport-face nil           :foreground "#83a598")  ;; 绿色 - 绿松石色
 ;; (set-face-attribute 'verilog-ts-font-lock-direction-face nil         :foreground "#d3869b")  ;; 粉红色 - 淡玫瑰色
 ;; (set-face-attribute 'verilog-ts-font-lock-translate-off-face nil     :background "#282828" :slant 'italic)  ;; 背景深灰色
 ;; (set-face-attribute 'verilog-ts-font-lock-attribute-face nil         :foreground "#fe8019")  ;; 橙色 - 橙色



(provide 'module-lang)
