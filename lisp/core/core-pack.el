;;; core-pack -- package配置
;;; Commentary:
;;; Code:
(setq package-archives '(("gnu" . "https://mirrors.ustc.edu.cn/elpa/gnu/")
                         ("melpa" . "https://mirrors.ustc.edu.cn/elpa/melpa/")
                         ("melpa-stable" . "https://mirrors.ustc.edu.cn/elpa/melpa-stable/")
                         ("org" . "https://mirrors.ustc.edu.cn/elpa/org/")))


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
(require 'use-package)


(provide 'core-pack)

;;; core-pack.el ends here
