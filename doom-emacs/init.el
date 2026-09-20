(doom! :input
       ;; bibtex
       ;; chinese
       ;; japanese
       ;; layout

       :completion
       company           ; автодополнение (аналог blink.cmp, но для текста)
       ;; helm           ; можно включить вместо vertico, если нравится старый стиль
       vertico           ; быстрый fuzzy-finder (аналог Snacks.picker / Telescope)

       :ui
       doom              ; тема и базовый UI
       doom-dashboard    ; стартовый экран
       doom-quit         ; подтверждение выхода
       hl-todo           ; подсветка TODO, NOTE, HACK (как в mini.nvim)
       ;; hydra
       ;; indent-guides
       ;; ligatures
       ;; minimap
       modeline          ; аналог mini.statusline + lualine
       nav-flash         ; аналог flash.nvim (подсветка после прыжка)
       ;; neotree           ; если хочешь дерево слева, но лучше treemacs
       ophints           ; подсветка областей (как visual mode hints)
       (popup +defaults) ; всплывающие окна (документация и т.д.)
       ;; tabs
       treemacs          ; файловый менеджер (аналог oil.nvim / netrw)
       ;; unicode
       vc-gutter         ; аналог gitsigns.nvim
       vi-tilde-fringe   ; тильды на пустых строках
       window-select     ; аналог snacks window picker (ace-window)
       workspaces        ; аналог harpoon / сессий
       ;; zen

       :editor
       (evil +everywhere); уже включен по умолчанию, но оставим для ясности
       file-templates    ; шаблоны новых файлов
       fold              ; сворачивание кода/текста
       (format +onsave)  ; аналог conform.nvim
       ;; god
       ;; lispy
       ;; multiple-cursors ; мультикурсор
       ;; objed
       ;; parinfer
       ;; rotate
       snippets          ; аналог luasnip (использует yasnippet)
       ;; word-wrap

       :emacs
       dired             ; встроенный менеджер файлов (можно использовать вместо treemacs)
       electric          ; умное закрытие скобок/кавычек
       undo              ; аналог undotree (undo-fu)
       vc                ; version control интеграция

       :term
       ;; eshell
       ;; shell           ; встроенный shell
       vterm             ; полноценный терминал (если нужен)

       :checkers
       syntax            ; базовая проверка синтаксиса (flycheck)
       ;; (spell +flyspell) ; раскомментируй, если нужна проверка орфографии

       :tools
       ;; ansible
       ;; biblio
       ;; debugger
       ;; docker
       ;; editorconfig
       ;; ein
       ;; eval
       ;; lookup          ; поиск определений (если вдруг понадобится)
       magit             ; лучший git-клиент (аналог gitsigns + lazygit)
       ;; make
       ;; pass
       ;; pdf
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
       (markdown +grip)  ; отличная поддержка markdown для заметок
       ;; nim
       ;; nix
       ;; ocaml
       (org              ; === ГЛАВНЫЙ МОДУЛЬ ===
        +roam2           ; аналог obsidian.nvim (сеть заметок)
        +pomodoro        ; таймер помодоро
        +journal         ; ежедневные заметки
        +present)        ; презентации из org
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
       ;; (org +roam2)    ; дубликат, удали если есть
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
