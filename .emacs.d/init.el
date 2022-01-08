;; If you aint got package "package", Cant help ya
(require 'package)

;; Adding melpa to package sources, which also generates the list of available packages
(add-to-list 'package-archives
	    '("melpa" . "https://melpa.org/packages/" ) )

;; Grab necessary packages
(package-initialize)


;; If not already installed, install use package
(unless (package-installed-p 'use-package )
  (package-install 'use-package ) )

;; Import use-package
(require 'use-package )

(use-package evil :ensure t )
(use-package evil-commentary :ensure t )
(use-package org :ensure t )
(use-package gruvbox-theme :ensure t )
(use-package powerline :ensure t )
(use-package smart-mode-line :ensure t )
(use-package smart-mode-line-powerline-theme :ensure t )
(use-package general :ensure t )
(use-package ivy :ensure t )
(use-package counsel :ensure t )
(use-package swiper :ensure t )
(use-package which-key :ensure t )
(use-package ace-window :ensure t )
;; (use-package eaf
;;   :load-path "~/.emacs.d/site-lisp/emacs-application-framework" ; Set to "/usr/share/emacs/site-lisp/eaf" if installed from AUR
;;   :custom
;;   ; See https://github.com/emacs-eaf/emacs-application-framework/wiki/Customization
;;   (eaf-browser-continue-where-left-off t)
;;   (eaf-browser-enable-adblocker t)
;;   (browse-url-browser-function 'eaf-open-browser)
;;   :config
;;   (defalias 'browse-web #'eaf-open-browser)
;;   (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
;;   (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
;;   (eaf-bind-key take_photo "p" eaf-camera-keybinding)
;;   (eaf-bind-key nil "M-q" eaf-browser-keybinding)
;;   )


;; Bindings
(require 'evil )
(require 'evil-commentary )
(define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop)

;; Modes
(require 'org )

;; Looks
(require 'gruvbox-theme )
(require 'powerline )
(require 'smart-mode-line )
(require 'smart-mode-line-powerline-theme )


;; General (literally)
(require 'general)
(require 'counsel)
(require 'ivy)

;; EAF
;; (require 'eaf)
;; (require 'eaf-browser)

;; Start up screen
;; (setq inhibit-startup-screen t )	
;; (setq initial-scratch-message "") 
(setq delete-old-versions -1 )		; delete excess backup versions silently


;; Setting up powerline
(powerline-default-theme)
;; (setq powerline-arrowshape 'curve )
;; (setq powerline-default-seperator-dir '( right . left ))
;; (setq sml/theme ')
;; (sml/setup)

;; Initializing major modes
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(evil-mode 1)
(evil-commentary-mode 1)

;; Loading "config" files
(load "~/.emacs.d/edit.el" )
(load "~/.emacs.d/looks.el" )
(load "~/.emacs.d/keybind.el" )

;; Emacs's own problem

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "6b5c518d1c250a8ce17463b7e435e9e20faa84f3f7defba8b579d4f5925f60c1" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "d14f3df28603e9517eb8fb7518b662d653b25b26e83bd8e129acea042b774298" default))
 '(package-selected-packages
   '(evil-commentary smart-mode-line-powerline-theme ace-window smart-mode-line evil))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrains Mono" :foundry "JB" :slant normal :weight normal :height 90 :width normal))))
 '(line-number ((t (:foreground "#7c6f64")))))
