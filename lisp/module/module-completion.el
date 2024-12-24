;;; core-init -- 配置文件的开始
;;; Commentary:
;;; Code:
(use-package company
  :bind
  (:map company-active-map
        ([tab] . smarter-yas-expand-next-field-complete)
        ("TAB" . smarter-yas-expand-next-field-complete))
    :init
    (setq company-minimum-prefix-length 1
      company-idle-delay 0.0) ;; default is 0.2)
    (setq company-require-match nil) ; allow input string that do not match candidate words
    (setq company-tooltip-maximum-width 60);    :config
    (global-company-mode))


(defun smarter-yas-expand-next-field-complete ()
    "Try to `yas-expand' and `yas-next-field' at current cursor position.

If failed try to complete the common part with `company-complete-common'"
    (interactive)
    (if yas-minor-mode
        (let ((old-point (point))
              (old-tick (buffer-chars-modified-tick)))
          (yas-expand)
          (when (and (eq old-point (point))
                     (eq old-tick (buffer-chars-modified-tick)))
            (ignore-errors (yas-next-field))
            (when (and (eq old-point (point))
                       (eq old-tick (buffer-chars-modified-tick)))
              (company-complete-common))))
      (company-complete-common)))

(with-eval-after-load 'company
    (define-key company-active-map [tab] #'yas-expand)
    (define-key company-active-map (kbd "TAB") #'yas-expand))

    ;(company-tng-configure-default)

;(use-package eglot
;  :config
;  (add-to-list 'eglot-server-programs '((c++-mode c-mode c-ts-mode c++-ts-mode) "clangd"))
;(add-hook 'c-mode-hook #'eglot-ensure)
;(add-hook 'c-ts-mode-hook #'eglot-ensure)
;(add-hook 'c++-mode-hook #'eglot-ensure)
;(add-hook 'c++-ts-mode-hook #'eglot-ensure)
;)

(require 'eglot)
;; 检测操作系统
(cond
  ;; Windows系统
  ((eq system-type 'windows-nt)
   (add-to-list 'eglot-server-programs '((c++-mode c-mode c-ts-mode c++-ts-mode) . ("D:\\msys2\\build_bin\\ccls"))))
  ;; Linux系统
  ((eq system-type 'gnu/linux)
   (add-to-list 'eglot-server-programs '((c++-mode c-mode c-ts-mode c++-ts-mode) . ("clangd" "--header-insertion=never --enable-config"))))
  ;; 其他系统可以根据需要添加
  ;; ...
  ;; 默认配置，如果需要的话
  ((add-to-list 'eglot-server-programs '((c++-mode c-mode c-ts-mode c++-ts-mode) . ("clangd" "--header-insertion=never --enable-config")))
   ;; 默认配置代码
   ))
(add-hook 'c-mode-hook #'eglot-ensure)
(add-hook 'c-ts-mode-hook #'eglot-ensure)
(add-hook 'c++-mode-hook #'eglot-ensure)
(add-hook 'c++-ts-mode-hook #'eglot-ensure)

;;ccls的配置
(defun eglot-ccls-inheritance-hierarchy (&optional derived)
  "Show inheritance hierarchy for the thing at point.
If DERIVED is non-nil (interactively, with prefix argument), show
the children of class at point."
  (interactive "P")
  (if-let* ((res (jsonrpc-request
                  (eglot--current-server-or-lose)
                  :$ccls/inheritance
                  (append (eglot--TextDocumentPositionParams)
                          `(:derived ,(if derived t :json-false))
                          '(:levels 100) '(:hierarchy t))))
            (tree (list (cons 0 res))))
      (with-help-window "*ccls inheritance*"
        (with-current-buffer standard-output
          (while tree
            (pcase-let ((`(,depth . ,node) (pop tree)))
              (cl-destructuring-bind (&key uri range) (plist-get node :location)
                (insert (make-string depth ?\ ) (plist-get node :name) "\n")
                (make-text-button (+ (point-at-bol 0) depth) (point-at-eol 0)
                                  'action `(lambda (_arg)
                                            (interactive)
                                            (find-file (eglot--uri-to-path ',uri))
                                            (goto-char (car (eglot--range-region ',range)))))
                (cl-loop for child across (plist-get node :children)
                         do (push (cons (1+ depth) child) tree)))))))
(eglot--error "Hierarchy unavailable")))


(defun my-eglot-flycheck-setup ()
  "Enable Flycheck when Eglot is not active, and disable Flycheck when Eglot is active."
  (if (bound-and-true-p eglot--managed-mode)
      (when (bound-and-true-p flycheck-mode)
        (flycheck-mode -1))
    (flycheck-mode 1)))

(add-hook 'eglot-managed-mode-hook #'my-eglot-flycheck-setup)
(add-hook 'after-change-major-mode-hook #'my-eglot-flycheck-setup)


(use-package consult-eglot)


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

;; (use-package company-ctags
;;   :config
;; (with-eval-after-load 'company
;;   (company-ctags-auto-setup))
;;   )

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
