(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(use-package anzu
  :ensure t
  :config (global-anzu-mode))

(use-package cider
  :ensure t
  :pin melpa-stable
  :config (progn
            (setq nrepl-hide-special-buffers t)))

(when (memq window-system '(mac ns))
  (use-package exec-path-from-shell
    :ensure t
    :config (exec-path-from-shell-initialize)))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package markdown-mode
  :ensure t)

(use-package paredit
  :ensure t
  :config (add-hook 'emacs-lisp-mode-hook #'paredit-mode))

(use-package rainbow-delimiters
  :ensure t
  :config (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package which-key
  :ensure t
  :config (which-key-mode t))

(use-package zenburn-theme
  :ensure t
  :config (load-theme 'zenburn t))

(use-package clojure-mode
  :config (add-hook 'clojure-mode-hook #'paredit-mode))

(setq-default indent-tabs-mode nil) ;; don't use tabs to indent

(setq user-full-name "Carlos Moscoso"
      ring-bell-function 'ignore
      initial-buffer-choice t
      load-prefer-newer t)

(tool-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)

(ido-mode)
(show-paren-mode)
(line-number-mode)
(column-number-mode)
(global-hl-line-mode)
(size-indication-mode)

;; init.el ends here
