;;; core-init -- 配置文件的开始
;;; Commentary:
;;; Code:

(use-package all-the-icons)

(use-package nerd-icons)

(use-package nerd-icons-completion
  :config
  (nerd-icons-completion-mode))

(use-package nerd-icons-dired
  :hook
  (dired-mode . nerd-icons-dired-mode))

(use-package treemacs-nerd-icons
  :config
  (treemacs-load-theme "nerd-icons"))

(use-package undo-tree
  :init (global-undo-tree-mode)
  :config (setq undo-tree-auto-save-history t)
	(setq undo-tree-history-directory-alist
	'(("." . "~/.emacs.d/emacs_undo")))
	)

(use-package good-scroll
  :init (good-scroll-mode))

(use-package doom-themes
  :init (load-theme 'doom-gruvbox-light t))  ;-light -material

(use-package color-theme-approximate
  :config (color-theme-approximate-on))

(use-package doom-modeline
  :init
  (doom-modeline-mode 1)
  (setq doom-modeline-bar-width 8))

(use-package which-key
  :config
    ;; Allow C-h to trigger which-key before it is done automatically
    (setq which-key-show-early-on-C-h t)
    ;; make sure which-key doesn't show normally but refreshes quickly after it is
    ;; triggered.
    (setq which-key-idle-delay 1)
    (setq which-key-idle-secondary-delay 0.05)
    (which-key-mode))

(use-package awesome-tab
  :straight (awesome-tab :type git :host github :repo "manateelazycat/awesome-tab")
  :config
  (awesome-tab-mode t)
  (setq awesome-tab-height 100)
  (defun awesome-tab-buffer-groups ()
  "`awesome-tab-buffer-groups' control buffers' group rules.
  Group awesome-tab with mode if buffer is derived from `eshell-mode' `emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
  All buffer name start with * will group to \"Emacs\".
  Other buffer group by `awesome-tab-get-group-name' with project name."
  (list
  (cond
      ((or (string-equal "*" (substring (buffer-name) 0 1))
      (memq major-mode '(magit-process-mode
                  magit-status-mode
                  magit-diff-mode
                  magit-log-mode
                  magit-file-mode
                  magit-blob-mode
                  magit-blame-mode)))
      "Emacs")
      ((derived-mode-p 'eshell-mode)
      "EShell")
      ((derived-mode-p 'dired-mode)
      "Dired")
      ((memq major-mode '(org-mode org-agenda-mode diary-mode))
      "OrgMode")
      ((derived-mode-p 'eaf-mode)
      "EAF")
      (t
      (awesome-tab-get-group-name (current-buffer))))))
)

(use-package dashboard
    :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "A NWE DAY,ZYP!")
  (setq dashboard-icon-type 'all-the-icons)
  (setq dashboard-set-file-icons t))

(use-package symbol-overlay
  :config
  (define-key symbol-overlay-map (kbd "h") 'nil))

(use-package highlight-global
  :ensure nil
  :commands (highlight-frame-toggle)
  :straight (highlight-global :type git :host github :repo "glen-dai/highlight-global")
  :config
  (progn
    (setq-default highlight-faces
		  '(('hi-red-b . 0)
		    ('hi-aquamarine . 0)
		    ('hi-pink . 0)
		    ('hi-blue-b . 0)))))

(use-package treesit-auto
  :demand t
  :config
  (setq treesit-auto-install 'prompt)
  (setq treesit-font-lock-level 4)
  (global-treesit-auto-mode)
(setq-default c-ts-mode-indent-offset 4)
(setq c-ts-mode-indent-style 'bsd)
  )

;(use-package  posframe
;  :straight ( posframe :type git :host github :repo "tumashu/posframe"))




(provide 'module-ui)
