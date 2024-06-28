(global-display-line-numbers-mode) ; set line numbering

;; set up the melpa archives
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; bind sbcl to emacs
(setq inferior-lisp-program "/usr/bin/sbcl")

;; add opacity to the emacs bg for emacs gui client; activate when needed
;(set-frame-parameter nil 'alpha-background 70)

;(add-to-list 'default-frame-alist '(alpha-background . 70))

(add-hook 'after-init-hook 'global-company-mode)


;; Disable the background color in Emacs to keep terminal transparency
(add-hook 'terminal-init-xterm-hook
          (lambda ()
            (unless (display-graphic-p)
              (set-face-background 'default "unspecified-bg" (selected-frame)))))

;;trying to stop the intro screen
(setq inhibit-startup-screen t)

;; function to enable no window mode have access to global clipboard
(defun update-killring-from-xclip ()
  (interactive)
  (let ((output (shell-command-to-string "xclip -o -selection clipboard")))
    (kill-new output)
    (message "Pasted from clipboard")))

(global-set-key (kbd "C-c C-u") 'update-killring-from-xclip)

;; font and font-size i am very comfortable in.
;; downside is i have not gotten it to work in no window mode
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   '(zig-mode go-mode kotlin-mode zen-mode smartparens slime rust-mode magit company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight semi-bold :height 113 :width normal)))))

(load-theme 'misterioso)
