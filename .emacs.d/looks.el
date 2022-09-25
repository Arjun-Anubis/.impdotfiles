;; Cursor
(blink-cursor-mode -1)
(setq evil-normal-state-cursor '( box "grey" ))
(setq evil-insert-state-cursor '( box "white" ))
(setq evil-visal-state-cursor '( box "orange" ))
(setq evil-replace-state-cursor '( box "lightblue" ))

;; Clean
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Org mode
(setq org-hide-emphasis-markers t
	org-startup-indented t
	org-pretty-entities t
	org-startup-with-inline-images t)


( load-theme 'gruvbox-dark-hard t )

;; Theme
(set-face-extend 'org-block t)
(set-face-extend 'org-block-begin-line t)
(set-face-extend 'org-block-end-line t)


;; (custom-set-faces '(mode-line nil
;;                     :foreground "Black"
;;                     :background "DarkOrange"))
;; (set-face-attribute 'powerline-active1 nil
;; 					:background "#b8bb26"
;; 					:foreground "1c1c1c")
;; ;; (set-face-attribute 'powerline-active2 nil
;; ;; 					:background "#261c15")
;; (set-face-attribute 'mode-line nil
;; 					:background "#83a598"
;; 					:foreground "#ffffff")

(setq spaceline-separator-dir-left '(left . left))
(setq spaceline-separator-dir-right '(right . right))
(powerline-reset)


(set-face-attribute 'default nil
                   :family "JetBrains Mono"
                   :weight 'normal
                   :width 'normal
				   :height 90)

(set-face-background 'line-number "#1d2021" )
(set-face-foreground 'line-number "#fe8019" )
