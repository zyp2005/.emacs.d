;;; core-mapconf -- 一个按键绑定多个函数
;;; Commentary:
;;; Code:
(defun my-window-right ()
  "在右面创建窗口."
  (interactive)
  (setq evil-vsplit-window-right t)
  (evil-window-vsplit))

(defun my-window-left ()
  "在左面创建窗口."
  (interactive)
  (setq evil-vsplit-window-right nil)
  (evil-window-vsplit))

(defun my-window-up ()
  "在上面创建窗口."
  (interactive)
  (setq evil-split-window-below nil)
  (evil-window-split))

(defun my-window-down ()
  "在下面创建窗口."
  (interactive)
  (setq evil-split-window-below t)
  (evil-window-split))

(provide 'core-mapconf)

;;; core-mapconf.el ends here
