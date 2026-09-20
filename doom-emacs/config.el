;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-theme 'monochrome)
(setq doom-font (font-spec :family "CaskaydiaMono Nerd Font" :size 20))

(setq display-line-numbers-type 'relative)
(setq-default indent-tabs-mode nil)
(global-visual-line-mode 1)
(setq word-wrap t)
(setq scroll-conservatively 101)
(setq scroll-margin 10)
(setq org-directory "~/org/")

(after! doom-modeline
  (setq doom-modeline-modal t)
  (custom-set-faces!
    '(doom-modeline-buffer-modified :foreground "#d70000" :weight bold)
    '(doom-modeline-urgent          :foreground "#000000" :background "#00d7ff" :weight bold)
    '(doom-modeline-info            :foreground "#000000" :background "#707070" :weight bold)))

(when (and (not (display-graphic-p))
           (executable-find "wl-copy")
           (executable-find "wl-paste"))
  
  (setq interprogram-cut-function
        (lambda (text)
          (let ((process-connection-type nil))
            (let ((proc (start-process "wl-copy" nil "wl-copy" "--trim-newline")))
              (process-send-string proc text)
              (process-send-eof proc)))))
  
  (setq interprogram-paste-function
        (lambda ()
          (let ((out (shell-command-to-string "wl-paste")))
            (if (string-suffix-p "\n" out)
                (substring out 0 -1)
              out)))))

(setq x-select-enable-clipboard t)
(setq save-interprogram-paste-before-kill t)

(map!
 :n "M-SPC" nil
 :leader
   :n "s" #'save-buffer               ; <leader>s = Save
   :n "n r" #'restart-emacs           ; <leader>nr = Restart

 :n "C-i" #'evil-jump-backward        ; <C-i> = Jump backward
 :n "TAB" #'evil-jump-backward        ; <Tab> = Jump backward
 :n "C-o" #'evil-jump-forward         ; <C-o> = Jump forward

 :n "M-h" #'evil-window-left          ; <A-h>
 :n "M-j" #'evil-window-down          ; <A-j>
 :n "M-k" #'evil-window-up            ; <A-k>
 :n "M-l" #'evil-window-right         ; <A-l>
 :n "M-H" #'evil-window-move-far-left ; <A-H>
 :n "M-J" #'evil-window-move-very-bottom
 :n "M-K" #'evil-window-move-very-top
 :n "M-L" #'evil-window-move-far-right
 :n "M-c" #'delete-window             ; <A-c> = Close window
 :n "M-x" (cmd! (save-buffer) (delete-window)) ; <A-x> = Save and close window
 :n "M-v" #'evil-window-vsplit        ; <A-v> = vert split
 :n "M-s" #'evil-window-split         ; <A-s> = horizontal split

 :n "M-=" #'evil-window-increase-height  ; <A-=>
 :n "M--" #'evil-window-decrease-height  ; <A-->
 :n "M-." #'evil-window-increase-width   ; <A-.>
 :n "M-," #'evil-window-decrease-width   ; <M-,>

 :n "C-d" (cmd! (evil-scroll-down) (evil-scroll-line-to-center))
 :n "C-u" (cmd! (evil-scroll-up) (evil-scroll-line-to-center))
 :n "n"   (cmd! (evil-search-next) (evil-scroll-line-to-center))
 :n "N"   (cmd! (evil-search-previous) (evil-scroll-line-to-center))
 :n "*"   (cmd! (evil-word-search-forward) (evil-scroll-line-to-center))
 :n "#"   (cmd! (evil-word-search-backward) (evil-scroll-line-to-center))
 :n "g*"  (cmd! (evil-word-search-forward nil t) (evil-scroll-line-to-center))
 :n "g#"  (cmd! (evil-word-search-backward nil t) (evil-scroll-line-to-center))
 :n "ESC" #'evil-ex-nohighlight

 :v "J" (cmd! (evil-move-line-down))
 :v "K" (cmd! (evil-move-line-up))
 :v "p" #'evil-visual-paste

 :n "H" #'evil-beginning-of-visual-line
 :n "L" #'evil-end-of-visual-line

 :n "[d" #'flycheck-next-error
 :n "]d" #'flycheck-previous-error
 :n "[q" #'next-error
 :n "]q" #'previous-error
 :n "[l" #'next-error
 :n "]l" #'previous-error)

(add-hook 'focus-out-hook 'save-buffer)

(map! :leader
      :desc "Open Org Agenda" "o a" #'org-agenda
      :desc "Open Org Capture" "o c" #'org-capture)

(setq ring-bell-function 'ignore)

(map! :leader :desc "Which Key" "?" #'which-key-show-current-bindings)

(map! :leader :desc "Toggle Terminal" "t t" #'+vterm/toggle)

(map! :leader :desc "Open Dired (Oil alternative)" "e" #'dired-jump)

;; - mini.surround
;; - mini.pairs
;; - mini.cursorword
;; - mini.ai
(after! evil-args
  (define-text-object "a" 'evil-outer-arg 'evil-inner-arg)
  (map! :map evil-inner-text-objects-map "a" #'evil-inner-arg)
  (map! :map evil-outer-text-objects-map "a" #'evil-outer-arg))

;; 5. img-clip
(setq org-download-method 'directory)
(setq org-download-image-dir "./assets")
(map! :leader :desc "Paste image from clipboard" "i p" #'org-download-clipboard)

;; haproon kinda
(map! :leader :desc "Bookmark: Add file" "a" #'bookmark-set)
(map! :leader :desc "Bookmark: Menu" "E" #'consult-bookmark)

;; gitsigns
(map! :n "]h" #'diff-hl-next-hunk)
(map! :n "[h" #'diff-hl-previous-hunk)
(map! :leader :desc "Git stage hunk" "g s" #'diff-hl-stage-hunk)
(map! :leader :desc "Git revert hunk" "g r" #'diff-hl-revert-hunk)
(map! :leader :desc "Git preview hunk" "g p" #'diff-hl-show-hunk)
(map! :leader :desc "Git blame" "g b" #'magit-blame)
(map! :leader :desc "Git diff" "g d" #'magit-diff-working-tree)
(map! :leader :desc "Git Lazygit / Magit" "g l" #'magit-status)

(map! :n "s" #'avy-goto-line)

;; fuzzy finder
(map! :leader :desc "Find Files" "f f" #'consult-find)
(map! :leader :desc "Grep / Search" "f d" #'consult-ripgrep)
(map! :leader :desc "Recent Files" "f r" #'consult-recent-file)
(map! :leader :desc "Git Commits" "f c" #'magit-log)
(map! :leader :desc "Git Branches" "f b" #'magit-branch)
(map! :leader :desc "Git Status" "f s" #'magit-status)
(map! :leader :desc "Rename File" "r N" #'rename-file-and-buffer)

;; obsidian.nvim
(map! :leader :desc "Org Roam: Find Note" "o s" #'org-roam-node-find)
(map! :leader :desc "Org Roam: New Note" "o n n" #'org-roam-capture)
(map! :leader :desc "Org Roam: Insert Link" "o n i" #'org-roam-node-insert)
(map! :leader :desc "Org Agenda" "o a" #'org-agenda)
(map! :leader :desc "Org Daily Note" "o d" #'org-journal-new-entry)

(map! :map org-mode-map :n "gf" #'org-open-at-point)
(map! :map markdown-mode-map :n "gf" #'markdown-follow-thing-at-point)

(map! :leader :desc "Toggle Diagnostics (Trouble)" "x x" #'+flycheck/error-list)

(map! :leader :desc "Toggle Flycheck" "l t" #'flycheck-mode)

(when (require 'elcord nil t)
  (elcord-mode)
  (setq elcord-refresh-rate 15
        elcord-show-major-mode t
        elcord-boring-buffers-regexp-list '("^ " "\\*")
        elcord-idle-message "Idle..."
        elcord-use-custom-activity-text t
        elcord-custom-activity-text "Editing text and notes"))
