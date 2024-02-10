(global-display-line-numbers-mode) ; set line numbering

;; set up the melpa archives
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; bind sbcl to emacs
(setq inferior-lisp-program "/usr/bin/sbcl")


(add-hook 'after-init-hook 'global-company-mode)

;;trying to stop the intro screen  (inhibit-startup-screen)

;; function to enable no window mode have access to global clipboard
(defun update-killring-from-xclip ()
  (interactive)
  (let ((output (shell-command-to-string "xclip -o -selection clipboard")))
    (kill-new output)
    (message "Pasted from clipboard")))

(global-set-key (kbd "C-c C-u") 'update-killring-from-xclip)
