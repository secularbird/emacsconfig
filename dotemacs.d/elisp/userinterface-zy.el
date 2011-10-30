
    
(defun set-frame-size-according-to-resolution ()
    (interactive)
    (if window-system
        (progn
            (if (> (x-display-pixel-width) 1280)
                (add-to-list 'default-frame-alist (cons 'width 140))
                (add-to-list 'default-frame-alist (cons 'width 80)))
            (if (> (x-display-pixel-height) 800)
                (add-to-list 'default-frame-alist (cons 'height 45))
                (add-to-list 'default-frame-alist (cons 'height 30))))))

;; Emacs usually has a splash screen on startup.  Let's get rid of
;; that and start with a blank buffer.
;(setq inhibit-startup-message t)

;;hiden toolbar
;(menu-bar-mode t)          ;hide menu-bar
(scroll-bar-mode nil)        ;hide scroll-bar
(tool-bar-mode nil)          ;hide tool-bar

;; Blackboard Colour Theme for Emacs.
;;
;; Defines a colour scheme resembling that of the original TextMate Blackboard colour theme.
;; To use add the following to your .emacs file (requires the color-theme package):
;;
;; (require 'color-theme)
;; (color-theme-initialize)
;; (load-file "~/.emacs.d/themes/color-theme-blackboard.el")
;;
;; And then (color-theme-blackboard) to activate it.
;;
;; MIT License Copyright (c) 2008, 2011 JD Huntington 
;; Credits due to the excellent TextMate Blackboard theme
;;
;; All patches welcome
     
(require 'color-theme)
(color-theme-initialize)
(color-theme-classic)

(setq default-frame-alist '((top . 0) (left . 0)))

(set-frame-size-according-to-resolution)

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t) 
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t) 
