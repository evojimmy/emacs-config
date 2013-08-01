(global-set-key [f11] 'fullscreen)


;; 0 O || 1 l I || ` ' " || # * % ^ & @ ! || ( ) || [ ] || { } || < >
;; __中文__
;; ← → ↑ ↓ ⇒ £ € © ® ™ — … ¶ † ● ★ ◇ ◆ α β ° π ⊕ ⊗ “ ” « » 「 」 ✓ ♠ ♣ ♥ ♦ ♪ ☺
;;(set-frame-font
;; "DejaVu Sans Mono-13")
;; "Monospace-13")
;; "Liberation Mono-13") ;; symbols are a little small
;; "文泉驿等宽微米黑-13")

(global-set-key (kbd "C-.") 'redo)
(delq 'process-kill-buffer-query-function kill-buffer-query-functions)

(defun replace-html-chars-region (start end)
  "Replace “<” to “&lt;” and other chars in HTML.
This works on the current region."
  (interactive "r")
  (save-restriction
    (narrow-to-region start end)
    (goto-char (point-min))
    (while (search-forward "&" nil t) (replace-match "&amp;" nil t))
    (goto-char (point-min))
    (while (search-forward "<" nil t) (replace-match "&lt;" nil t))
    (goto-char (point-min))
    (while (search-forward ">" nil t) (replace-match "&gt;" nil t))
    )
  )


(add-hook 'before-save-hook 'whitespace-cleanup)
(setq-default indent-tabs-mode nil)

(defun untab-all ()
  (untabify (point-min) (point-max))
   nil ) ; did not write buffer to disk

(defun add-write-contents-hooks-hook ()
  (add-hook
   'write-contents-hooks
   'untab-all
     nil  ; APPEND  unrelated, explicit default nil as optional :)
     t )) ; LOCAL   non-nil => make hook local

;; more modes: http://www.emacswiki.org/CategoryModes
(add-hook 'emacs-lisp-mode-hook #'add-write-contents-hooks-hook)
(add-hook 'c-mode-common-hook   #'add-write-contents-hooks-hook)
(add-hook 'sh-mode-hook         #'add-write-contents-hooks-hook)
(add-hook 'text-mode-hook       #'add-write-contents-hooks-hook)
(add-hook 'sql-mode-hook        #'add-write-contents-hooks-hook)
(add-hook 'css-mode-hook        #'add-write-contents-hooks-hook)
(add-hook 'web-mode-hook        #'add-write-contents-hooks-hook)
