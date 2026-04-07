;; MELPA package name is catppuccin-theme; the library only provide-theme's
;; `catppuccin`, not `catppuccin-theme`, so :no-require is required.
(setq emacs-theme (getenv "MY_EMACS_THEME"))
(setq catppuccin-theme
      (if
	  (string= emacs-theme "light")
	  'latte
	  'mocha))
(use-package catppuccin-theme
  :ensure t
  :no-require t
  :config
  ;; Optional: 'latte, 'frappe, 'macchiato, or 'mocha (default)
  (setq catppuccin-flavor catppuccin-theme)
  (load-library "catppuccin-theme")
  (load-theme 'catppuccin :no-confirm))
