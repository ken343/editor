;; INIT FILE

;; (scroll-bar-mode -1) ; Remove scroll bar
(tool-bar-mode -1)      ; Disable the toolbar
(tooltip-mode -1)       ; Disable the tooltips
(set-fringe-mode 10)    ; Give some breathing room
(menu-bar-mode -1)      ; Disable the menu bar

(setq visual-bell t)

(set-face-attribute 'default nil :font "Ubuntu Mono" :height 180)

(load-theme 'tango-dark)

;; Escape will quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Initialize package sources
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Make sure to reload a package unless it exists already
(unless package-archive-contents
  (package-refresh-contents))

;; Make sure use-package is installed on non-linux systems
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-alwayse-ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
