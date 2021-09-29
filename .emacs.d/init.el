;; Minimalize UI
(setq inhibit-startup-message t) ; Hide startup msg
(scroll-bar-mode -1) ; Disable visible scrollbar
(tool-bar-mode -1)   ; Disable the toolbar
(tooltip-mode -1)    ; Disable tooltips
(set-fringe-mode 10) ; Give some breathing room
(menu-bar-mode -1)   ; Disable the menu bar
(setq visible-bell t) ; Set up visible bell

;; Improve startup performance by reducing the frequency of GC and
;; use a hook to measure Emacs startup time.
(setq gc-cons-threshold (* 50 1000 1000))
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs loaded in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

;; Setup font
(set-face-attribute 'default nil :font "Iosevka" :height 160)

(global-display-line-numbers-mode t)       ; Show line numbers
(setq display-line-numbers-type 'relative) ; Make them relative
(column-number-mode)                       ; Show column in modeline

;; Set tab width, use spaces instead of tabs
(setq-default tab-width 2)
(setq-default evil-shift-width tab-width)
(setq-default indent-tabs-mode nil)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Initialize package sources
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

(setq use-package-always-ensure t) ; Make sure packages are always ensured

;; Load general before evil
(use-package general
  :demand t
  :config
  (general-evil-setup)

  (general-create-definer ab/leader-keys
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "C-SPC")

  (general-create-definer ab/local-leader-keys
    :states '(normal visual)
    :keymaps 'override
    :prefix "SPC m"
    :global-prefix "SPC m")

  (ab/leader-keys
   "SPC" 'find-file
   "b" '(:ignore t :which-key "buffer")
   "g" '(:ignore t :which-key "git") ; Keybindings defined in magit
   "n" '(:ignore t :which-key "notes")
   "p" '(:ignore t :which-key "project")
  ))

(use-package evil
  :init
  ;; Make C-u work
  (setq evil-want-C-u-scroll t)
  (setq evil-want-keybinding nil)
  ;; Move to window when splitting
  (setq evil-split-window-below t)
  (setq evil-vsplit-window-right t)
  :config
  (evil-mode 1)
  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
  ;; Set initial state
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :demand
  :init
  (setq evil-collection-magit-use-z-for-folds nil)
  :config
  (evil-collection-init))

(use-package doom-themes
  :init (load-theme 'doom-one t))

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package magit
  :general
  (ab/leader-keys
    "g g" 'magit-status)
  :custom
    (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package org
  :init
  (setq org-directory "~/NextCloud/Org"
        org-default-notes-file "~/NextCloud/Org/todo.org"
        org-agenda-files (list "~/NextCloud/Org"))
  (setq org-src-preserve-indentation t) ;; do not put two spaces on the left
  :config
  (setq org-ellipsis " ▾"))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

;; TODO:
;; * org + org-roam
;; *  forge
;; * projectile
;; * TODO highlight
;; * rustic
;; * go

;; Based on http://sodaware.sdf.org/notes/emacs-darkmode-theme-switch/
(setq last-dark-mode-state 'unknown)

(defun ab/check-and-set-dark-mode ()
  "Automatically set the theme to match if macOS is in dark mode."
  (let ((dark-mode-enabled (ab/system-dark-mode-enabled-p)))
    (if (not (eq dark-mode-enabled last-dark-mode-state))
        (progn
          (setq last-dark-mode-state dark-mode-enabled)
          (if dark-mode-enabled
              (load-theme 'doom-one       t)
            (load-theme 'doom-one-light t))))))

(defun ab/system-dark-mode-enabled-p ()
  "Check if dark mode is currently enabled on macOS."
  (if (string= system-type "darwin")
      (string=
       (shell-command-to-string "printf %s \"$( osascript -e \'tell application \"System Events\" to tell appearance preferences to return dark mode\' )\"")
       "true")
    nil))

(run-with-timer 0 2 'ab/check-and-set-dark-mode)

;; TODO: WHAT IS THIS??
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(evil-org-mode evil-magit evil-collection which-key projectile rainbow-delimiters magit doom-modeline doom-themes evil use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
