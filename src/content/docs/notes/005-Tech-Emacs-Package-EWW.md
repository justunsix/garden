---
filetags: ":emacs:eww:epubnote:"
id: 5f9fa5b6-491f-4df7-86b9-fc08d64fe6e5
title: "Emacs Package: Eww Emacs Web Wowser"
---

Source: [Emacs: EWW and my extras (text-based
browser)](https://www.youtube.com/watch?v=1lyGegcYxTI)

## Basics

- `M-x eww` call eww browser with URL or search keywords for default
  search engine (DuckDuckGo)

## Possible Enhancements

Helpful features from Prot in
[prot-eww.el](https://gitlab.com/protesilaos/dotfiles/-/blob/master/emacs/.emacs.d/prot-lisp/prot-eww.el):

- Auto completion for eww command
- Pre-populate eww minibuffer with current page if on a current page
- Rename eww buffers to the page title, helpful with
  `eww-switch-to-buffer`
- Jump to URL in page with auto complete, extract all links in buffer
  and display a list
- Enhanced bookmarks to let you name your bookmarks
- Enhanced reader mode
