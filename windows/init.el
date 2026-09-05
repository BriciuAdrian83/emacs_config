;; Disable the system cursor caused by screen reader etc. only necessary on windows
(setq w32-use-visible-system-caret nil)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Global UI Zoom increased for Windows
(let ((base-height 100)
      (scale-factor 2.1))
  (set-face-attribute 'default nil :height (truncate (* base-height scale-factor))))


;; Modeline font size (scaled relative to the new global default text) for Windows
(set-face-attribute 'mode-line nil :height 1.1)
(set-face-attribute 'mode-line-inactive nil :height 1.1)


;; Direct path to hunspell executable
(add-to-list 'exec-path "C:/hunspell/bin")
(setq ispell-program-name "C:/hunspell/bin/hunspell.exe")

;; Path to dictionaries (Include .aff extension here for Emacs 30.1)
(setq ispell-hunspell-dict-paths-alist
      '(("en_US" "C:/hunspell/share/hunspell/en_US.aff")
        ("ro_RO" "C:/hunspell/share/hunspell/ro_RO.aff")))

;; Configure dictionary parameters for Hunspell
(setq ispell-local-dictionary-alist
      '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)
        ("ro_RO" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "ro_RO") nil utf-8)))

;; Default dictionary
(setq ispell-dictionary "ro_RO")

;; Enable Flyspell automatically in text and code modes
(add-hook 'text-mode-hook 'turn-on-flyspell)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; Functions to switch languages
(defun my/set-spell-english ()
  "Switch spell checker to English."
  (interactive)
  (ispell-change-dictionary "en_US")
  (flyspell-buffer))

(defun my/set-spell-romanian ()
  "Switch spell checker to Romanian."
  (interactive)
  (ispell-change-dictionary "ro_RO")
  (flyspell-buffer))

;; Keybindings (C-c s e = English, C-c s r = Romanian)
(global-set-key (kbd "C-c s e") 'my/set-spell-english)
(global-set-key (kbd "C-c s r") 'my/set-spell-romanian)
