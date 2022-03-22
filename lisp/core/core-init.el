;;; core-init -- 配置文件的开始
;;; Commentary:
;;; Code:
(defun open-init-file()
  "快速打开配置文件."
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun load-core()
    (add-to-list 'load-path "~/.emacs.d/lisp/keymap")
    (add-to-list 'load-path "~/.emacs.d/lisp/module")
    (add-to-list 'load-path "~/.emacs.d/lisp/")
    (require 'core-pack)
    (require 'core-option)
    (require 'core-mapping)
    (require 'keymap-init)
    (require 'module-init)
    (require 'hello)
)

(load-core)

(provide 'core-init)

;;; core-init.el ends here
