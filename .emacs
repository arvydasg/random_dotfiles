;; Basics
(setq inhibit-startup-screen t)
(setq inhibit-splash-screen t)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
;;-----------------------------------------------------------------------------------------------
;; download the theme (.el) to that folde. 
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;;-----------------------------------------------------------------------------------------------
;; theme
(load-theme 'zenburn t)
;;-----------------------------------------------------------------------------------------------
;; for evil - this video - https://www.youtube.com/watch?v=V27zOhfN8Ys
;; Set up package.el to work with MELPA
(package-initialize)
(require 'package)
(require 'use-package) ;another package-manager. not only downloads but installs
(package-initialize)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://stable.melpa.org/packages/"))
;;-----------------------------------------------------------------------------------------------
(use-package evil
  :ensure t
  :config
  (evil-mode 1)) ;;enabling evil mode
  (evil-escape-mode)


;; for evil-escape - to use kj as ESC
;; the link - https://github.com/syl20bnr/evil-escape
;; install - M-x package-install RET evil-escape RET
;; toggle on - M-x evil-escape-mode

(setq-default evil-escape-key-sequence "kj")
;; all this to make ctrl+u to work
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-insert-state-map (kbd "C-u")
  (lambda ()
    (interactive)
    (evil-delete (point-at-bol) (point))))
;;-----------------------------------------------------------------------------------------------
;; undo tree
(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))
(setq evil-undo-system 'undo-tree) 
(define-key evil-normal-state-map (kbd "C-r") 'undo-tree-redo)
(define-key evil-normal-state-map (kbd "u") 'undo-tree-undo)
;;-----------------------------------------------------------------------------------------------
;; todo states
(setq org-todo-keywords
      '((sequence "TODO" "IN PROGRESS" "|" "DONE" "ABANDONED")))
;;-----------------------------------------------------------------------------------------------
(use-package which-key
  :ensure t
  :config (which-key-mode))
;;-----------------------------------------------------------------------------------------------
;; Set initial screen to bookmark list. must have inhibit startup screen that you see at the top
(require 'bookmark)
(bookmark-bmenu-list)
(switch-to-buffer "*Bookmark List*")
;;-----------------------------------------------------------------------------------------------
;; word wrap:
(global-visual-line-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-safe-themes
   (quote
    ("ea5822c1b2fb8bb6194a7ee61af3fe2cc7e2c7bab272cbb498a0234984e1b2d9" "ac9bc68e802bf2384a26a281d485104af8cfcf4055de21dcf77dc75785d8eeb2" default)))
 '(org-agenda-files (quote ("~/Dropbox/timesheet.org")) t)
 '(package-selected-packages
   (quote
    (helm company org-bullets phps-mode undo-tree which-key use-package evil-escape))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Org-mode stuff
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; quite nice, tells you when the task has been finished when you say DONE on it
(setq org-log-done t)
(setq org-agenda-files '("~/Dropbox/projects.org"
			 "~/Dropbox/timesheet.org"))
(global-set-key (kbd "C-c a") 'org-agenda)


;; AUTOCOMPLETION

;; Company auto completion
(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))

;; FUZZY FILE SEARCH

;; IDO mode
;;(setq ido-everywhere t)
;;(setq ido-enable-flex-matching t)

;;(ido-mode t)

(use-package helm
  :ensure t
  :config (helm-mode 1))
