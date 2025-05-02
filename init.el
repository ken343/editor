;;; package --- Summary -*- lexical-binding: t -*-

;;; Commentary:
;;; I don't know what to type.

;;; Code:
(setq visible-bell t)

(when (>= emacs-major-version 28)
  (setq lock-file-name-transforms
        '(("\\`/.*/\\([^/]+\\)\\'" "~/.emacs.d/aux/\\1" t))))
(setq auto-save-file-name-transforms
      '(("\\`/.*/\\([^/]+\\)\\'" "~/.emacs.d/aux/\\1" t)))
(setq backup-directory-alist
      '((".*" . "~/.emacs.d/aux/")))

;; Ensure package initialization if not already done
(require 'package)
(setq package-enable-at-startup nil) ; To avoid initializing twice
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Ensure use-package is installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; LSP setup with lsp-mode and lsp-pyright (Pyright installed globally via npm)
(use-package lsp-mode
  :ensure t
  :hook (python-mode . lsp-deferred)  ; lsp-deferred launches LSP when needed
  :commands (lsp lsp-deferred)
  :config
  (setq lsp-keymap-prefix "C-c l")    ; Optional: set a custom LSP prefix key
  (setq lsp-enable-snippet t))

(use-package lsp-pyright
  :ensure t
  :after lsp-mode
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp-deferred)))   ; Use lsp-deferred for a more responsive startup
  ;; Optional: customize lsp-pyright here
  :config
  (setq lsp-pyright-multi-root nil))

;; Company mode for auto-completion
(use-package company
  :ensure t
  :hook (after-init . global-company-mode)
  :config
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0))  ; immediately show suggestions

;; Flycheck for on-the-fly syntax checking
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;; Blacken for automatic code formatting with Black
(use-package blacken
  :ensure t
  :hook (python-mode . blacken-mode)
  :config
  (setq blacken-line-length 88))

;; pyvenv for managing Python virtual environments
(use-package pyvenv
  :ensure t
  :config
  (pyvenv-mode 1)
  ;; Optionally set the default virtual environment
  ;; (pyvenv-activate "/path/to/your/venv")
  )

;; Optional: automatically activate a venv based on directory
(use-package direnv
  :ensure t
  :config
  (direnv-mode))

;; CUSTOMIZE
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(modus-vivendi-tritanopia))
 '(package-selected-packages '(blacken direnv elpy flycheck ht lsp-mode lsp-pyright lv)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)
;;; init.el ends here
