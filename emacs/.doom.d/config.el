;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;; Introducktion
(setq user-full-name "Jeppe Finne Sørensen"
      user-mail-address "s.jeppe.f@gmail.com")

;;; Packages
;; (require 'counsel)
;; (require 'counsel-fzf)
;; (require 'counsel-M-x)

;;; Theme
(setq doom-theme 'doom-one)
(setq-default fill-column nil)
(setq visual-line-mode t)
(setq global-visual-line-mode t)

;;; Fonts
(setq doom-font (font-spec :family "SauceCodePro Nerd Font" :size 14)
      doom-big-font (font-spec :family "SauceCodePro Nerd Font" :size 18)
      doom-variable-pitch-font (font-spec :family "SauceCodePro Nerd Font" :size 14)
      doom-serif-font (font-spec :family "SauceCodePro Nerd Font" :weight 'light))

;;; Visuals
(setq display-line-numbers-type 'visual)

;;; Saving
;; (desktop-save-mode 1)

;;; Keybindings
;; (load! "keybindings.el")

;; Make evil-mode up/down operate in screen lines instead of logical lines
;; (define-key evil-motion-state-map "j" 'evil-next-visual-line)
;; (define-key evil-motion-state-map "k" 'evil-previous-visual-line)
;; Also in visual mode
;; (define-key evil-visual-state-map "j" 'evil-next-visual-line)
;; (define-key evil-visual-state-map "k" 'evil-previous-visual-line)

;;; MISC
(setq garbage-collection-messages t)
(add-to-list 'org-modules 'org-habit t)

;;; Org mode

(setq org-roam-directory "~/core/wiki")
(add-hook 'after-init-hook 'org-roam-mode)

(after! org
(setq org-directory "~/core/organisation")
(setq org-archive-location "~/core/organisation/.archive.org::datetree/")
(setq org-startup-folded 't)
(custom-set-variables
 '(org-directory "~/core/organisation")
 '(org-agenda-files (list org-directory)))
 ;; '(org-directory "~/core/organisation/todohome.org ~/core/organisation/todoprojects.org ~/core/organisation/appointments.org ~/core/organisation/habits.org ~/core/organisation/ideas.org ~/core/organisation/owe.org ~/core/organisation/questions.org")
(custom-set-faces
  '(org-level-1 ((t (:inherit outline-1 :height 1.2))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.1))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
)
(setq org-capture-templates '(
        ("n" "Note" entry
         (file+datetree "notes.org")
         "* %?")
        ("i" "Idea" entry
         (file+datetree "notes.org")
         "* TODO %? %^{SCHEDULED}p :IDEA:")
        ("a" "Appointment" entry
         (file+headline "appointments.org" "Diverse Aftaler")
         "* %?\n%^T")
        ))
)
;; (setq org-capture-templates
;;       '("t" "Ideas"))


;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
