;;; keybindings.el -*- lexical-binding: t; -*-

;;; Set ctrl+hjkl to move in insert mode
; (map! :after evil-org
; 			:map evil-org-mode-map
; 			:m j)
; (define-key evil-org-mode-map (kbd "<insert-state> C-l") 'evil-forward-char)
; (define-key evil-org-mode-map (kbd "<insert-state> C-k") 'evil-previous-line)
; (define-key evil-org-mode-map (kbd "<insert-state> C-j") 'evil-next-line)
; (define-key evil-org-mode-map (kbd "<insert-state> C-h") 'evil-backward-char)
; (define-key evil-insert-state-map (kbd "C-l") 'nil)
; (define-key evil-insert-state-map (kbd "C-k") 'nil)
; (define-key evil-insert-state-map (kbd "C-j") 'nil)
; (define-key evil-insert-state-map (kbd "C-h") 'nil)
(define-key evil-insert-state-map (kbd "C-l") 'evil-forward-char)
(define-key evil-insert-state-map (kbd "C-k") 'evil-previous-line)
(define-key evil-insert-state-map (kbd "C-j") 'evil-next-line)
(define-key evil-insert-state-map (kbd "C-h") 'evil-backward-char)
