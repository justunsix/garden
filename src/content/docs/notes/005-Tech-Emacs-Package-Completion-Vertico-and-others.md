---
filetags: ":emacs:package:epubnote:"
id: 0e42b3c5-865b-4e77-9d71-f4b5d701ee06
title: "Package: Completion with vertico, marginalia, orderless,
  consult, embark and others"
---

## Using Vertical and other Completions

Looking at mini-buffer completion ease of use \[fn:1\]

``` commonlisp

;; Vectical mini-buffer completion
;; When typing in mini-buffer, completion list will be given
(use-package vertico
  :ensure t
  :config
  (vertico-mode 1))

;; Mini-buffer list item descriptions
(use-package marginalia
  :ensure t
  :config
  (marginalia-mode 1))

;; Mini-buffer search allows words to be in any order
(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless basic))
  (setq completion-category-defaults nil))

;; Emacs Built in pacakages
;; Use ensure nil since packages already part of Emacs

;; Save mini-buffer history
(use-package savehist
  :ensure nil
  :config
  (savehist-mode 1))

;; Delete selections (C-SPC)
(use-package delsel
  :ensure nil
  :config
  (delete-selection-mode 1))

```

## External Links

- [Switching from helm to vertico and
  friends](https://erick.navarro.io/blog/switching-from-helm-to-vertico-and-friends/)
- [Emacs: completion framework (Embark,Consult,Orderless,etc.) - Prot at
  YouTube](https://www.youtube.com/watch?v=43Dg5zYPHTU)
- [:completion vertico - Doom Emacs v21.12
  documentation](https://docs.doomemacs.org/latest/modules/completion/vertico/)

## References

- \[fn:1\] [Linkarzu with Prot-Learning Vanilla Emacs from Scratch with
  Prot as a Neovim User -
  YouTube](https://youtu.be/btAOBkcLEkg?t=3231) - section "vertico,
  marginalia, orderless"
