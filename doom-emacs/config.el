;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;; theme
(setq doom-theme 'monochrome)

;;; font
(setq doom-font (font-spec :family "CaskaydiaMono Nerd Font" :size 20))

;;; options
(setq display-line-numbers-type 'relative)
(setq-default indent-tabs-mode nil)
(global-visual-line-mode 1)
(setq word-wrap t)
(setq scroll-conservatively 101)
(setq scroll-margin 10)
(setq org-directory "~/org/")

;;; modeline
(after! doom-modeline
  (setq doom-modeline-modal t)
  (custom-set-faces!
    '(doom-modeline-buffer-modified :foreground "#d70000" :weight bold)
    '(doom-modeline-urgent          :foreground "#000000" :background "#00d7ff" :weight bold)
    '(doom-modeline-info            :foreground "#000000" :background "#707070" :weight bold)))
