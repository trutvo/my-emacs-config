;; package archive
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
;; keep the installed packages in .emacs.d
(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))
(package-initialize)
;; Refresh when missing or when MELPA's index is old. MELPA drops old
;; package tarballs; a stale archive-contents still lists them → 404 on install.
(let ((melpa-archive (expand-file-name "archives/melpa/archive-contents"
                                       package-user-dir)))
  (when (or (not package-archive-contents)
            (and (file-exists-p melpa-archive)
                 (let* ((attrs (file-attributes melpa-archive))
                        (mtime (and attrs
                                    (float-time
                                     (if (fboundp 'file-attribute-modification-time)
                                         (file-attribute-modification-time attrs)
                                       (nth 5 attrs))))))
                   (and mtime (> (- (float-time) mtime) (* 2 24 60 60))))))
    (package-refresh-contents)))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-verbose t)

(load "~/.emacs.d/basic.el")
(load "~/.emacs.d/evil.el")
(load "~/.emacs.d/flycheck.el")
(load "~/.emacs.d/lsp.el")
(load "~/.emacs.d/company.el")
(load "~/.emacs.d/markdown.el")
(load "~/.emacs.d/python.el")
(load "~/.emacs.d/typescript.el")
(load "~/.emacs.d/projectile.el")
(load "~/.emacs.d/treemacs.el")
(load "~/.emacs.d/org.el")
(load "~/.emacs.d/ocaml.el")
(load "~/.emacs.d/outline.el")
(load "~/.emacs.d/templates.el")
(load "~/.emacs.d/git.el")
(load "~/.emacs.d/ai.el")
(load "~/.emacs.d/spellcheck.el")
(load "~/.emacs.d/help.el")
(load "~/.emacs.d/clipboard.el")
(load "~/.emacs.d/key-bindings.el")
(load "~/.emacs.d/catppuccin.el")
