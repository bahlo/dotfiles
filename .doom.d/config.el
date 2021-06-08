;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-theme 'doom-one-light)
(setq doom-font (font-spec :family "Iosevka" :size 15 :weight 'regular))

(setq org-roam-directory "~/Developer/GitHub/knowledge")

(setq mac-right-option-modifier nil) ;; Enable right alt-key for special chars

(setq display-line-numbers-type 'relative)

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
