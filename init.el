(require 'package)

;; Add MELPA to the list of package archives
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Basic UI Settings
;; -----------------
(set-face-attribute 'default nil
                    :family "Iosevka"
                    :height 120
                    :weight 'normal
                    :width 'normal)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Theme Settings
;; --------------
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'evariste t)

(custom-set-variables
 '(custom-enabled-themes '(tango-dark))
 '(custom-safe-themes
   '("fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c"
     "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773"
     "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5"
     "6f3d47600779f931cbc3f4fddee5f66231f9477b4bfa58d13334587f5ad4b406"
     "3e200d49451ec4b8baa068c989e7fba2a97646091fd555eca0ee5a1386d56077"
     "524fa911b70d6b94d71585c9f0c5966fe85fb3a9ddd635362bfabd1a7981a307"
     "00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c"
     "833ddce3314a4e28411edf3c6efde468f6f2616fc31e17a62587d6a9255f4633"
     "57a29645c35ae5ce1660d5987d3da5869b048477a7801ce7ab57bfb25ce12d3e"
     "4c56af497ddf0e30f65a7232a8ee21b3d62a8c332c6b268c81e9ea99b11da0d3"
     "1fad801c375a97e01e7c627ae32f1f8cbd8cc994cd751bee1b1a592211450f89" default))
 '(package-selected-packages
   '(pdf-tools all-the-icons-dired all-the-icons counsel-projectile evil-collection dired-sidebar magit scala-mode vterm evil)))

(custom-set-faces)

;; General Visual Settings
;; -----------------------
(global-set-key (kbd "C-x C-b")
                (lambda ()
                  (interactive)
                  (switch-to-buffer "*Buffer List*")
                  (unless (eq major-mode 'Buffer-menu-mode)
                    (buffer-menu))))

;; Evil Mode Settings
;; ------------------
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-c") 'evil-normal-state)
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
  (define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
  (define-key evil-motion-state-map (kbd "C-u") 'evil-scroll-up))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; Vterm
;; -----
(use-package vterm
  :commands vterm
  :config
  (defun toggle-vterm-at-bottom ()
    "Toggle vterm in a split window at the bottom."
    (interactive)
    (let ((vterm-buffer (get-buffer "*vterm*")))
      (if (and vterm-buffer (get-buffer-window vterm-buffer))
          (delete-window (get-buffer-window vterm-buffer))
        (progn
          (unless vterm-buffer
            (vterm))
          (split-window-vertically -20)
          (other-window 1)
          (switch-to-buffer "*vterm*")))))

  (global-set-key (kbd "C-x C-t") 'toggle-vterm-at-bottom))

;; Magit
;; -----
(use-package magit
  :ensure t
  :commands (magit-status magit-blame)
  :config
  (global-set-key (kbd "C-x g") 'magit-status)
  (global-set-key (kbd "C-x M-g") 'magit-blame))

;; Buffer Menu
;; -----------
(global-set-key (kbd "C-x C-b")
                (lambda ()
                  (interactive)
                  (list-buffers)))

;; Projectile
;; ----------
(use-package projectile
  :init
  (setq projectile-completion-system 'ivy)
  :config
  (projectile-mode +1)
  (setq projectile-enable-caching t)
  (setq projectile-project-search-path '("~/repos"))
  (setq projectile-generic-command "rg --files --hidden")

  (use-package counsel-projectile
    :ensure t
    :config
    (counsel-projectile-mode))

  :bind (("C-x p" . projectile-command-map)))

;; Ivy Mode 
;; -------------------------------
(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-s" . swiper)
         ("C-c C-r" . ivy-resume)
         ("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-c f" . counsel-recentf)
         ("C-c g" . counsel-git)
         ("C-x b" . ivy-switch-buffer)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) "))

(use-package counsel
  :ensure t
  :after ivy
  :config
  (counsel-mode 1))

(use-package swiper
  :ensure t
  :after ivy
  :bind (("C-s" . swiper)))

(ido-mode -1)
(setq ivy-initial-inputs-alist nil)

;; Line Numbers
;; ------------
(add-hook 'prog-mode-hook (lambda ()
                            (setq display-line-numbers 'relative)
                            (display-line-numbers-mode 1)))

(setq display-line-numbers 'relative)

;; Prevent re-centering
;; --------------------
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)

;; Dired Sidebar
;; -------------
(use-package dired-sidebar
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
  :config
  ;; Disable icons and custom fonts
  (setq dired-sidebar-theme 'none) ; Ensure no themes are applied
  ;;(setq dired-sidebar-use-custom-font t) ; Disable custom fonts
  (setq dired-sidebar-use-term-integration t)
  (setq dired-sidebar-width 80) ; Increase the width to prevent wrapping
  (setq window-divider-default-right-width 1)
  (window-divider-mode 1)
  (setq dired-sidebar-show-hidden-files t)
  (add-hook 'dired-sidebar-mode-hook
            (lambda ()
              (define-key dired-sidebar-mode-map (kbd "<mouse-1>") 'dired-sidebar-find-file)
              (define-key dired-sidebar-mode-map (kbd "<mouse-2>") 'dired-sidebar-find-file-other-window)
              (setq truncate-lines t) ; Prevent line wrapping
              )))

(setq dired-use-ls-dired nil)
(setq dired-listing-switches "-alh")
(setq window-divider-default-right-width 1)
(setq window-divider-default-bottom-width 1)
(window-divider-mode t)

;; Eglot setup
;; -----------
(use-package eglot
  :ensure t
  :hook ((prog-mode . eglot-ensure))
  :bind (:map eglot-mode-map
              ("C-c l t" . eglot-toggle))
  :config
  (defun eglot-toggle ()
    "Toggle Eglot on and off."
    (interactive)
    (if eglot--managed-mode
        (eglot-shutdown)
      (eglot-ensure))))

;; PDF tools with Evil bindings
;; ---------------------------
(use-package pdf-tools
  :ensure t
  :config
  (pdf-tools-install)
  (setq-default pdf-view-display-size 'fit-page)
  (add-hook 'pdf-view-mode-hook 'evil-normalize-keymaps)
  (evil-define-key 'normal pdf-view-mode-map
    "j" 'pdf-view-next-line-or-next-page
    "k" 'pdf-view-previous-line-or-previous-page
    "h" 'image-backward-hscroll
    "l" 'image-forward-hscroll
    "G" 'pdf-view-goto-page
    "gg" 'pdf-view-first-page
    "gt" 'pdf-view-next-page-command
    "gT" 'pdf-view-previous-page-command))

;; Scale text in all buffers
;; -------------------------
(defadvice text-scale-increase (around all-buffers (arg) activate)
  (dolist (buffer (buffer-list))
    (with-current-buffer buffer
      ad-do-it)))

