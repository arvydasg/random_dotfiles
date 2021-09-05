(unless (package-installed-p 'use-package)
 (package-install 'use-package))
  ;; Who I am
  (setq user-full-name "Arvydas Gasparavicius")
  (setq user-mail-address "arvydas.gaspa@gmail.com")
  ;; The default is to wait 1 second, which I find a bit long
  (setq echo-keystrokes 0.1)
  (setq inhibit-startup-screen t)
  (setq inhibit-splash-screen t)
  ;;(tool-bar-mode -1)
  ;; Don't let Emacs hurt your ears
  (setq visible-bell t)
  (fringe-mode 0) ;; no gaps from the left side
  ;; Always use "y" for "yes"
  (fset 'yes-or-no-p 'y-or-n-p)
  (setq tab-always-indent 'always)
  (setq visible-bell t)
  (setq ring-bell-function 'ignore)
  ;; Below makes it so that the dired buffer auto-updates.
  (setq dired-auto-revert-buffer t)
  ;; marking 80 characters in this way
  (setq-default header-line-format
		(list " " (make-string 80 ?-) "|"))
  ;; hide src blocks by default
  (add-hook 'org-mode-hook 'org-hide-block-all)
  (setq org-log-note-clock-out t)
  (setq org-clock-into-drawer "CLOCK")
  ;; quite nice, tells you when the task has been finished when you say DONE on it
  (setq org-log-done t)
;; nesuprantu <s nebeveikia kazkodel irasius councl/ivy/swiper dalykus. ale sprendimas below
;;(require 'org-tempo) ;; del <s krc, on thinkpad doesnt work, only with this enabled
;; for changing the org inline image display width
 (setq org-image-actual-width nil)
;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)
;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)
;; quit Emacs directly even if there are running processes
(setq confirm-kill-processes nil)
;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)
;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)
;; maximize the initial frame automatically
;; (add-to-list 'initial-frame-alist '(fullscreen . maximized))
;; Newline at end of file
(setq require-final-newline t)
;; Wrap lines at 80 characters
(setq-default fill-column 80)
;; smart tab behavior - indent or complete
(setq tab-always-indent 'complete)

;; the blinking cursor is nothing, but an annoyance
(blink-cursor-mode 0)
(global-hl-line-mode 1)
(global-display-line-numbers-mode)
(tool-bar-mode 0)
(menu-bar-mode 0)
(winner-mode 1) ;; never loseqq the layout c-c left/right
(global-set-key [f7] 'winner-undo)
(global-set-key [C-f7] 'winner-redo)
(global-set-key [f9] 'delete-other-windows)
(global-set-key [C-f9] 'delete-window)
(toggle-scroll-bar 0)
(electric-pair-mode +1)  ;;match parens automatically
;; Show matching parens
(setq show-paren-delay 0)
(show-paren-mode 1)
;; simple message if you really want to quit
;; (setq confirm-kill-emacs 'y-or-n-p)
;; nicer version let me ask question myself
(add-hook 'kill-emacs-query-functions
(lambda () (y-or-n-p "Have you clocked-out mate?"))
'append)
;;  (ido-mode 1)
;; saving desktops not the best way
;; (desktop-save-mode 1)
;; (setq desktop-path '("~/Dropbox/doviliukas/emacs-html/"))

(global-set-key (kbd "C-x <C-backspace>") 'aga-find-aga)
(define-key global-map "\M-Q" 'unfill-paragraph)
;; Easily jump to my main org file
(defun aga-find-aga nil
  "Find the myinit.org file."
  (interactive)
  (find-file "~/Dropbox/7.dotfiles/emacs/myinit.org")
  (delete-other-windows))

;; Easily unfill paragraphs - still dont know when its useful but lets keep it
(defun unfill-paragraph ()
  "Make a multi-line paragraph into a single line of text."
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-0") 'text-scale-adjust)

(defun backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))
  (global-set-key "\C-c k" 'backward-kill-line)

  (global-set-key "\M-k" '(lambda () (interactive) (kill-line 0)) ) ;M-k kills to the left

(setq org-log-into-drawer "LOGBOOK")
(setq org-directory "~/Dropbox/1.planai/")
;; (setq org-hide-emphasis-markers t) ; Hide * and / in org tex.

;; Ok this is quite sick, scans Dropbox and looks for org files to be used for agenda
  ;; (load-library "find-lisp")
  ;; (add-hook 'org-agenda-mode-hook (lambda ()
  ;; (setq org-agenda-files
  ;; (find-lisp-find-files "~/Dropbox" "\.org$"))
  ;; ))

  (setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "IN-PROGRESS(p)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

  ;; M-x org-agenda-file-list. Go there and save the changes to init.el
  (setq org-agenda-files (list
  "~/Dropbox/1.planai/inbox.org"
  "~/Dropbox/1.planai/daily.org"
  "~/Dropbox/1.planai/someday.org"
  "~/Dropbox/1.planai/tickler.org"
  "~/Dropbox/2.versliukas/README.org"
  "~/Dropbox/3.client_websites/andlysport.com/andlysport.org"
  "~/Dropbox/3.client_websites/estetineginekologija/estetineginekologija.org"
  "~/Dropbox/3.client_websites/julija.consulting/julija.consulting.org"
  "~/Dropbox/3.client_websites/obelsdumas/obelsdumas.org"
  "~/Dropbox/4.personal_websites/arvydas.dev/arvydas.dev.org"
  "~/Dropbox/4.personal_websites/django/citatos/README.org"
  "~/Dropbox/4.personal_websites/quotes(su emacs)/quotes(su emacs).org"
  "~/Dropbox/4.personal_websites/vasara2021/vasara2021.org"
  "~/Dropbox/7.dotfiles/dotfiles.org"))

  ;; a way to archive files nicely into antother direction (put top file)
  ;; #+ARCHIVE: ~/Dropbox/org/backups/archive/%s_datetree::datetree/
;; maybe works to tell the location of the org archived files
;; (setq org-archive-location (concat archive-dir (format-time-string "%Y" (current-time)) ".org_archive::datetree/"))

  (setq org-archive-location "%s_archive::datetree")
  (setq org-agenda-restore-windows-after-quit t)

;; Cool a custom command for an agenda view
;; (add-to-list 'org-agenda-custom-commands
;; 	     '("W" "Weekly review"
;; 	       agenda ""
;; 	       ((org-agenda-start-day "-14d")
;; 		(org-agenda-span 14)
;; 		(org-agenda-start-on-weekday 1)
;; 		(org-agenda-start-with-log-mode '(closed))
;; 		(org-agenda-skip-function '(org-agenda-skip-entry-if 'notregexp "^\\*\\* DONE ")))))

  ;; (setq org-agenda-skip-scheduled-if-done t)
  ;; Stop preparing agenda buffers on startup
  (setq org-agenda-inhibit-startup t)
  (global-set-key (kbd "C-c a") 'org-agenda)

(setq org-startup-folded 'content)

(add-to-list 'custom-theme-load-path "~/Dropbox/7.dotfiles/emacs/themes/")

(use-package doom-themes
     :ensure t)

 (use-package doom-modeline
 :ensure t
 :hook (after-init . doom-modeline-mode))

 ;; (load-theme 'default-black t)
 ;; (load-theme 'zenburn t)
 (load-theme 'doom-gruvbox t)

;; nereikia bookmarks - maiso siek tiek... kai per kelis langus dirbi ir nenori trukdytis
;; Set initial screen to bookmark list. must have inhibit startup screen that you see at the top
;; (require 'bookmark)
;; (bookmark-bmenu-list)
;; (switch-to-buffer "*Bookmark List*")

;Default
(setq default-directory "~/Dropbox/1.planai/")
;Backups
(setq backup-directory-alist '(("." . "~/Dropbox/99.backups/MyEmacsBackups")))

;;Activating ibuffer instead of list-buffer. Ale more powerfull
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; sitas geriausias ir paprasciausias krc. veikia puikiai su ivy.
(setq org-refile-targets '((org-agenda-files :maxlevel . 4)))

;; check https://github.com/bbatsov/super-save for more info
(use-package super-save
  :ensure t
  :config
  (super-save-mode +1)
  (setq auto-save-default nil)
  (setq super-save-auto-save-when-idle t))

(use-package telephone-line
:ensure t
:init (telephone-line-mode 1))

(use-package avy
	  :ensure t
	  :bind (("M-s" . avy-goto-char-timer)
    ;;	     ("M-g f" . avy-goto-line)
		 ("M-p" . avy-goto-word-1)))
;;  You can check the avy home page for their recommended configuration which you get by configuring this way instead:
    ;; (use-package avy
    ;; :ensure t
    ;; :config
    ;; (avy-setup-default))

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

;; autocompletion thingy

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.5)
  (setq company-show-numbers t)
  (setq company-tooltip-limit 10)
  (setq company-minimum-prefix-length 2)
  (setq company-tooltip-align-annotations t)
  ;; invert the navigation direction if the the completion popup-isearch-match
  ;; is displayed on top (happens near the bottom of windows)
  (setq company-tooltip-flip-when-above t)
  (global-company-mode))

(use-package counsel
:ensure t
:after ivy
:config (counsel-mode))

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
:after (ivy)
:init
(setq ivy-rich-path-style 'abbrev
ivy-virtual-abbreviate 'full)
:config
(ivy-rich-mode 1))

(use-package swiper
:after ivy
:bind (("C-s" . swiper)
       ("C-r" . swiper)))
;; get the popup window - in your face, above everything else...
(use-package ivy-posframe
:disabled t)
(ivy-posframe-mode 0)			;

;; setting up the templates for c-c c
(define-key global-map "\C-cc" 'org-capture)
(setq org-capture-templates '(("i" "Inbox" entry
                               (file+headline "~/Dropbox/1.planai/inbox.org" "Inbox")
			       "*  %i%?")
			      ("d" "Diary" entry
 			       (file+datetree "~/Dropbox/1.planai/diary.org" "Diary")
			       "* %U %^{Title} %?")
                              ("p" "Planned" entry
                               (file+headline "~/Dropbox/1.planai/tickler.org" "Planned")
                               "* %i%? %^{SCHEDULED}p" :prepend t)
                              ("r" "Repeating" entry
                               (file+headline "~/Dropbox/1.planai/tickler.org" "Repeating")
                               "* %i%? %^{SCHEDULED}p")))

(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  (setq which-key-idle-delay 0.2)
  :config
  (which-key-mode 1))

(use-package org-bullets
  :commands org-bullets-mode
  :ensure t
  :init
  (add-hook 'org-mode-hook 'org-bullets-mode)
  (setq org-bullets-bullet-list '("►" "▸" "•" "★" "◇" "◇" "◇" "◇")))

;; (use-package whitespace
;;   :init
;;   (dolist (hook '(prog-mode-hook text-mode-hook))
;;     (add-hook hook #'whitespace-mode))
;;   (add-hook 'before-save-hook #'whitespace-cleanup)
;;   :config
;;   (setq whitespace-line-column 80) ;; limit line length
;;   (setq whitespace-style '(face tabs empty trailing lines-tail)))

(use-package org-habit
  :ensure nil
  :config
  (setq org-habit-show-habits-only-for-today t))

;; ;; Initialize my `exec-path' and `load-path' with custom paths
;; (add-to-list 'exec-path "~/bin/")
;; (let ((default-directory "~/Dropbox/org"))
;;   (normal-top-level-add-subdirs-to-load-path))

;; (use-package exec-path-from-shell
;;   :ensure t
;;   :config
;;   (exec-path-from-shell-initialize))

;; first find rip grep for linux and download
; https://github.com/BurntSushi/ripgrep
; version 13 on august 8th
;https://github.com/BurntSushi/ripgrep/releases
; install it
;
(use-package rg
  :ensure t
  :config)

; jumping from tag to tag - closing tags
(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))) ;

(use-package undo-tree
:ensure t
:init
(global-undo-tree-mode))		;

;; (use-package centaur-tabs		;
;;   :ensure t
;;   :demand
;;   :config
;;   (setq centaur-tabs-set-bar 'over)
;;   (setq centaur-tabs-set-icons t)
;;   (setq centaur-tabs-gray-out-icons 'buffer)
;;   (setq centaur-tabs-height 24)
;;   (setq centaur-tabs-set-modified-marker t)
;;   (setq centaur-tabs-modified-marker "•")
;;   (setq centaur-tabs-adjust-buffer-order t)
;;   (centaur-tabs-mode t)
;;   :bind
;;   ("C-<prior>" . centaur-tabs-backward)
;;   ("C-<next>" . centaur-tabs-forward))	;

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (setq projectile-completion-system 'ivy)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config
 (setq dumb-jump-selector 'ivy)
:init
(dumb-jump-mode)
  :ensure
)

;; Both serve similar purpose? like ripgrep?
(use-package ag
  :ensure t)
(use-package pt
  :ensure t)

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
         ("C-x C-g" . magit-status)))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t)
  ;; turn on flychecking globally
  (add-hook 'after-init-hook #'global-flycheck-mode))

;; saveplace remembers your location in a file when saving files
(use-package saveplace
  :ensure t
  :config
  ;; activate it for all buffers
  (setq-default save-place t)
  (save-place-mode 1)
)

;; m-x and add smth like
;; speedbar-supported-extension-expressions then type .md to add unknown file type.
;; worked for me.. now I can see .md files and yaml files etc
;; speedbar info https://www.gnu.org/software/emacs/manual/html_node/emacs/Speedbar.html
;; describe-function speedbar-mode (info)
;; apropos-command sr speedbar (nice, shows all functions possible with that name)
(use-package sr-speedbar
  :ensure t
  :config
  ;; (setq speedbar-use-images nil)
  (setq sr-speedbar-right-side nil)
  (setq speedbar-show-unknown-files t)
  (setq speedbar-directory-unshown-regexp "^\(\.\.*$\)\'")
)

;; temporarily highlight changes from yanking, etc
(use-package volatile-highlights
  :ensure t
  :config
  (volatile-highlights-mode t))

(defun xah-select-text-in-quote ()
; http://ergoemacs.org/emacs/modernization_mark-word.html
;;   "Select text between the nearest left and right delimiters.
;; Delimiters here includes the following chars: \"`<>(){}[]“”‘’‹›«»「」『』【】〖〗《》〈〉〔〕（）
;; This command select between any bracket chars, does not consider nesting. For example, if text is
;; (a(b)c▮)
;; the selected char is “c”, not “a(b)c”.

;; URL `http://ergoemacs.org/emacs/modernization_mark-word.html'
;; Version 2020-11-24 2021-07-11"
  (interactive)
  (let ( $skipChars $p1 )
    (setq $skipChars "^\"`<>(){}[]“”‘’‹›«»「」『』【】〖〗《》〈〉〔〕（）〘〙")
    (skip-chars-backward $skipChars)
    (setq $p1 (point))
    (skip-chars-forward $skipChars)
    (set-mark $p1)))

; heavily inspired by Mike Zamansky

; deletes all the whitespace when you hit backspace or delete
  (use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode))

  ; flashes the cursor's line when you scroll
  (use-package beacon
  :ensure t
  :config
  (beacon-mode 1)
  ; (setq beacon-color "#666600")
  )

  (use-package multiple-cursors
    :ensure t
    :config
    (set multiple-cursors-mode t)
     :bind (("M-." . mc/mark-next-like-this)
	    ("M-," . mc/unmark-next-like-this)))

  (use-package expand-region
    :ensure t
    :bind ("C-=" . er/expand-region))

    (use-package aggressive-indent
    :ensure t
    :config
    (global-aggressive-indent-mode 1)
    ;;(add-to-list 'aggressive-indent-excluded-modes 'html-mode)
    )

(global-set-key (kbd "C-c v") 'ivy-push-view)
(global-set-key (kbd "C-c V") 'ivy-pop-view) ;


