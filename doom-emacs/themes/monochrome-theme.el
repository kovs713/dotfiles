;;; monochrome-theme.el --- A port of the monochrome theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: kovs713
;; Maintainer:
;; Source: monochrome theme from my neovim config
;;
;;; Commentary:
;;; Code:

(require 'doom-themes)

;;; Theme definition

(def-doom-theme monochrome
  "A port of the monochrome theme."

  ;; name        default   256       16
  ((bg         '("#000000" "black"   "black"        ))
   (bg-alt     '("#000000" "black"   "black"        ))
   (base0      '("#000000" "black"   "black"        ))
   (base1      '("#1c1c1c" "#1c1c1c" "brightblack"  ))
   (base2      '("#303030" "#303030" "brightblack"  ))
   (base3      '("#3a3a3a" "#3a3a3a" "brightblack"  ))
   (base4      '("#585858" "#585858" "brightblack"  ))
   (base5      '("#707070" "#707070" "brightblack"  )) ; muted
   (base6      '("#888888" "#888888" "brightblack"  ))
   (base7      '("#a0a0a0" "#a0a0a0" "brightblack"  ))
   (base8      '("#dadada" "#dadada" "white"        )) ; fg
   (fg         '("#dadada" "#dadada" "white"        ))
   (fg-alt     '("#a0a0a0" "#a0a0a0" "brightwhite"  ))

   ;; doom-themes must have colours
   (grey       base5)
   (red        '("#ff005f" "#ff005f" "red"          )) ; error
   (dark-red   '("#722529" "#722529" "red"          )) ; remove
   (orange     '("#ffaf00" "#ffaf00" "brightred"    )) ; warning
   (green      '("#416241" "#416241" "green"        )) ; add
   (yellow     '("#707070" "#707070" "yellow"       )) ; muted grey
   (blue       '("#707070" "#707070" "brightblue"   )) ; СЕРЫЙ! не синий
   (violet     '("#d70000" "#d70000" "magenta"      )) ; visual / cursor
   (teal       '("#416241" "#416241" "brightgreen"  ))
   (dark-blue  '("#1d2b3a" "#1d2b3a" "blue"         )) ; change
   (magenta    '("#d70000" "#d70000" "magenta"      ))
   (cyan       '("#2d4560" "#2d4560" "brightcyan"   )) ; change_text
   (dark-cyan  '("#1d2b3a" "#1d2b3a" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      base1)
   (vertical-bar   (doom-darken bg 0.25))
   (selection      base1)
   (builtin        fg)
   (comments       base5)
   (doc-comments   base5)
   (constants      fg)
   (functions      fg)
   (keywords       base5)
   (methods        fg)
   (operators      fg)
   (type           fg)
   (strings        fg)
   (variables      fg)
   (numbers        fg)
   (region         base0)
   (error          red)
   (warning        orange)
   (success        green)
   (vc-modified    dark-blue)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg-alt) "black" "black"))
   
   (modeline-fg     fg)
   (modeline-fg-alt base5)
   (modeline-bg     base0)
   (modeline-bg-l   base0)
   (modeline-bg-inactive   bg)
   (modeline-bg-inactive-l bg-alt))


  ;;;; Base theme face overrides
  (((font-lock-comment-face &override)
    :background nil)
   ((font-lock-keyword-face &override) :foreground base5)
   ((font-lock-function-name-face &override) :foreground fg :weight 'bold)
   ((font-lock-type-face &override) :foreground fg :underline t)
   ((font-lock-constant-face &override) :foreground fg :slant 'italic)
   ((font-lock-string-face &override) :foreground fg :slant 'italic)
   ((font-lock-builtin-face &override) :foreground fg)
   ((font-lock-variable-name-face &override) :foreground fg)
   
   ((line-number &override) :foreground base5)
   ((line-number-current-line &override) :foreground fg)
   
   ;; Search - ЕДИНСТВЕННОЕ место где используется синий (#00d7ff)
   ;; Захардкожено напрямую, чтобы не зависеть от переменной blue
   (isearch :foreground "#00d7ff" :background bg :inverse-video t)
   (isearch-fail :foreground red :background bg :inverse-video t)
   (lazy-highlight :foreground "#00d7ff" :background bg :inverse-video t)
   
   ;; Mode-line - без синего
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box nil)
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box nil)
   (mode-line-emphasis :foreground fg)
   
   ;; Doom modeline - без синего
   (doom-modeline-bar :background fg)
   
   ;; Visual / Region
   (region :background base0 :foreground violet)
   (secondary-selection :background base1)
   
   ;; Diff
   (diff-added :background green)
   (diff-removed :background dark-red)
   (diff-changed :background dark-blue)
   (diff-refine-changed :background cyan)
   
   ;; Org
   (org-block :background base0)
   (org-block-begin-line :foreground base5 :background bg)
   (org-ellipsis :underline nil :background bg :foreground red)
   
   ;; Markdown
   ((markdown-code-face &override) :background base0)
   
   ;; Flycheck / Diagnostics
   (flycheck-error :underline `(:style wave :color ,red))
   (flycheck-warning :underline `(:style wave :color ,base5))
   (flycheck-info :underline `(:style wave :color ,base5))
   (flyspell-incorrect :underline `(:style wave :color ,red))
   
   ;; Parentheses
   (show-paren-match :foreground violet :weight 'bold :underline t)
   
   ;; Cursor
   (cursor :background violet)
   
   ;; Minibuffer / Prompts
   (minibuffer-prompt :foreground fg :weight 'bold)
   
   ;; UI Elements
   (vertical-border :foreground base5 :background bg)
   (fringe :background bg :foreground base5)
   (whitespace-space :foreground bg-alt)
   (whitespace-tab :foreground bg-alt :weight 'bold)
   
   ;; Tooltips and floating windows
   (tooltip :background base0 :foreground fg)
   
   ;; Иконки - принудительно убираем синий отовсюду
   (all-the-icons-blue :foreground fg)
   (all-the-icons-dblue :foreground fg)
   (all-the-icons-cyan :foreground fg)
   (all-the-icons-dcyan :foreground fg)
   (nerd-icons-blue :foreground fg)
   (nerd-icons-dblue :foreground fg)
   (nerd-icons-cyan :foreground fg)
   (nerd-icons-dcyan :foreground fg)
   
   ;; Dired - без синего
   (dired-directory :foreground fg :weight 'bold)
   (dired-header :foreground fg)
   (dired-ignored :foreground base5)
   (dired-marked :foreground red)
   (dired-flagged :foreground red)
   
   ;; Company / Corfu / Vertico / Ivy (Autocompletion & Search)
   (company-tooltip :background base0 :foreground fg)
   (company-tooltip-selection :background fg :foreground bg)
   (company-tooltip-common :foreground fg :weight 'bold)
   (company-tooltip-annotation :foreground base5)
   
   (corfu-default :background base0 :foreground fg)
   (corfu-current :background fg :foreground bg)
   
   (vertico-current :background base1 :foreground fg)
   (consult-file :foreground fg)
   (consult-directory :foreground fg)
   (ivy-current-match :background base1 :foreground fg)
   
   ;; Marginalia - без синего
   (marginalia-file-name :foreground fg)
   (marginalia-file-priv-dir :foreground fg)
   (marginalia-file-priv-read :foreground fg)
   (marginalia-file-priv-write :foreground fg)
   (marginalia-file-priv-exec :foreground fg)
   
   ;; Compilation / Quickfix - без синего
   (compilation-info :foreground fg :weight 'bold)
   (compilation-error :foreground red :weight 'bold)
   (compilation-warning :foreground orange :weight 'bold)
   (next-error :foreground fg :inverse-video t)
   
   ;; Outline
   ((outline-1 &override) :foreground fg :weight 'ultra-bold)
   ((outline-2 &override) :foreground fg :weight 'bold)
   ((outline-3 &override) :foreground fg :weight 'bold)
   ((outline-4 &override) :foreground fg)
   
   ;; Solaire mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box nil)
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box nil)))

;;; monochrome-theme.el ends here
