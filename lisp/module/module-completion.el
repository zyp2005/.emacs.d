;;; core-init -- 配置文件的开始
;;; Commentary:
;;; Code:
(use-package company
    :init
    (setq company-minimum-prefix-length 1
      company-idle-delay 0.0) ;; default is 0.2)
    (setq company-require-match nil) ; allow input string that do not match candidate words
    (setq company-tooltip-maximum-width 60);    :config
    (global-company-mode))
    ;(company-tng-configure-default)

(use-package eglot
  :config
  (add-to-list 'eglot-server-programs '((c++-mode c-mode c-ts-mode) "clangd"))
(add-hook 'c-mode-hook #'eglot-ensure)
(add-hook 'c-ts-mode-hook #'eglot-ensure)
(add-hook 'c++-mode-hook #'eglot-ensure)
)


(defun my-double (x)
  (* x 2))
(defun my-increase (x)
  (+ x 1))
(advice-add 'my-double :filter-return #'my-increase)
(my-double 2)

(use-package yasnippet
  :ensure t
  :hook ((prog-mode . yas-minor-mode)
	 (org-mode . yas-minor-mode))
  :init
  :config
  (progn
    (setq hippie-expand-try-functions-list
	  '(yas/hippie-try-expand
	    try-complete-file-name-partially
	    try-expand-all-abbrevs
	    try-expand-dabbrev
	    try-expand-dabbrev-all-buffers
	    try-expand-dabbrev-from-kill
	    try-complete-lisp-symbol-partially
	    try-complete-lisp-symbol))))

(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)

;(use-package company-quickhelp
;   :hook ((company-mode . company-quickhelp-mode)))

;(use-package yasnippet)


;(use-package markdown-mode
;  :ensure t)

;(use-package  posframe
;  :straight ( posframe :type git :host github :repo "tumashu/posframe"))

;(use-package lsp-bridge
;  :straight (lsp-bridge :type git
;			:host github
;			:repo "manateelazycat/lsp-bridge"
;			)
;  :load-path "~/.emacs.d/straight/repos/lsp-bridge/"
;  :config (global-lsp-bridge-mode))

;(use-package el-patch
;  :straight (el-patch :type git :host github :repo "raxod502/el-patch"
;                      :fork (:host github
;                             :repo "your-name/el-patch")))


;(use-package lsp-mode
;  :init
;  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
;    (setq lsp-keymap-prefix "C-c l")
;    (setq read-process-output-max (* 1024 1024)) ;; 1mb
;  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
;         (c-mode . lsp)
;         ;; if you want which-key integration
;         (lsp-mode . lsp-enable-which-key-integration)
;         (lsp-mode . lsp-ui-mode))
;  :commands lsp)
;
;;; optionally
;(use-package lsp-ui
;  :commands lsp-ui-mode
;  :init
;  (setq	lsp-ui-sideline-update-mode "line"
;	lsp-ui-sideline-show-code-actions t
;	lsp-ui-sideline-show-hover nil
;	lsp-ui-sideline-show-diagnostics t
;	lsp-ui-sideline-show-symbol t)
;  :config
;  (lsp-ui-mode))
;
;
;(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
;(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(provide 'module-completion)
