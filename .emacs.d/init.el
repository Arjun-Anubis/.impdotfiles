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


; (setq use-package-always-ensure t)
(use-package evil
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-fine-undo 'fine)
  :config
  (evil-mode 1))
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))
(use-package evil-commentary
  :config
  (evil-commentary-mode 1))
(use-package org )
(use-package evil-org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (setq evil-org-use-additional-insert t))
  (evil-org-set-key-theme '(navigation insert todo textobjects additional calendar shift heading))
(use-package gruvbox-theme )
(use-package spaceline
  :config
  (spaceline-spacemacs-theme))
(use-package general )
(use-package ivy )
(use-package counsel )
(use-package swiper )
(use-package which-key
	:config
	(which-key-mode 1))
(use-package ace-window )
(use-package evil-surround
  :config
  (global-evil-surround-mode 1))
(use-package company
  :init
  (setq company-idle-delay nil)
  :config
  (global-company-mode 1))

(add-hook 'org-mode-hook                                                                      
          (lambda ()                                                                          
        (define-key evil-normal-state-map (kbd "TAB") 'org-cycle))) 

;; (setq initial-buffer-choice "~/general/TODO.org")
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)" "DOING(g!)")))
;; (add-hook 'find-file-hook
;; 		  (lambda()
;; 			(setq default-directory command-line-default-directory)))

;; Initializing major modes
;; (rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Loading "config" files
(load "~/.emacs.d/edit.el" )
(load "~/.emacs.d/keybind.el" )
(load "~/.emacs.d/looks.el" )


(setq split-function 'split-window-right)



;; Some functions to define
(defun efs/exwm-update-class ()
  (exwm-workspace-rename-buffer exwm-class-name))

(defun exwm-move-window-to-workspace(workspace-number)
  (interactive)
  (let ((frame (exwm-workspace--workspace-from-frame-or-index workspace-number))
        (id (exwm--buffer->id (window-buffer))))
    (exwm-workspace-move-window frame id)))

(defun exwm-open-vertical-split (s)
  (interactive "sProgram: ")
  (split-window-right)
  (other-window 1)
  (start-process-shell-command s nil s))

(defun open-in-vsplit()
  (interactive)
  (funcall split-function)
  (other-window 1)
  (helm-run-external-command))

(defmacro csetq (variable value)
  `(funcall (or (get ',variable 'custom-set)
                'set-default)
            ',variable ,value))

(defun open-shell-command(s)
  (start-process-shell-command s nil s))


(when (get-buffer "*window-manager*")
  (kill-buffer "*window-manager*"))
(when (get-buffer "*window-manager-error*")
  (kill-buffer "*window-manager-error*"))
(when (executable-find "wmctrl")
  (shell-command "wmctrl -m ; echo $?" "*window-manager*" "*window-manager-error*"))

  ;; if there was an error detecting the window manager, initialize EXWM
  (when (and (get-buffer "*window-manager-error*")
             (eq window-system 'x))
    ;; exwm startup goes here

(use-package exwm
  :config
  (setq exwm-workspace 5)
  (csetq exwm-input-global-keys `(
								 (,(kbd "s-f") . exwm-layout-toggle-fullscreen)
								 (,(kbd "s-v") . (lambda () (interactive) (setq split-function 'split-window-right)))
								 (,(kbd "s-g") . (lambda () (interactive) (setq split-function 'split-window-bottom)))
								 (,(kbd "s-w") . exwm-workspace-switch)
								 (,(kbd "s-R") . exwm-reset)
								 (,(kbd "s-Q") . evil-quit)

								 (,(kbd "s-h") . windmove-left)
								 (,(kbd "s-j") . windmove-down)
								 (,(kbd "s-k") . windmove-up)
								 (,(kbd "s-l") . windmove-right)

								 (,(kbd "s-H") . evil-window-move-far-left)
								 (,(kbd "s-J") . evil-window-move-very-bottom)
								 (,(kbd "s-K") . evil-window-move-very-top)
								 (,(kbd "s-L") . evil-window-move-far-right)

								 (,(kbd "s-<RET>") . eshell)
								 (,(kbd "M-<SPC>") . helm-run-external-command)
								 (,(kbd "s-<SPC>") . open-in-vsplit)

								 (,(kbd "M-E") . evil-window-map)
								 (,(kbd "M-D") . counsel-switch-buffer)

								 (,(kbd "M-W") . (lambda () (interactive) (open-shell-command "qutebrowser")))
								 (,(kbd "s-A") . (lambda () (interactive) (open-shell-command "whatsapp")))
								 (,(kbd "s-S") . (lambda () (interactive) (open-shell-command "ss portion")))
								 (,(kbd "M-S") . (lambda () (interactive) (open-shell-command "ss")))

								 (,(kbd "C-M-<delete>") . (lambda () (interactive) (open-shell-command "poweroff")))

								 (,(kbd "<XF86AudioPlay>") . (lambda () (interactive) (open-shell-command "mpc toggle")))
								 (,(kbd "<XF86AudioNext>") . (lambda () (interactive) (open-shell-command "mpc next")))
								 (,(kbd "<XF86AudioPrev>") . (lambda () (interactive) (open-shell-command "mpc prev")))
								 (,(kbd "<XF86AudioStop>") . (lambda () (interactive) (open-shell-command "mpc stop")))
								 

								 (,(kbd "<XF86AudioRaiseVolume>") . (lambda () (interactive)
																	  (open-shell-command "pactl -- set-sink-colume 0 +5%")))
								 (,(kbd "<XF86AudioLowerVolume>") . (lambda () (interactive)
																	  (open-shell-command "pactl -- set-sink-colume 0 -5%")))
								 (,(kbd "<XF86AudioMute>") . (lambda () (interactive)
															   (open-shell-command "pactl set-sink-mute 0 toggle")))


								 ,@(mapcar (lambda (i)
											  `(,(kbd (format "s-%d" i)) . (lambda ()
																				 (interactive)
																				 (exwm-workspace-switch-create ,i))))
										   (number-sequence 0 9))
								 ,@(mapcar (lambda (i)
											  `(,(kbd (format "s-C-%d" i)) . (lambda ()
																				 (interactive)
																				 (exwm-move-window-to-workspace ,i))))
										   (number-sequence 0 9))
								 
								 ))

  (add-hook 'exwm-update-class-hook
			(lambda ()
			  (exwm-workspace-rename-buffer exwm-class-name)))



  ;; Startup programs

  (start-process-shell-command "mopidy" nil "systemctl --user restart mopidy")

 (require 'exwm-systemtray)
  (exwm-systemtray-enable)
  (exwm-enable)))

(require 'org-download)

;; Drag-and-drop to `dired`
(add-hook 'dired-mode-hook 'org-download-enable)

(spaceline-toggle-workspace-number-on)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-safe-themes '("7661b762556018a44a29477b84757994d8386d6edee909409fabe0631952dad9" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "6b5c518d1c250a8ce17463b7e435e9e20faa84f3f7defba8b579d4f5925f60c1" default))
 '(package-selected-packages '(evil-surround which-key use-package smart-mode-line-powerline-theme org-bullets helm gruvbox-theme general evil-commentary evil-collection counsel ace-window))
 '(pdf-view-midnight-colors '("#fdf4c1" . "#1d2021")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default))
 '(helm-minibuffer-history-key "M-p")
 '(org-agenda-files '("~/general/TODO.org"))
 '(package-selected-packages
   '(telephone-line command-log-mode rainbow-delimiters exwm-x exwm spaceline evil-org company fzf org-present auto-complete org-download org-attach-screenshot which-key use-package smart-mode-line-powerline-theme org-bullets helm gruvbox-theme general evil-surround evil-commentary evil-collection counsel ace-window))
 '(sml/mode-width (if (eq (powerline-current-separator) 'arrow) 'right 'full))
 '(sml/pos-id-separator
   '(""
	 (:propertize " " face powerline-active1)
	 (:eval
	  (propertize " " 'display
				  (funcall
				   (intern
					(format "powerline-%s-%s"
							(powerline-current-separator)
							(car powerline-default-separator-dir)))
				   'powerline-active1 'powerline-active2)))
	 (:propertize " " face powerline-active2)))
 '(sml/pos-minor-modes-separator
   '(""
	 (:propertize " " face powerline-active1)
	 (:eval
	  (propertize " " 'display
				  (funcall
				   (intern
					(format "powerline-%s-%s"
							(powerline-current-separator)
							(cdr powerline-default-separator-dir)))
				   'powerline-active1 'sml/global)))
	 (:propertize " " face sml/global)))
 '(sml/pre-id-separator
   '(""
	 (:propertize " " face sml/global)
	 (:eval
	  (propertize " " 'display
				  (funcall
				   (intern
					(format "powerline-%s-%s"
							(powerline-current-separator)
							(car powerline-default-separator-dir)))
				   'sml/global 'powerline-active1)))
	 (:propertize " " face powerline-active1)))
 '(sml/pre-minor-modes-separator
   '(""
	 (:propertize " " face powerline-active2)
	 (:eval
	  (propertize " " 'display
				  (funcall
				   (intern
					(format "powerline-%s-%s"
							(powerline-current-separator)
							(cdr powerline-default-separator-dir)))
				   'powerline-active2 'powerline-active1)))
	 (:propertize " " face powerline-active1)))
 '(sml/pre-modes-separator (propertize " " 'face 'sml/modes)))
