;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

(setq doom-theme 'doom-monokai-pro)
(define-key key-translation-map (kbd "M-3") (kbd "#"))
(define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
(define-key evil-visual-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-s") 'evil-numbers/dec-at-pt)
(define-key evil-visual-state-map (kbd "C-s") 'evil-numbers/dec-at-pt)

; Projectile
(setq projectile-project-search-path '("~/quicklisp/local-projects/" "~/dev/" "~/Projects/"))

; Fonts
(setq doom-font (font-spec :family "Fira Code" :size 16 :weight 'Regular))

(after! lsp-mode
  (lsp-register-client
    (make-lsp-client :new-connection (lsp-stdio-connection "python3"
                                      (lambda () '("localhost" "5678")))
                     :major-modes '(python-mode)
                     :server-id 'pylsp-docker)))

(after! lsp-mode
  (setq lsp-diagnostics-provider :auto  ; Use lsp-mode for diagnostics
        lsp-pylsp-plugins-mypy-enabled t  ; Ensure mypy is enabled
        lsp-pylsp-plugins-mypy-live-mode nil  ; Disable live mode if it's too performance-intensive
        lsp-pylsp-plugins-mypy-args '("--ignore-missing-imports")))  ; Example of adding extra mypy args

;; Load dir-locals from emacs_config if it exists
;; (let ((alt-dir-locals (expand-file-name "emacs_config/.dir-locals.el" (projectile-project-root))))
;;   (when (file-exists-p alt-dir-locals)
;;     (load-file alt-dir-locals)))

(after! lsp-mode
  (setq lsp-disabled-clients '(pylsp-docker)))

;; (use-package! json-mode
;;   :mode "\\.json\\'")

(after! sly
  ;; Start SBCL via Qlot by default
  (setq inferior-lisp-program "qlot exec sbcl")

  ;; (Optional) name multiple impls; pick with `M-x sly` then `C-u` for prompt
  (setq sly-lisp-implementations
        '((qlot-sbcl ("qlot" "exec" "sbcl"))
          (qlot-ros  ("qlot" "exec" "ros" "-Q" "run")))))
