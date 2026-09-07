(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file t)


;; Show vertical options in the minibuffer
(use-package vertico
  :ensure t
  :config
  (vertico-mode 1))

;; Show more information on information in minibuffer
(use-package marginalia
  :ensure t
  :config
  (marginalia-mode 1))

;; Fix prefix complition in searching to match findings dinamically not respectiong a order
(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless basic))
  (setq completion-category-default nil))

;; Persisting information about visited file on next open built into emacs (nil instead of t - true)
(use-package savehist
  :ensure nil
  :config
  (savehist-mode 1))

;; Erase the selected text and insert new text
(use-package delsel
  :ensure nil
  :config
  (delete-selection-mode 1))
