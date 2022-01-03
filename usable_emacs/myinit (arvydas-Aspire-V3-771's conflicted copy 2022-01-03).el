;; Who I am

;; be able to create directories in neotree
(global-set-key (kbd "C-c d") 'make-directory)

(setq user-full-name "Arvydas Gasparavicius")
(setq user-mail-address "arvydas.gaspa@gmail.com")
  ;; the blinking cursor is nothing, but an annoyance
  (blink-cursor-mode 0)

  ;; highlight the current line
  (global-hl-line-mode 1)

  ;; writes parens automatically for you
  (electric-pair-mode +1)  

  (menu-bar-mode -1)            ; Disable the menu bar
  (tool-bar-mode -1)          ; Disable the toolbar
  (toggle-scroll-bar -1) ; turn off scrollbar
  (show-paren-mode 1) ; highlight parenthesis

  ;; Show matching parens
  (setq show-paren-delay 0)

  ;; enable y/n answers
  (fset 'yes-or-no-p 'y-or-n-p)

  ;; Set up the visible bell
  (setq visible-bell t)

  ;; nice scrolling
	(setq scroll-margin 0
	  scroll-conservatively 100000
	  scroll-preserve-screen-position 1)

  ;; never loseqq the layout c-c left/right
  (winner-mode 1)

  ; display line numbers - finally...
  (global-display-line-numbers-mode 1) 

  (add-to-list 'custom-theme-load-path "~/Dropbox/temp_emacs/themes/")
  (load-theme 'zenburn t)
  ;; (load-theme 'vscode-dark-plus t)

(use-package ace-window
    :ensure t
    :init (setq aw-keys '(?q ?w ?e ?r ?y ?h ?j ?k ?l)
;		aw-ignore-current t ; not good to turn off since I wont be able to do c-o o <current>
		aw-dispatch-always t)
    :bind (("C-x o" . ace-window)
	   ("M-O" . ace-swap-window)
	   ("C-x v" . aw-split-window-horz)))
  (defvar aw-dispatch-alist
  '((?x aw-delete-window " Ace - Delete Window")
      (?m aw-swap-window " Ace - Swap Window")
      (?n aw-flip-window)
      (?h aw-split-window-vert " Ace - Split Vert Window")
      (?v aw-split-window-horz " Ace - Split Horz Window")
      (?i delete-other-windows " Ace - Maximize Window")
      (?o delete-other-windows))
  "List of actions for `aw-dispatch-default'.")

;; Find my NEW init file
(global-set-key (kbd "C-x <C-backspace>") 'aga-find-current)
;; Easily jump to my main org file
(defun aga-find-current nil
  "Find the myinit.org file."
  (interactive)
  (find-file "~/Dropbox/temp_emacs/myinit.org")
  (delete-other-windows))
;; Find OLD init file
(global-set-key (kbd "C-x <C-home>") 'aga-find-old)
;; Easily jump to my main org file
(defun aga-find-old nil
  "Find the myinit.org file."
  (interactive)
  (find-file "~/Dropbox/7.dotfiles/emacs/myinit.org")
  (delete-other-windows))

(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  (setq which-key-idle-delay 0.2)
  :config
  (which-key-mode 1))

;; saveplace remembers your location in a file when saving files
(use-package saveplace
  :ensure t
  :config
  ;; activate it for all buffers
  (setq-default save-place t)
  (save-place-mode 1)
)

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

(use-package undo-tree
:ensure t
:init
(global-undo-tree-mode))

;; Counsel, a collection of Ivy-enhanced versions of common Emacs commands.
(use-package counsel
:ensure t
:after ivy
:config (counsel-mode))

;; Company provides autosuggestion/completion in buffers (writing code, pathing to files, etc).
;; press <f1> to display the documentation for the selected candidate
;; or C-w to see its source
  (use-package company
    :ensure t
    :config
    (setq company-idle-delay 0) ; lb svarbu, instant suggestion
    ;; (setq company-show-numbers t)  
    (setq company-tooltip-limit 10)
    (setq company-minimum-prefix-length 2)
    (setq company-tooltip-align-annotations t)
    ;; invert the navigation direction if the the completion popup-isearch-match
    ;; is displayed on top (happens near the bottom of windows)
    (setq company-tooltip-flip-when-above t)
    (global-company-mode))

;Default
(setq default-directory "~/Dropbox/1.planai/")
;Backups
(setq backup-directory-alist '(("." . "~/Dropbox/temp_emacs/MyEmacsBackups")))

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (setq projectile-completion-system 'ivy)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

;; install git first on emacs - https://www.youtube.com/watch?v=ZMgLZUYd8Cw
;; use personal access token
;; add this to terminal to save the token for furher use
;; git config --global credential.helper store
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
         ("C-x C-g" . magit-status)))

;; ace window integration - BUTINA
(use-package super-save
  :ensure t
  :config
  (setq super-save-auto-save-when-idle t)
  (setq super-save-idle-duration 5) ;; after 5 seconds of not typing autosave
  ;; add integration with ace-window
  (add-to-list 'super-save-triggers 'ace-window)
  (super-save-mode +1))

(use-package avy
	  :ensure t
	  :bind 
	  (("M-s" . avy-goto-char-timer)
    ;;	     ("M-g f" . avy-goto-line)
		 ("M-p" . avy-goto-word-1)))
;;  You can check the avy home page for their recommended configuration which you get by configuring this way instead:
    ;; (use-package avy
    ;; :ensure t
    ;; :config
    ;; (avy-setup-default))
    (setq avy-background t) ; cool, makes the background darker

(use-package move-text
  :ensure t)
(move-text-default-bindings)

;; simple explanation https://github.com/skeeto/impatient-mode
;; M-x httpd-start - or maybe directory would be nice
;; M-x impatient-mode - on EACH and EVERY file (css, js and hmtl)
(use-package impatient-mode
  :ensure t
  :commands impatient-mode)

;; Ivy is a generic completion mechanism for Emacs.
(use-package ivy
:defer 0.1
:diminish
:bind (("C-c C-r" . ivy-resume)
("C-x B" . ivy-switch-buffer-other-window))
:custom

(ivy-count-format "(%d/%d) ")
;; nice if you want before opened buffers to appear after a close
(ivy-use-virtual-buffers t)
:config (ivy-mode))

(use-package ivy-rich
:ensure t
:init (ivy-rich-mode 1))

;; Swiper, an Ivy-enhanced alternative to Isearch.
(use-package swiper
:after ivy
:bind (("C-s" . swiper)
       ("C-r" . swiper)))

(use-package neotree
:ensure t
:init
(setq neo-smart-open t
neo-autorefresh t
neo-force-change-root t)
(setq neo-theme (if (display-graphic-p) 'icons global))
(setq neo-window-width 35)
(global-set-key [f8] 'neotree-toggle))

;; jeigu neveikia icons - prasau, paaiskinimas
;; https://github.com/seagle0128/all-the-icons-ivy-rich
(use-package all-the-icons-ivy-rich
:ensure t
:init (all-the-icons-ivy-rich-mode 1))

; deletes all the whitespace when you hit backspace or delete
  (use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode))

;; SU WEB MODE KRC PRADEDA flycheck nebeveikti ir emmet durniuoja
;; for quickly entering HTML
;; c-j to autocomplete 
;; cheat sheet - https://docs.emmet.io/cheat-sheet/
(use-package emmet-mode
:ensure t
:config
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode)) ;; enable Emmet's css abbreviation.
