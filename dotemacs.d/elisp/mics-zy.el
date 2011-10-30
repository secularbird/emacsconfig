;;add tabbar
(require 'tabbar)
; turn on the tabbar
(tabbar-mode t)
; define all tabs to be one of 3 possible groups: “Emacs Buffer”, “Dired”,
;“User Buffer”.

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))


;;setting for tarbar
(defun tabbar-buffer-groups ()
"Return the list of group names the current buffer belongs to.
This function is a custom function for tabbar-mode's tabbar-buffer-groups.
This function group all buffers into 3 groups:
Those Dired, those user buffer, and those emacs buffer.
Emacs buffer are those starting with “*”."
    (list
        (cond
              ((string-equal "*" (substring (buffer-name) 0 1))
              "Emacs Buffer"
                )
              ((eq major-mode 'dired-mode)
              "Dired"
                )
               (t
                "User Buffer"
                )
      )))

;(setq tabbar-buffer-groups-function 'tabbar-buffer-groups)

(global-set-key [C-prior] 'tabbar-backward)
(global-set-key [C-next] 'tabbar-forward)
;end tabbar setting

;;; Auto-save
;; Put autosave files (ie #foo#) in one place, *not*
;; scattered all over the file system!
;(defvar autosave-dir
;   (concat "/tmp/emacs_autosaves/" (user-login-name) "/"))

;(make-directory autosave-dir t)

;(defun auto-save-file-name-p (filename)
;     (string-match "^#.*#$" (file-name-nondirectory filename)))

;(defun make-auto-save-file-name ()
;       (concat autosave-dir
;             (if buffer-file-name
;                      (concat "#" (file-name-nondirectory buffer-file-name) "#")
;                                 (expand-file-name
;                                       (concat "#%" (buffer-name) "#")))))

;; Put backup files (ie foo~) in one place too. (The backup-directory-alist
;; list contains regexp=>directory mappings; filenames matching a regexp are
;; backed up in the corresponding directory. Emacs will mkdir it if necessary.)
(defvar backup-dir (concat "/tmp/emacs_backups/" (user-login-name) "/"))
(setq backup-directory-alist (list (cons "." backup-dir)))


(require 'auto-header)
(setq header-full-name "zhuangyao")
(setq header-email-address "secularbird.eagle@gmail.com")
(setq header-update-on-save '(filename
                              modified
                              counter
                              copyright
                              ))
(setq header-field-list '(
                          filename  
                          blank   
                          copyright
                          version
                          author    
                          created   
                          blank
                          description  
                          blank
                        ;;modified_by 
                        ;;blank
                        ;;status  
                        ;;update  
                        ;;blank
                          ))


