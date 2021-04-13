(setq vc-follow-symlinks nil)
(setq create-lockfiles nil)

;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
(if (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

; Set up customise
(setq custom-file "~/.config/emacs/custom.el")
(load custom-file)

(use-package evil
  :ensure t
  :config (evil-mode 1))
