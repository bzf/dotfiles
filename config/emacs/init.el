(require 'package)
(package-initialize)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(use-package evil :config (evil-mode))
