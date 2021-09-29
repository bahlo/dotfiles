;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-theme 'doom-one-light)
(setq doom-font (font-spec :family "PragmataPro Mono Liga" :size 15 :weight 'regular))

(setq org-directory "~/NextCloud/Org")
(setq org-agenda-files (list org-directory))
(setq org-roam-directory "~/Developer/GitHub/knowledge")
(setq org-src-preserve-indentation t) ;; do not put two spaces on the left
(setq org-ellipsis " ▾")

;; Remove meta mapping
(setq mac-option-key-is-meta nil)
; (setq mac-command-key-is-meta t)
; (setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; Make s behave like Vim
;; https://github.com/hlissner/doom-emacs/issues/1642#issuecomment-518711170
(after! evil-snipe
  (evil-snipe-mode -1))

(setq display-line-numbers-type 'relative)

; Add ruler
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)
(setq display-fill-column-indicator-column 80)

; Neotree icons
(after! doom-themes
  (remove-hook 'doom-load-theme-hook #'doom-themes-neotree-config))
(setq neo-theme 'icons)

; Italic comments
(custom-set-faces!
  '(font-lock-comment-face :slant italic))

(defun ab/org-insert-link-dwim ()
  "Like `org-insert-link' but with personal dwim preferences."
  ; Thanks to https://xenodium.com/emacs-dwim-do-what-i-mean/
  (interactive)
  (let* ((point-in-link (org-in-regexp org-link-any-re 1))
         (clipboard-url (when (string-match-p "^http" (current-kill 0))
                          (current-kill 0)))
         (region-content (when (region-active-p)
                           (buffer-substring-no-properties (region-beginning)
                                                           (region-end)))))
    (cond ((and region-content clipboard-url (not point-in-link))
           (delete-region (region-beginning) (region-end))
           (insert (org-make-link-string clipboard-url region-content)))
          ((and clipboard-url (not point-in-link))
           (insert (org-make-link-string
                    clipboard-url
                    (read-string "title: "
                                 (with-current-buffer (url-retrieve-synchronously clipboard-url)
                                   (dom-text (car
                                              (dom-by-tag (libxml-parse-html-region
                                                           (point-min)
                                                           (point-max))
                                                          'title))))))))
          (t
           (call-interactively 'org-insert-link)))))

(map! :leader
      :desc "org-insert-link-dwim"
      "m l l" #'ab/org-insert-link-dwim)

; Based on http://sodaware.sdf.org/notes/emacs-darkmode-theme-switch/
(setq last-dark-mode-state 'unknown)

(defun check-and-set-dark-mode ()
  "Automatically set the theme to match if macOS is in dark mode."
  (let ((dark-mode-enabled (system-dark-mode-enabled-p)))
    (if (not (eq dark-mode-enabled last-dark-mode-state))
        (progn
          (setq last-dark-mode-state dark-mode-enabled)
          (if dark-mode-enabled
            (load-theme 'doom-one       t)
            (load-theme 'doom-one-light t))))))

(defun system-dark-mode-enabled-p ()
  "Check if dark mode is currently enabled on macOS."
  (if (string= system-type "darwin")
      (string=
       (shell-command-to-string "printf %s \"$( osascript -e \'tell application \"System Events\" to tell appearance preferences to return dark mode\' )\"")
       "true")
      nil))

(run-with-timer 0 2 'check-and-set-dark-mode)
