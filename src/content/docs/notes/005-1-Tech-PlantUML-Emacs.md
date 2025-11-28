---
filetags: ":emacs:plantuml:epubnote:"
id: 0703699b-25f7-402e-abcf-37dcd8d5264c
title: PlantUML in Emacs
---

## Latest Examples to Copy Code from

In Emacs, run code block using `C-c` and show inline images,
`counsel-git-grep` or ripgrep on text "begin<sub>src</sub> plantuml" for
other examples search in notes `begin_src plantuml` and see complex
examples at [C4 model for visualising software
architecture](/garden/notes/004-computer-tech-architecture-c4-model-for-software) -
[C4 model for visualising software
architecture](id:ac2b410e-5d70-4216-88b4-51b9dc492ad6)

``` elisp
;; Disable prompt on code block execution in org-babel
(setq org-confirm-babel-evaluate nil)
```

## How to use PlantUML in Emacs

- Use a code block like the following and a results block like that
  below will be automatically generated.
- Use `M-x plantuml-download-jar` to download it to
  `~/.config/emacs/plantuml/plantuml.jar`. Make sure the jar is copied
  to that location
- Use `plantuml-mode` on PlantUML files or highlight the PlantUML in a
  file like org-mode and `plantuml-preview` to generate diagrams
- In git, png files starting with `plantuml` will be ignored.
- Use `:exports both` in plantuml code block header to export both code
  and results during export

``` plantuml

Alice -> Bob: test

```
