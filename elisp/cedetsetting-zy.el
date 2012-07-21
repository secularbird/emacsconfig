;;setting for semantic
(require 'cedet)
;(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
;(semantic-load-enable-guady-code-helpers)
;(semantic-load-enable-excessive-code-helpers)
;(semantic-load-enable-semantic-debugging-helpers)

;;enable ede-mode to use projects
(global-ede-mode t)

(defvar semantic-dir
    (concat "~/.emacs.d/semantic_cache/"))
(make-directory semantic-dir t)

;;setting search scope
(setq semanticdb-project-roots
     (list
          (expand-file-name "/")))
;;save cache files to a certain postion
(setq semanticdb-default-save-directory "~/.emacs.d/semantic_cache")
;;enable search db in c mode
(setq semanticdb-search-system-databases t)
(add-hook 'c-mode-common-hook
    (lambda ()
            (setq semanticdb-project-system-databases
                       (list (semanticdb-create-database
                              semanticdb-new-database-class
                             "/usr/include")))))
;end semantic setting



(require 'xcscope)
(setq cscope-do-not-update-database t)

;;setting speedbar
(global-set-key [(f5)] 'speedbar)

(setq senator-minor-mode-name "SN")
(setq semantic-imenu-auto-rebuild-directory-indexes nil)
(global-srecode-minor-mode 1)
(global-semantic-mru-bookmark-mode 1)

(require 'semantic-decorate-include)

;; gcc setup
(require 'semantic-gcc)

;; smart complitions
(require 'semantic-ia)

(setq-mode-local c-mode semanticdb-find-default-throttle
                   '(project unloaded system recursive))
(setq-mode-local c++-mode semanticdb-find-default-throttle
                   '(project unloaded system recursive))
(setq-mode-local java-mode semanticdb-find-default-throttle
                   '(project unloaded system recursive))
(setq-mode-local erlang-mode semanticdb-find-default-throttle
                   '(project unloaded system recursive))

(require 'eassist)

;; customisation of modes
(defun cedet-hook ()
    (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
    (local-set-key "\C-c?" 'semantic-ia-complete-symbol)
    ;;
    (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
    (local-set-key "\C-c=" 'semantic-decoration-include-visit)
    (local-set-key "\C-cj" 'semantic-ia-fast-jump)
    (local-set-key "\C-cq" 'semantic-ia-show-doc)
    (local-set-key "\C-cs" 'semantic-ia-show-summary)
    (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
)

;; (add-hook 'semantic-init-hooks 'cedet-hook)
(add-hook 'c-mode-common-hook 'cedet-hook)
(add-hook 'java-mode-common-hook 'cedet-hook)
(add-hook 'lisp-mode-hook 'cedet-hook)
(add-hook 'scheme-mode-hook 'cedet-hook)
(add-hook 'emacs-lisp-mode-hook 'cedet-hook)
(add-hook 'erlang-mode-hook 'cedet-hook)

(defun c-mode-cedet-hook ()
;; (local-set-key "." 'semantic-complete-self-insert)
;; (local-set-key ">" 'semantic-complete-self-insert)
   (local-set-key "\C-ct" 'eassist-switch-h-cpp)
   (local-set-key "\C-xt" 'eassist-switch-h-cpp)
   (local-set-key "\C-ce" 'eassist-list-methods)
   (local-set-key "\C-c\C-r" 'semantic-symref)
)
(add-hook 'c-mode-common-hook 'c-mode-cedet-hook)

;; hooks, specific for semantic
(defun semantic-hook ()
   ;; (semantic-tag-folding-mode 1)
       (imenu-add-to-menubar "TAGS")
)
(add-hook 'semantic-init-hooks 'semantic-hook)


;;(global-semantic-folding-mode 1)

;; gnu global support
;;(require 'semanticdb-global)
;;(semanticdb-enable-gnu-global-databases 'c-mode)
;;(semanticdb-enable-gnu-global-databases 'c++-mode)
;;(semanticdb-enable-gnu-global-databases 'java-mode)

; ctags
(require 'semanticdb-ectag)
(semantic-load-enable-primary-exuberent-ctags-support)

;; ede customization
(require 'semantic-lex-spp)

;;enable ecb model
(require 'ecb)
(setq ecb-tip-of-the-day nil)
(setq ecb-auto-activate t)

    
;; setup compile package
(require 'compile)
(setq compilation-disable-input nil)
(setq compilation-scroll-output t)
(setq mode-compile-always-save-buffer-p t)

