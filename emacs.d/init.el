(setq vc-follow-symlinks t)
(setq inhibit-startup-message t)
(setq column-number-mode t)
(setq custom-file (concat user-emacs-directory "custom.el"))
(setq indent-tabs-mode nil)

(load custom-file 'noerror)

(add-to-list 'default-frame-alist '(height . 60))
(add-to-list 'default-frame-alist '(width . 100)) 
(set-face-attribute 'default nil :height 140)
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

(use-package evil-leader
  :init (global-evil-leader-mode)
  :config
  (progn
    (evil-leader/set-leader "<SPC>")
    (evil-leader/set-key
      "gs" 'magit
      "a" 'projectile-test-project
      "A" 'projectile-toggle-between-implementation-and-test
      "ge" (lambda () (interactive) (find-file "~/.emacs.d/init.el"))
      "x" 'execute-extended-command)))

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
  (setq projectile-switch-project-action #'projectile-dired))

(use-package evil-nerd-commenter)

(use-package evil
  :init (evil-mode)
  :config
  (progn
    (define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file)
    (define-key evil-normal-state-map (kbd "C-s s") 'persp-switch)
    (define-key evil-normal-state-map (kbd "C-s L") 'persp-switch-last)
    (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
    (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
    (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
    (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
    (define-key evil-normal-state-map (kbd "gc") 'evilnc-comment-operator)
    (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
    (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
    (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-page-up)))

(use-package evil-tabs
  :config (global-evil-tabs-mode t))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package evil-magit)

(use-package exec-path-from-shell
  :config (exec-path-from-shell-initialize))

(use-package flycheck
  :config (global-flycheck-mode))

(use-package magit)

(use-package perspective
  :config
  (persp-mode))

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

(set-face-attribute 'comint-highlight-prompt nil
                    :inherit nil)

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region (point-min) (point-max))))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
