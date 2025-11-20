---
filetags: ":emacs:revealjs:presentation:epubnote:"
id: bc7c6ee0-974b-4a53-93e2-3bda4dbedc4b
title: "Emacs Package: org-re-reveal, RevealJS"
---

## Usage

- Create a presentation in an org file
- Use level 1 headings are slides
- Optionally, additional subheadings can be under or bolded text
  sections

## Starting Template based on the org-re-reveal README.org presentation

``` org

#+title: Title of slides
# Turn off transitions and use simple white theme
#+REVEAL_TRANS: none
#+REVEAL_THEME: white
# Example from https://gitlab.com/oer/org-re-reveal/-/blob/main/Readme.org?ref_type=heads&plain=1
# Disable scaling, use a fixed viewing area and use browser zoom for text size control
# Use local css to left justify text like .reveal p { text-align: left; }
#+REVEAL_MIN_SCALE: 1
#+REVEAL_MAX_SCALE: 1
#+OPTIONS: reveal_width:1400 reveal_height:1000
#+REVEAL_EXTRA_CSS: basic-reveal-local.css

```

See the [org-re-reveal
README.org](https://gitlab.com/oer.md-re-reveal/-/raw/main/Readme.md)
for more examples of usage

- After finishing the presentation, export using `org-export-dispatch`
  and select reveal.js HTML presentation format
- Use `#+REVEAL: split` to insert a new slide inside an org heading

## See Also

### Resources

- [org-re-reveal on GitLab](https://gitlab.com/oer.md-re-reveal/)
- [Doom Emacs org module, see +present flag for slides
  configuration](https://docs.doomemacs.org/latest/modules/lang.org/)
  - For a simpler slide show experience inside Emacs, use
    `org-tree-slide`
