---
id: f2162753-fa54-47d9-bd7d-b5ead55b40ee
tags: ":markdown:snippets:epubnote:"
title: Markdown Snippets
---

``` markdown

<!-- References and footnotes -->

In a hole in the ground there lived a hobbit. Not a nasty, dirty, wet hole, filled with the ends
of worms and an oozy smell, nor yet a dry, bare, sandy hole with nothing in it to sit down on or to
eat: it was a [hobbit-hole][1], and that means comfort.

[1]: <https://en.wikipedia.org/wiki/Hobbit#Lifestyle> "Hobbit lifestyles"

<!-- will be rendered in html as: -->

<a href="https://en.wikipedia.org/wiki/Hobbit#Lifestyle" title="Hobbit lifestyles">hobbit-hole</a>

<!-- Tables -->
| Column1 | Column2 | Column3 | column 4 | col5 | col6 | col 7 |
| ------- | ------- | ------- | -------- | ---- | ---- | ----- |
| Item1   | Item1   | Item1   | ite      | ite  | ite  | ite   |

| column | column2 | column 3 |
| ------ | ------- | -------- |
| 1      |         |          |
|        | 2       |          |
|        |         |          |
|        | 2       | 2        |
| 5      | 4       | 3        |

<!-- With VS Code Markdown Table extension: https://marketplace.visualstudio.com/items?itemName=TakumiI.markdowntable - quickly create a new table with:
- Use command palette "Markdown:table navigate to next cell"
- Sort table using `format with` and choose markdown table sort
- To Sort markdown list (one level), copy it to Excel and sort column and copy by to markdown.
-->

| column | column2 | column 3 |
| --

<!-- Adding Images -->
![Alt text](https://assets.digitalocean.com/articles/alligator/boo.svg "a title")

```

## Linting Tools

``` bash

# Fix issues that can be fixed
## Note some like line lengths cannot be auto fixed at this time
markdownlint-cli2 --fix '**/*.md'

# Format markdown with prettier and wrap prose
prettier --parser markdown --prose-wrap always -w file.md
prettier --parser markdown --prose-wrap always -w *.md
# <always|never|preserve>
# -w write file in place

```

## See Also

- [Markdown notetaking](../370-education-info-markdown-notetaking) -
  [Markdown Notetaking](id:92f9d2eb-ff99-46fb-911c-8d02af2179ad)

### Resources

- [Markdown Guide - Reference style
  links](https://www.markdownguide.org/basic-syntax#reference-style-links)
- [Supported languages, shells in
  Markdown](https://github.com/highlightjs/highlight.js/blob/main/SUPPORTED_LANGUAGES.md)
