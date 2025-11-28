---
filetags: ":revealjs:remarkjs:pandoc:slide-show:digital:presentation:epubnote:"
id: 1869af70-fe26-4cd3-be59-9023724372cc
title: Digital Presentations, Slide Shows
---

[Pandoc](https://pandoc.org/), a universal document formatting and
transformation program can be used to create presentations and other
document formats from files such as Markdown, Microsoft Word, text and
markup based file formats, Emacs Org-Mode and many other input types.

The advantage of using a common file format is many different types of
presentation output formats can be used. The types are explained in the
[Slide Shows section of Pandoc User’s
Guide](https://pandoc.org/MANUAL.html#slide-shows). The presentation
formats range from Microsoft PowerPoint, LaTeX beamer, PDF, and
JavaScript/HTML/CSS based frameworks of S5, DZSlides, Slidy, Slideous,
or reveal.js.

## Example Usage of Pandoc to create Presentations

``` shell

# Using a markdown source, convert to HTML and JS presentation
pandoc -t revealjs -s source.md -o presentation.html -V revealjs-url=https://unpkg.com/reveal.js@^5
# There are other -t options, see pandoc manual
# --slide-level to Override slide level with like 1, 2, 3

# Convert markdown to RevealJS presentation without transition, use white theme and local css
pandoc -t revealjs -s source.md -o presentation.html -V theme=white -V transition=none -V revealjs-url=https://unpkg.com/reveal.js@^5 --css slides.css
# Set custom stylesheet with --css

# Using a Emacs org-mode source, create a Microsoft PowerPoint presentation
pandoc -s mydoc.org -o presentation.pptx

```

## Tips for Navigating Slides

Source: [my-py-talks/llms-python-nov13/index.html at main ·
pamelafox/my-py-talks ·
GitHub](https://github.com/pamelafox/my-py-talks/blob/main/llms-python-nov13/index.html) -
Examples by RevealJS HTML presentations by Pamela Fox

- Press O or Escape for overview mode
- In html, visit `?print-pdf` for a printable version of presentation
- F to toggle full screen

## See Also

- [Pandoc Snippets](/garden/notes/005-computer-snippets-pandoc) - [Pandoc
  Snippets](id:56030404-6d4a-453b-9763-ceb5f016124b) for more examples
  on using pandoc to create presentations

### References

- [The HTML presentation framework \| reveal.js](https://revealjs.com)
- [my-py-talks/llms-python-nov13/index.html at main ·
  pamelafox/my-py-talks ·
  GitHub](https://github.com/pamelafox/my-py-talks/blob/main/llms-python-nov13/index.html) -
  Examples by RevealJS HTML presentations by Pamela Fox
- [GitHub - gnab/remark: A simple, in-browser, markdown-driven slideshow
  tool](https://github.com/gnab/remark)
- [Slide Shows - Pandoc User’s
  Guide](https://pandoc.org/MANUAL.html#slide-shows)
