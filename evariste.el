(deftheme evariste "Matthieu's colour scheme - named after Évariste Galois - inspired by VIM's 'evening' theme")

(let ((class '((class color) (min-colors 89)))
      (bg "#343434") ;; Dark gray background
      (fg "#e9eaea") ;; Light grayish foreground
      (builtin "#999ff0") ;; Light purple for built-in functions
      (keyword "#edf047") ;; Bright yellow for keywords
      (string "#d08080") ;; Muted pink for strings
      (functionname "#5deaf4") ;; Bright cyan for function names
      (variable "#5deaf4") ;; Bright cyan for variables
      (type "#52ff66") ;; Bright green for types
      (constant "#ff8800") ;; Orange for constants
      (comment "#999ff0") ;; Light purple for comments
      (selection "#4343df") ;; Dark blue for selection
      (warning "#ff0000") ;; Red for warnings
      (warning2 "#ff8800") ;; Orange for secondary warnings
      (cursor "#ffffff") ;; White cursor
      (region "#4343df") ;; Dark blue for selected region
      (secondary-selection "#3f3f3f") ;; Slightly lighter gray for secondary selection
      (fringe "#343434") ;; Dark gray for fringe
      (modeline-active-bg "#5f5f5f") ;; Slightly lighter gray for active modeline
      (modeline-active-fg "#ffffff") ;; White text for active modeline
      (modeline-inactive-bg "#4f4f4f") ;; Dark gray background for inactive modeline
      (modeline-inactive-fg "#b8bcb9") ;; Light gray foreground for inactive modeline text
      (minibuffer-fg "#b8bcb9") ;; Light gray foreground for minibuffer text
      (line-number "#e0e0e0") ;; Light gray for line numbers
      (line-number-current "#ffd700")) ;; Yellow for the current line number

  (custom-theme-set-faces
   'evariste
   `(default ((,class (:background ,bg :foreground ,fg))))
   `(cursor ((,class (:background ,cursor))))
   `(fringe ((,class (:background ,fringe))))
   `(region ((,class (:background ,region))))
   `(secondary-selection ((,class (:background ,secondary-selection))))
   `(mode-line ((,class (:background ,modeline-active-bg :foreground ,modeline-active-fg))))
   `(mode-line-inactive ((,class (:background ,modeline-inactive-bg :foreground ,modeline-inactive-fg))))
   `(minibuffer-prompt ((,class (:foreground ,minibuffer-fg))))
   `(font-lock-comment-face ((,class (:foreground ,comment))))
   `(font-lock-keyword-face ((,class (:foreground ,keyword))))
   `(font-lock-builtin-face ((,class (:foreground ,builtin))))
   `(font-lock-type-face ((,class (:foreground ,type))))
   `(font-lock-variable-name-face ((,class (:foreground ,variable))))
   `(font-lock-constant-face ((,class (:foreground ,constant))))
   `(font-lock-string-face ((,class (:foreground ,string))))
   `(font-lock-function-name-face ((,class (:foreground ,functionname))))
   `(highlight ((,class (:background ,region))))
   `(isearch ((,class (:background ,constant :foreground ,bg))))
   `(lazy-highlight ((,class (:background ,region :foreground ,fg))))
   `(link ((,class (:foreground ,builtin :underline t))))
   `(link-visited ((,class (:foreground ,builtin :underline t))))
   `(button ((,class (:underline t))))
   `(header-line ((,class (:background ,modeline-active-bg :foreground ,modeline-active-fg))))
   `(show-paren-match ((,class (:background ,builtin :foreground ,bg))))
   `(show-paren-mismatch ((,class (:background ,warning :foreground ,bg))))
   `(warning ((,class (:foreground ,warning))))
   `(error ((,class (:foreground ,warning))))
   `(success ((,class (:foreground ,type))))
   `(font-lock-warning-face ((,class (:foreground ,warning2 :weight bold))))
   `(line-number ((,class (:foreground ,line-number :background ,bg))))
   `(line-number-current-line ((,class (:foreground ,line-number-current :background ,bg))))
   ))

(provide-theme 'evariste)
