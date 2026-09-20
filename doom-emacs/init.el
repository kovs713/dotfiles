(doom! :input
       ;; bibtex
       ;; chinese
       ;; japanese
       ;; layout

       :completion
       company           ; blink.cmp completion alternative
       vertico           ; fuzzy-finder
       ;; helm           ; vertico alternative 

       :ui
       doom              ; base ui
       doom-dashboard    ; startup dashboard
       ;; doom-quit      ; quit confirm
       ;; (emoji +unicode)
       hl-todo           ; TODO, NOTE, HACK highlight
       ;; hydra
       ;; indent-guides
       ;; ligatures
       ;; minimap
       modeline          ; mini.statusline + lualine alternative
       ophints           ; visual mode hints
       (popup +defaults) ; popup windows (docs etc.)
       ;; tabs
       treemacs          ; oil.nvim alternative
       ;; unicode
       vc-gutter         ; gitsigns.nvim alternative
       vi-tilde-fringe   ; empty line tildes
       window-select     ; snacks window picker alternative
       workspaces        ; harpoon kinda
       ;; zen

       :editor
       (evil +everywhere); evil (vim) mode
       file-template
       fold
       (format +onsave)  ; conform.nvim kinda
       ;; god
       ;; lispy
       ;; multiple-cursors
       ;; objed
       ;; parinfer
       ;; rotate
       snippets          ; luasnip alternative
       ;; word-wrap

       :emacs
       dired             ; builtin file tree
       electric          ; bracets closer kinda
       undo              ; undo tree kinda
       vc                ; git integration

       :term
       ;; eshell
       ;; shell          ; builtin shell
       vterm             ; terminal

       :checkers
       syntax            ; syntax check (flycheck)
       (spell +flyspell) ; spellcheck

       :tools
       ;; ansible
       ;; biblio
       ;; debugger
       ;; docker
       ;; editorconfig
       ;; ein
       ;; eval
       ;; lookup         ; definition lookup (??)
       magit             ; best (?) git client
       ;; make
       ;; pass
       pdf               ; pdf reader
       ;; prodigy
       ;; rgb
       ;; taskrunner
       ;; terraform
       ;; tmux
       ;; upload

       :lang
       ;; agda
       ;; beancount
       ;; cc
       ;; clojure
       ;; common-lisp
       ;; crystal
       ;; csharp
       ;; data
       ;; dart
       ;; dhall
       ;; elixir
       ;; elm
       ;; emacs-lisp
       ;; erlang
       ;; ess
       ;; fsharp
       ;; fstar
       ;; gdscript
       ;; go
       ;; haskell
       ;; idris
       ;; json
       ;; julia
       ;; kotlin
       (markdown +grip)
       (org
        +roam2           ; obsidian.nvim alternative
        +pomodoro        ; pomodoro
        +journal)         ; daily journal
       ;; +present)        ; presentations (?) org
       ;; nim
       ;; nix
       ;; ocaml
       ;; php
       ;; purescript
       ;; python
       ;; qt
       ;; racket
       ;; raku
       ;; rest
       ;; rst
       ;; ruby
       ;; rust
       ;; scala
       ;; scheme
       ;; sml
       ;; solidity
       ;; sh
       ;; zig

       :email
       ;; (mu4e +org +gmail)
       ;; notmuch
       ;; (wanderlust +gmail)

       :app
       ;; calendar
       ;; emms
       ;; everywhere
       ;; irc
       ;; (rss +org)

       :config
       ;; literate
       (default +bindings +smartparens))
