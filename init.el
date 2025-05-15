;;; init.el --- Emacs config

;; Basic UI settings
(setq inhibit-startup-message t
      inhibit-startup-screen t
      make-backup-files nil
      auto-save-default nil
      create-lockfiles nil
      scroll-conservatively 100
      display-line-numbers-type 'relative)

(add-to-list 'default-frame-alist '(font . "Source Code Pro-12"))
(set-face-attribute 'default nil :font "Source Code Pro-12")

(global-display-line-numbers-mode)
(show-paren-mode 1)
(global-font-lock-mode 1)
(global-auto-revert-mode 1)

;; Default window size
(add-to-list 'default-frame-alist '(width . 80))
(add-to-list 'default-frame-alist '(height . 25))

;; Theme
(load-theme 'misterioso)

;; Package system setup
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Go mode
(use-package go-mode
  :mode "\\.go\\'")

;; Global company mode
(add-hook 'after-init-hook 'global-company-mode)

;; Terminal transparency handling
(add-hook 'terminal-init-xterm-hook
          (lambda ()
            (unless (display-graphic-p)
              (set-face-background 'default "unspecified-bg" (selected-frame)))))

;; Lisp interpreter (SBCL)
(setq inferior-lisp-program "/usr/bin/sbcl")

;; Clipboard sync in non-GUI Emacs
(defun update-killring-from-xclip ()
  (interactive)
  (let ((output (shell-command-to-string "xclip -o -selection clipboard")))
    (kill-new output)
    (message "Pasted from clipboard")))
(global-set-key (kbd "C-c C-u") 'update-killring-from-xclip)

;; GUI transparency
(set-frame-parameter nil 'alpha-background 78)
(add-to-list 'default-frame-alist '(alpha-background . 78))
