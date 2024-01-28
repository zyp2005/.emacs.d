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



(provide 'module-lang)
