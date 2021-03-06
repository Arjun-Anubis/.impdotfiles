;; (defun add-to-map(keys func)
;;   "Add a keybinding in evil mode from keys to func."
;;   (define-key evil-normal-state-map (kbd keys) func)
;;   (define-key evil-motion-state-map (kbd keys) func))

;; ;; Defining leader as none.
;; (add-to-map "<SPC>" nil )

;; ;; M-x
;; (add-to-map "<SPC> <SPC>" 'counsel-M-x )

;; ;; Files, with helm *
;; (add-to-map "<SPC> e" 'find-file )

;; ;; Buffers, with helm
;; (add-to-map "<SPC> o" 'helm-buffers-list )

;; (add-to-map "<SPC> w" 'ace-window )

(general-evil-define-key 'normal 'global
 :prefix "SPC"
 ;; prefix=space
    "<SPC>"  'counsel-M-x
    "e"      'counsel-file-jump
    "o"      'ivy-switch-buffer
    "r"      'counsel-recentf
 )
