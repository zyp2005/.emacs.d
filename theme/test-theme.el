(require 'autothemer)

(autothemer-deftheme
 test "a test for a now theme"
 ((((class color) (min-colors #xFFFFFF)))
  (test-black   "#000000")
  (test-white   "#ffffff")
  (test-orange  "#eb6123")
  (test-purple  "#5C3566")
  )

 ((default                   (:foreground test-white :background test-black))
  (cursor                    (:foreground test-orange))
  (tree-sitter-hl-face:function.call   (:foreground test-orange :background test-black))

  ))

(provide-theme 'test)
