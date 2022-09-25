;; Variable setup
(set-charset-priority 'unicode)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

;; Weird Versions with #name#
(setq delete-old-versions t )	
;; Tabs in one backspace
(setq backward-delete-char-untabify-method 'hungry)
;; Remember location
(save-place-mode 1)
;; Line Numbers
(setq display-line-numbers-type 'relative )
(global-display-line-numbers-mode)
;; Tabs
(setq-default
	c-basic-offset 4
	tab-width 4
	indent-tabs-mode t)
(setq indent-line-function 'insert-tab )
(setq ac-auto-start nil)

