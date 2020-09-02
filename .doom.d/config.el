;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq doom-theme 'doom-solarized-light)
(setq doom-font (font-spec :family "Iosevka" :size 14 :weight 'regular))

(setq org-agenda-files '("~/org"))
(setq org-roam-directory "~/org/notes")
(setq org-roam-index-file "index.org")
(setq org-roam-graph-viewer "/Applications/Firefox.app/Contents/MacOS/firefox")

(setq mac-right-option-modifier nil) ;; Enable right alt-key for special chars

(require 'org-roam-protocol)
