(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (frame-parameter nil 'fullscreen) nil
                         'fullboth)))
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(add-hook 'before-save-hook 'whitespace-cleanup)
(setq-default indent-tabs-mode nil)

