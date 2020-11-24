(setq vc-follow-symlinks nil)
(setq inhibit-startup-message t)

(tool-bar-mode 0)
(scroll-bar-mode 0)
(global-display-line-numbers-mode)

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; Initialize use-package
(require 'use-package)
(setq use-package-always-ensure t)

(use-package evil
  :config (evil-mode))

(use-package ivy
  :config (ivy-mode 1))

(use-package projectile
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/Projects")
    (setq projectile-project-search-path '("~/Projects")))
  (setq projectile-switch-project-action #'projectile-dired)
  (define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file))

(use-package exec-path-from-shell
  :config (exec-path-from-shell-initialize))

(use-package flycheck
  :config (global-flycheck-mode))

(use-package magit)
