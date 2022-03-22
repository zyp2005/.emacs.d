;;; core-mapping -- 基础按键
;;; Commentary:
;;; Code:
(global-set-key (kbd "RET") 'newline-and-indent)

(use-package evil
  :init
  (evil-mode t)
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
;----------------------------------------------------------------

(general-create-definer leader
  :keymaps 'normal
  :prefix "SPC")
(general-swap-key nil 'motion
  ";" ":")
;; Searching
(advice-add 'evil-search-next :after #'evil-scroll-line-to-center)
(advice-add 'evil-search-next :after #'evil-scroll-line-to-center)

;;Window managemen
;;split the screens to up,right
(leader "l" 'my-window-right
	"h" 'my-window-left
	"j" 'my-window-down
	"k" 'my-window-up)
;;Resize splits with arrow keys
(general-def 'normal
        "M-l" 'evil-window-increase-width
	"M-h" 'evil-window-decrease-width
	"M-j" 'evil-window-decrease-height
	"M-k" 'evil-window-increase-height)
(setq insert-here-keymap 
      (let ((map (make-sparse-keymap))) 
        (define-key map (kbd "h") #'insert-here) 
        map))



(defun insert-here () 
  (interactive) 
  (insert "here") 
  (set-transient-map 
   insert-here-keymap))

(provide 'core-mapping)

;;; core-mapping.el ends here
