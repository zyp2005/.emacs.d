;;; core-init -- 配置文件的开始
;;; Commentary:
;;; Code:
(let ((minver "25.1"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "26.1")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

(add-to-list 'load-path "~/.emacs.d/lisp/core/") ; 设定源码加载路径
(add-to-list 'custom-theme-load-path "~/.emacs.d/theme")
(require 'core-init) ;; emacs配置的开始

(provide 'init)
(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#282828" "#ea6962" "#a9b665" "#d8a657" "#7daea3" "#ea6962" "#89b482" "#d4be98"])
 '(custom-safe-themes
   '("f13d72c887ce3a07c58af45b9fff8abdb2220942d28e4b5c4acae010b784c5b4" "d6c67845615cdcdc7dafba6ee2fab32d1455d8e877bcf0f65dd0d069cad8fc63" "b5433859fa98867b0f16782aa1359e48790aa34581a1e14fae7d9aba4945ed93" "4df70ec34caa34f44679e7613ffa1c7e1e83008bd0a581e1e887039cb0c47bf9" "15eb37641f28318b3d4818b247d95b5954aabd9e0dfd786543c3beb0714b0265" "72c872f5a32430d6435e2c300b9db23a6d2fac399ceef463975f73257520f658" "52f2549467a8ee3ae11ca79d88cf7d3009432e5927484473e1508f04cb1d4896" "ab6d0d00370df15189356b488b3cd274c59c29bbb93596e85d6dbf91ebf0d7a8" default))
 '(exwm-floating-border-color "#504945")
 '(fci-rule-color "#7c6f64")
 '(highlight-tail-colors ((("#34362e" "#363627") . 0) (("#313630" "#323730") . 20)))
 '(jdee-db-active-breakpoint-face-colors (cons "#0d1011" "#d8a657"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#0d1011" "#a9b665"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#0d1011" "#928374"))
 '(objed-cursor-color "#ea6962")
 '(package-selected-packages
   '(autothemer chess landmark maces-game lua-mode tree-sitter-langs tree-sitter-indent which-key use-package undo-tree tree-sitter lsp-ui lsp-treemacs lsp-ivy good-scroll general flycheck evil doom-themes doom-modeline company-quickhelp color-theme-approximate amx))
 '(pdf-view-midnight-colors (cons "#d4be98" "#282828"))
 '(rustic-ansi-faces
   ["#282828" "#ea6962" "#a9b665" "#d8a657" "#7daea3" "#ea6962" "#89b482" "#d4be98"])
 '(vc-annotate-background "#282828")
 '(vc-annotate-color-map
   (list
    (cons 20 "#a9b665")
    (cons 40 "#b8b060")
    (cons 60 "#c8ab5b")
    (cons 80 "#d8a657")
    (cons 100 "#dd9c54")
    (cons 120 "#e29351")
    (cons 140 "#e78a4e")
    (cons 160 "#e87f54")
    (cons 180 "#e9735b")
    (cons 200 "#ea6962")
    (cons 220 "#ea6962")
    (cons 240 "#ea6961")
    (cons 260 "#ea6962")
    (cons 280 "#d36f66")
    (cons 300 "#be756b")
    (cons 320 "#a87c6f")
    (cons 340 "#7c6f64")
    (cons 360 "#7c6f64")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
