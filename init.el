;; -*- mode: emacs-lisp -*-
;; Simple .emacs configuration

(add-to-list 'load-path "~/.emacs.d")

(require 'cl)                       ;; [TODO] common-lisp??
(require 'smooth-scrolling)         ;; allow one-line scroll by keyboard

(menu-bar-mode -1)                  ;; hide menu bar
(normal-erase-is-backspace-mode 1)  ;; ensure function of Backspace key
(setq column-number-mode t)         ;; display line number on status bar
(setq inhibit-startup-message t)

(global-set-key [f11] 'fullscreen)
(global-set-key (kbd "C-.") 'redo)

(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)  ;; don't prompt unsaved buffer when killing emacs

(add-hook 'before-save-hook 'whitespace-cleanup)
(setq-default indent-tabs-mode nil) ;; don't use tab as default

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

;;;;;;FONTS TEST;;;;;;
;; 0 O || 1 l I || ` ' " || # * % ^ & @ ! || ( ) || [ ] || { } || < >
;; __中文__
;; ← → ↑ ↓ ⇒ £ € © ® ™ — … ¶ † ● ★ ◇ ◆ α β ° π ⊕ ⊗ “ ” « » 「 」 ✓ ♠ ♣ ♥ ♦ ♪ ☺
(set-frame-font
;; "DejaVu Sans Mono-13")
;; "Monospace-13")
;; "Liberation Mono-13") ;; symbols are a little small
 "文泉驿等宽微米黑-13")



;; web mode conf
(load "web-mode.el")
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
)
(add-hook 'web-mode-hook  'web-mode-hook)

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

(setq web-mode-style-padding 1)
(setq web-mode-script-padding 1)
(setq web-mode-block-padding 0)
(setq web-mode-comment-style 2)


;;;Haskell mode
(load "haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
