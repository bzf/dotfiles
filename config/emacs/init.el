(require 'package)
(package-initialize)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(use-package evil :config (evil-mode))

(setq vc-follow-symlinks nil)
(setq inhibit-startup-message t)

(tool-bar-mode 0)
(scroll-bar-mode 0)
(global-display-line-numbers-mode)
