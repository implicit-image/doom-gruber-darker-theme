

;;; doom-gruber-darker-theme.el --- Port of gruber-darker theme to Doom themes -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Added: March 19, 2024 (4c981f2cccf3)
;; Author: Błażej Niewiadomski <https://github.com/implicit-image>
;; Maintainer: Błażej Niewiadomski <https://github.com/implicit-image>
;; Source: https://github.com/implicit-image/doom-gruber-darker
;;
;;; Commentary:
;;; Code:

(require 'doom-themes)
(require 'faces)


;;
;;; Variables

(defgroup doom-gruber-darker-theme nil
  "Options for the `doom-gruber-darker' theme."
  :group 'doom-themes)

(defcustom doom-gruber-darker-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.  Can be an integer to\
determine the exact padding."
  :group 'doom-gruber-darker-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme doom-gruber-darker
    "A theme based on Alexey Kutepov's Gruber Darker theme."
  ;; name        gui       256       16
  ((bg         '("#151515" nil       nil          ))
   (bg-alt     '("#252525" nil       nil          ))
   (base0      '("#0d0d0d" "black"   "black"      ))
   (base1      '("#1b1b1b" "#1b1b1b"              ))
   (base2      '("#212122" "#1e1e1e"              ))
   (base3      '("#292b2b" "#292929" "brightblack"))
   (base4      '("#3f4040" "#3f3f3f" "brightblack"))
   (base5      '("#5c5e5e" "#525252" "brightblack"))
   (base6      '("#95a99f" "#6b6b6b" "brightblack"))
   (base7      '("#969896" "#979797" "brightblack"))
   (base8      '("#ffffff" "#ffffff" "white"      ))
   (fg         '("#f5f5f5"))
   (fg-alt     (doom-darken fg 0.4))
   (grey       '("#8b8b83"))
   (red        '("#f43841" "#ee6666" "red"))
   (orange     '("#ef532f" "#dd9955" "brightred"))
   (yellow     '("#ffdd33" "#ffdd33" "yellow"))
   (green      '("#73c936" "#73c936" "green"))
   (blue       '("#81a2be" "#88aabb" "brightblue"))
   (dark-blue  '("#303540" "#41728e" "blue"))
   (teal       '("#81a2be")) ; FIXME replace with real teal
   (magenta    '("#96a6c8" "#c9b4cf" "magenta"))
   (violet     '("#95a8af" "#b294bb" "brightmagenta"))
   (cyan       '("#565f73" "#8abeb7" "cyan"))
   (dark-cyan   (doom-darken cyan 0.2))

   ;; face categories
   (highlight      base7)
   (vertical-bar   base0)
   (selection      `(,(car (doom-lighten bg 0.1)) ,@(cdr base4)))
   (builtin        yellow)
   (comments       grey)
   (doc-comments   (doom-lighten grey 0.14))
   (constants      (doom-lighten cyan 0.4))
   (functions      magenta)
   (keywords       yellow)
   (methods        teal)
   (operators      yellow)
   (type           base6)
   (strings        green)
   (variables      fg)
   (numbers        base6)
   (region         selection)
   (error          red)
   (warning        (doom-lighten orange 0.3))
   (success        green)
   (vc-modified    fg-alt)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (modeline-bg     `(,(doom-darken (car bg-alt) 0.6) ,@(cdr base3)))
   (modeline-bg-alt `(,(doom-darken (car bg-alt) 0.8) ,@(cdr base3)))
   (modeline-fg     base8)
   (modeline-fg-alt comments)
   (-modeline-pad
    (when doom-gruber-darker-padded-modeline
      (if (integerp doom-gruber-darker-padded-modeline)
          doom-gruber-darker-padded-modeline
        4))))

  ;; --- faces ------------------------------
  (
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-alt :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-alt)))
;;;; window dividers
   (window-divider :background "#a1a1a1" :foreground "#a1a1a1")
;;;; org mode
   (org-imminent-deadline :box `(:line-width -1 :color ,orange :style nil)
                          :foreground orange)
   (org-block-begin-line :foreground grey  :background bg-alt :extend t)
   (org-block-end-line :foreground grey :background bg-alt :extend t)
   (org-document-info-keyword :box `(:line-width -1 :color ,base5 :style nil)
                              :background bg
                              :foreground base5)
   (org-meta-line :background bg-alt :foreground comments :extend t)
   (org-todo :background bg :foreground green)
   (org-done :background bg :foreground base5)
   (org-drawer :box `(:line-width -1 :color ,grey :style nil)
               :background bg
               :foreground grey)
   (tree-sitter-hl-face:property :slant 'normal)
   (tree-sitter-hl-face:function.call :inherit '(font-lock-function-call-face))
   (tree-sitter-hl-face:method.call :inherit '(font-lock-function-call-face))
;;;; rainbow-delimiters
   (rainbow-delimiters-depth-1-face :foreground (doom-lighten cyan .20))
   (rainbow-delimiters-depth-2-face :foreground magenta)
   (rainbow-delimiters-depth-3-face :foreground base7)
   (rainbow-delimiters-depth-4-face :foreground grey)
   (rainbow-delimiters-depth-5-face :foreground blue)
   (rainbow-delimiters-depth-6-face :foreground base6)
   (rainbow-delimiters-depth-7-face :foreground teal)
   (rainbow-delimiters-depth-8-face :foreground (doom-lighten blue .30))
;;;; modeline
   (mode-line :background base4)
   (mode-line-inactive :background base3)
   (mode-line-active :background base4)
;;;; header line
   (header-line :background bg-alt)
;;;; eldoc box
   (eldoc-box-body :box nil)
   (eldoc-box-border :width 'narrow :background base1)
;;;; show paren mode
   (show-paren-match :background red :foreground 'unspecified)
   (show-paren-match-expression :box nil
                                :background bg)
;;;; window-stool
   (window-stool-face :background bg-alt
                      :foreground fg-alt)
;;;; diff-hl
   (diff-hl-margin-insert :background bg :foreground green)
   (diff-hl-margin-delete :background bg :foreground red)
   (diff-hl-margin-change :background bg :foreground base6)
;;;; corfu
   (corfu-border :background base5 :foreground fg-alt)
   (corfu-current :background (doom-lighten bg-alt 0.2) :foreground fg)
   (corfu-default :background base0 :foreground 'unspecified)
   (corfu-popupinfo :background base0 :foreground fg)
   (corfu-echo :background bg :foreground fg)
;;;; lsp
   (lsp-lens-face :height 1)
   (lsp-signature-highlight-function-argument :background fg-alt
                                              :foreground bg
                                              :slant 'italic)
   (lsp-ui-peek-header :background bg :foreground fg-alt)
   (lsp-ui-peek-footer :background bg :foreground fg-alt)
   (lsp-ui-peek-peek :background (doom-lighten bg 0.1) :foreground fg-alt)
   (lsp-ui-peek-list :background (doom-lighten bg 0.1) :foreground fg-alt)
   (lsp-ui-doc-background :background bg-alt)
;;;; company
   (company-tooltip-common :weight 'semi-bold
                           :inherit 'company-tooltip)
   (company-tooltip :foreground fg :background base0)
   (company-tooltip-selection :background base1)
;;;; doom-modeline
   (doom-modeline-buffer-path       :foreground violet :bold bold)
   (doom-modeline-buffer-major-mode :inherit 'doom-modeline-buffer-path)
;;;; child frame
   (child-frame-border :foreground fg :background fg)
;;;; company box
   (company-box-background :background (doom-lighten bg 0.3))
;;;; font-lock
   (font-lock-comment-face :slant 'italic :foreground comments)
   (font-lock-doc-face :slant 'italic :foreground comments)
;;;; line numbers
   (line-number-current-line :foreground yellow :bold bold
                             :inherit '(hl-line default))
   (whitespace-space :foreground fg-alt)
   (whitespace-hspace :foreground bg
                      :background bg)
   (whitespace-indentation :foreground base4
                           :background base4)
   (menu :background base0
         :box nil
         :foreground fg)
   (tool-bar :background bg
             :foreground fg
             :box nil)
;;;; popup
   (popup-tip-face :background bg-alt
                   :foreground fg)
;;;; tty menu
   (tty-menu-enabled-face :background bg-alt
                          :foreground fg
                          :weight 'bold)
   (tty-menu-disabled-face :background selection
                           :foreground fg
                           :weight 'normal)
   (tty-menu-selected-face :background blue
                           :foreground fg
                           :weight 'bold)
   (secondary-selection :background selection
                        :extend nil)
   (region :weight 'bold
           :background (doom-lighten selection 0.18))
   (variable-pitch :foreground fg-alt)
   (flymake-end-of-line-diagnostics-face :box nil
                                         :background selection)
;;;; sideline
   (sideline-lsp-code-action :foreground base6)
   (sideline-blame :slant 'normal
                   :extend t
                   :height 1.0
                   :background bg-alt
                   :foreground base6)
;;;; treemacs
   (treemacs-root-face :background bg-alt
                       :foreground blue)
;;;; avy
   (avy-lead-face :background violet)
;;;; anzu
   (anzu-mode-line :foreground fg
                   :weight 'bold)
;;;; meow
   (meow-insert-indicator :background base4
                          :extend t)
   (meow-beacon-indicator :background blue
                          :foreground bg-alt)
   (meow-motion-indicator :background cyan
                          :foreground fg)
   (meow-normal-indicator :background warning
                          :foreground bg-alt)
   (meow-keypad-indicator :background violet
                          :foreground bg-alt)
   (meow-search-indicator :background bg-alt
                          :foreground base6)
;;;; devdocs
   (devdocs-code-block :background base4
                       :extend t)
   ;; --- variables --------------------------
   ;; ()
   ))

;;; doom-gruber-darker-theme.el ends here
