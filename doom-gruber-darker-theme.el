

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
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-gruber-darker-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme doom-gruber-darker
                "A theme based on Alexey Kutepov's Gruber Darker theme."
                ;; name        gui       256       16
                ((bg         '("#181818" nil       nil          ))
                 (bg-alt     '("#282828" nil       nil          ))
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
                 (orange     '("#de935f" "#dd9955" "brightred"))
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
                 (warning        orange)
                 (success        green)
                 (vc-modified    fg-alt)
                 (vc-added       green)
                 (vc-deleted     red)

                 ;; custom categories
                 (modeline-bg     `(,(doom-darken (car bg-alt) 0.3) ,@(cdr base3)))
                 (modeline-bg-alt `(,(car bg) ,@(cdr base1)))
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
;;;; font lock
;;;; tree sitter
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
;;;; doom-modeline
                 (doom-modeline-buffer-path       :foreground violet :bold bold)
                 (doom-modeline-buffer-major-mode :inherit 'doom-modeline-buffer-path)
;;; child frame
                 (child-frame-border :foreground fg)
;;; selection
		 (region :box `(:line-width -1 :color ,yellow :style nil))
		 (highlight :box `(:line-width -1 :color ,yellow :style nil))
		 (selection :box `(:line-width -1 :color ,yellow :style nil))
;;; company box
                 (company-box-background :background (doom-lighten bg 0.3))
;;;; line numbers
                 (line-number-current-line :foreground yellow :bold bold :inherit '(hl-line default))
                 ;; --- variables --------------------------
                 ;; ()
                 ))

;;; doom-gruber-darker-theme.el ends here
