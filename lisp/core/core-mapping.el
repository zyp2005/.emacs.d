;;; core-mapping -- 基础按键
;;; Commentary:
;;; Code:
(global-set-key (kbd "RET") 'newline-and-indent)

(use-package evil
  :init
  (evil-mode t)
    (setq evil-want-C-u-scroll t)
  )

(use-package general)

(require 'core-mapconf)
;-----------------------------------------------------------------
;; (general-def 'motion
;;   ";" 'evil-ex
;;   ":" 'evil-repeat-find-char)
;; (general-define-key
;;  :states 'normal
;;  :keymaps 'emacs-lisp-mode-map
;;  ;; or xref equivalent
;;  "K" 'elisp-slime-nav-describe-elisp-thing-at-point)

;; (general-create-definer my-leader-def
;;   ;; :prefix my-leader
;;   :prefix "SPC")

;; (my-leader-def 'normal c-mode-map
;; 	       "a" 'hello-world)
;; (my-leader-def 'normal emacs-lisp-mode-map
;; 	       "b" 'hello-world)
;;(general-def 'normal
;;  "c" (general-key-dispatch 'evil-change
;;                    "ow" 'toggle-word-wrap
;;                    "tb" 'some-command
;;                    "c" 'evil-change-whole-line
;;                    ;; alternatively if there was no linewise version:
;;                    "c" (general-simulate-key ('evil-change "c"))))
;;
;;
;;
;----------------------------------------------------------------
(general-create-definer leader
  :keymaps 'normal
  :prefix "SPC")

;(general-swap-key nil 'motion
;  ";" ":")
;; Searching
(advice-add 'evil-search-next :after #'evil-scroll-line-to-center)
(advice-add 'evil-search-next :after #'evil-scroll-line-to-center)

;;Window managemen
  ;;split the screens to up,right
(general-def 'normal
        "M-l" 'my-window-right
	"M-h" 'my-window-left
	"M-j" 'my-window-down
	"M-k" 'my-window-up)
  ;;Resize splits with arrow keys
(general-def 'normal
        "M-<right>" 'evil-window-increase-width
	"M-<left>" 'evil-window-decrease-width
	"M-<down>" 'evil-window-decrease-height
	"M-<up>" 'evil-window-increase-height)

(general-define-key
 "C-c p" '(:keymap projectile-command-map :package projectile))


;;(general-def 'normal
;;  "c" (general-key-dispatch 'evil-change
;;                    "ow" 'toggle-word-wrap
;;                    "tb" 'some-command
;;                    "c" 'evil-change-whole-line
;;                    ;; alternatively if there was no linewise version:
;;                    "c" (general-simulate-key ('evil-change "c"))))


;undo
(general-def 'normal
  "u" 'undo-tree-undo
  "U" 'undo-tree-visualize)

;make c-j/c-k work in vertico selection
(general-def 'vertico-map
  "C-j" 'vertico-next
  "C-k" 'vertico-previous)

(general-def 'normal
  "o" 'below-and-format)


(provide 'core-mapping)


;;; core-mapping.el ends here
