;;; core-init -- 配置文件的开始
;;; Commentary:
;;; Code:

(use-package vertico
  :init
  (vertico-mode)
  (setq read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t
      completion-ignore-case t)
  ;vertico-multiform-mode 可设置各模式的显示方式
    )

(use-package marginalia
  :init
    (marginalia-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package embark
  :config
  (global-set-key (kbd "C-;") 'embark-act)
  (setq prefix-help-command 'embark-prefix-help-command)
  (define-key minibuffer-local-map (kbd "C-c C-e") 'embark-export)
)

(use-package embark-consult) ; only need to install it, embark loads it after consult if found

(use-package consult
  :config
  (global-set-key (kbd "C-s") 'consult-line))

(use-package wgrep
  :config
  (setq wgrep-auto-save-buffer t)
  )

(use-package flycheck
  :hook                        ; 为模式设置 hook
  (prog-mode . flycheck-mode))

(use-package ace-window
  :bind (("C-x o" . 'ace-window))
  :init
  (winner-mode)
  (defvar aw-dispatch-alist
  '((?d aw-delete-window "Delete Window")
	(?s aw-swap-window "Swap Windows")
	(?m aw-move-window "Move Window")
	(?c aw-copy-window "Copy Window")
	(?j aw-switch-buffer-in-window "Select Buffer")
	(?v aw-split-window-vert "Split Vert Window")
	(?b aw-split-window-horz "Split Horz Window")
	(?o delete-other-windows "Delete Other Windows")
    (?= balance-windows-area)
    (?u winner-undo)
    (?r winner-redo)
	(?? aw-show-dispatch-help))
  "List of actions for `aw-dispatch-default'.")
  (setq aw-dispatch-when-more-than 0)
  (setq aw-dispatch-always t))

(use-package resize-window
  :ensure t
  :init
  (defvar resize-window-dispatch-alist
    '((?n resize-window--enlarge-down " Resize - Expand down" t)
      (?p resize-window--enlarge-up " Resize - Expand up" t)
      (?f resize-window--enlarge-horizontally " Resize - horizontally" t)
      (?b resize-window--shrink-horizontally " Resize - shrink horizontally" t)
      (?r resize-window--reset-windows " Resize - reset window layout" nil)
      (?w resize-window--cycle-window-positive " Resize - cycle window" nil)
      (?W resize-window--cycle-window-negative " Resize - cycle window" nil)
      (?2 split-window-below " Split window horizontally" nil)
      (?3 split-window-right " Slit window vertically" nil)
      (?0 resize-window--delete-window " Delete window" nil)
      (?K resize-window--kill-other-windows " Kill other windows (save state)" nil)
      (?y resize-window--restore-windows " (when state) Restore window configuration" nil)
      (?? resize-window--display-menu " Resize - display menu" nil))
    "List of actions for `resize-window-dispatch-default.
Main data structure of the dispatcher with the form:
\(char function documentation match-capitals\)"))

(use-package popper
  :defines popper-echo-dispatch-actions
  :commands popper-group-by-directory
  :bind (:map popper-mode-map
	      ("s-`" . popper-toggle-latest)
	      ("M-o"   . popper-cycle)
	      ("M-`" . popper-toggle-type))
  :hook (emacs-startup . popper-mode)
  :init
  (setq popper-reference-buffers
	'("\\*Messages\\*"
	  "Output\\*$" "\\*Pp Eval Output\\*$"
	  "\\*Compile-Log\\*"
	  "\\*Completions\\*"
	  "\\*Warnings\\*"
	  "\\*Flymake diagnostics.*\\*"
	  "\\*Async Shell Command\\*"
	  "\\*Apropos\\*"
	  "\\*Backtrace\\*"
	  "\\*prodigy\\*"
	  "\\*Calendar\\*"
	  "\\*Embark Actions\\*"
	  "\\*Finder\\*"
	  "\\*Kill Ring\\*"
	  "\\*Embark Export:.*\\*"
	  "\\*Edit Annotation.*\\*"
	  "\\*Flutter\\*"
	  bookmark-bmenu-mode
	  lsp-bridge-ref-mode
	  comint-mode
	  compilation-mode
	  help-mode helpful-mode
	  tabulated-list-mode
	  Buffer-menu-mode
	  occur-mode
	  gnus-article-mode devdocs-mode
	  grep-mode occur-mode rg-mode deadgrep-mode ag-mode pt-mode
	  ivy-occur-mode ivy-occur-grep-mode
	  process-menu-mode list-environment-mode cargo-process-mode
	  youdao-dictionary-mode osx-dictionary-mode fanyi-mode

	  "^\\*eshell.*\\*.*$" eshell-mode
	  "^\\*shell.*\\*.*$"  shell-mode
	  "^\\*terminal.*\\*.*$" term-mode
	  "^\\*vterm.*\\*.*$"  vterm-mode

	  "\\*DAP Templates\\*$" dap-server-log-mode
	  "\\*ELP Profiling Restuls\\*" profiler-report-mode
	  "\\*Flycheck errors\\*$" " \\*Flycheck checker\\*$"
	  "\\*Paradox Report\\*$" "\\*package update results\\*$" "\\*Package-Lint\\*$"
	  "\\*[Wo]*Man.*\\*$"
	  "\\*ert\\*$" overseer-buffer-mode
	  "\\*gud-debug\\*$"
	  "\\*lsp-help\\*$" "\\*lsp session\\*$"
	  "\\*quickrun\\*$"
	  "\\*tldr\\*$"
	  "\\*vc-.*\\*$"
	  "\\*eldoc\\*"
	  "^\\*elfeed-entry\\*$"
	  "^\\*macro expansion\\**"

	  "\\*Agenda Commands\\*" "\\*Org Select\\*" "\\*Capture\\*" "^CAPTURE-.*\\.org*"
	  "\\*Gofmt Errors\\*$" "\\*Go Test\\*$" godoc-mode
	  "\\*docker-containers\\*" "\\*docker-images\\*" "\\*docker-networks\\*" "\\*docker-volumes\\*"
	  "\\*prolog\\*" inferior-python-mode inf-ruby-mode swift-repl-mode
	  "\\*rustfmt\\*$" rustic-compilation-mode rustic-cargo-clippy-mode
	  rustic-cargo-outdated-mode rustic-cargo-test-mode))

  (when (display-grayscale-p)
    (setq popper-mode-line
	  '(:eval
	    (concat
	     (propertize " " 'face 'mode-line-emphasis)
	     (all-the-icons-octicon "pin" :height 0.9 :v-adjust 0.0 :face 'mode-line-emphasis)
	     (propertize " " 'face 'mode-line-emphasis)))))

  (setq popper-echo-dispatch-actions t)
  (setq popper-group-function nil)
  :config
  (popper-echo-mode 1)
  (with-no-warnings
    (defun my-popper-fit-window-height (win)
      "Determine the height of popup window WIN by fitting it to the buffer's content."
      (fit-window-to-buffer
       win
       (floor (frame-height) 3)
       (floor (frame-height) 3)))
    (setq popper-window-height #'my-popper-fit-window-height)

    (defun popper-close-window-hack (&rest _)
      "Close popper window via `C-g'."
      ;; `C-g' can deactivate region
      (when (and (called-interactively-p 'interactive)
		 (not (region-active-p))
		 popper-open-popup-alist)
	(let ((window (caar popper-open-popup-alist)))
	  (when (window-live-p window)
	    (delete-window window)))))
    (advice-add #'keyboard-quit :before #'popper-close-window-hack)))

(use-package treemacs)

(use-package expand-region
  :config
  (defadvice er/prepare-for-more-expansions-internal
      (around helm-ag/prepare-for-more-expansions-internal activate)
    ad-do-it
    (let ((new-msg (concat (car ad-return-value)
			   ", H to highlight in buffers"
			   ", / to search in project, "
			   "e iedit mode in functions"
			   "f to search in files, "
			   "b to search in opened buffers"))
	  (new-bindings (cdr ad-return-value)))
      (cl-pushnew
       '("H" (lambda ()
	       (interactive)
	       (call-interactively
		'zilongshanren/highlight-dwim)))
       new-bindings)
      (cl-pushnew
       '("/" (lambda ()
	       (interactive)
	       (call-interactively
		'my/search-project-for-symbol-at-point)))
       new-bindings)
      (cl-pushnew
       '("e" (lambda ()
	       (interactive)
	       (call-interactively
		'evil-multiedit-match-all)))
       new-bindings)
      (cl-pushnew
       '("f" (lambda ()
	       (interactive)
	       (call-interactively
		'find-file)))
       new-bindings)
      (cl-pushnew
       '("b" (lambda ()
	       (interactive)
	       (call-interactively
		'consult-line)))
       new-bindings)
      (setq ad-return-value (cons new-msg new-bindings)))))

;;;###autoload
(defun my/search-project-for-symbol-at-point ()
  (interactive)
  (if (use-region-p)
      (progn
	(consult-ripgrep (project-root (project-current))
			 (buffer-substring (region-beginning) (region-end))))))
(defun zilongshanren/evil-quick-replace (beg end )
  (interactive "r")
  (when (evil-visual-state-p)
    (evil-exit-visual-state)
    (let ((selection (regexp-quote (buffer-substring-no-properties beg end))))
      (setq command-string (format "%%s /%s//g" selection))
      (minibuffer-with-setup-hook
	  (lambda () (backward-char 2))
	(evil-ex command-string)))))
(define-key evil-visual-state-map (kbd "C-r") 'zilongshanren/evil-quick-replace)
(defun zilongshanren/highlight-dwim ()
  (interactive)
  (if (use-region-p)
      (progn
	(highlight-frame-toggle)
	(deactivate-mark))
    (symbol-overlay-put)))
(defun zilongshanren/clearn-highlight ()
  (interactive)
  (clear-highlight-frame)
  (symbol-overlay-remove-all))

(provide 'module-tool)
