
;保存光标历史
(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))

(require 'simple)
(setq column-number-mode t)
(size-indication-mode)

(use-package savehist
  :ensure nil
  :hook (after-init . savehist-mode)
  :init (setq enable-recursive-minibuffers t ; Allow commands in minibuffers
	      history-length 1000
	      savehist-additional-variables '(mark-ring
					      global-mark-ring
					      search-ring
					      regexp-search-ring
					      extended-command-history)
	      savehist-autosave-interval 300)
  )

(provide 'module-basic)


