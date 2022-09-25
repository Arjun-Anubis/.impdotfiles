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

 ;; (general-evil-define-key 'normal 'global
 ;; :prefix "SPC"
 ;; ;; prefix=space
 ;;    "<SPC>"  'counsel-buffer-or-recentf
 ;;    "l"  'counsel-M-x
 ;;    ;; "e"      'counsel-find-file
 ;;    "o"      'counsel-buffer-or-recentf
 ;;    "e"      'helm-find-files
 ;;    "r"      'counsel-recentf
 ;; 	"h"      'counsel-describe-function
 ;; 	"w"      'evil-window-map
 ;; 	"x"      'evil-quit
 ;; 	"f"      'counsel-find-file
 ;; )

(general-create-definer global-definer
  :keymaps 'override
  :states  '(insert emacs normal hybrid motion visual operator)
  :prefix  "SPC"
  :non-normal-prefix "C-SPC")

(defmacro +general-global-menu! (name infix-key &rest body)
  "Create a definer named +general-global-NAME wrapping global-definer.
Create prefix map: +general-global-NAME. Prefix bindings in BODY with INFIX-KEY."
  (declare (indent 2))
  `(progn
     (general-create-definer ,(intern (concat "+general-global-" name))
       :wrapping global-definer
       :prefix-map (quote ,(intern (concat "+general-global-" name "-map")))
       :infix ,infix-key
       :wk-full-keys nil
       "" '(:ignore t :which-key ,name))
     (,(intern (concat "+general-global-" name))
      ,@body)))

(global-definer
  "<SPC>"    'counsel-buffer-or-recentf
  "l"        'counsel-M-x
  "o"        'counsel-buffer-or-recentf
  "i"        'counsel-switch-buffer
  "h"        'counsel-describe-function
  "x"        'evil-quit
  "w"        'evil-window-map
  "d"        'helm-run-external-command)

(evil-define-key 'insert 'global
  (kbd "C-p") 'company-complete )

(global-set-key (kbd "C-<SPC>") 'counsel-M-x )
