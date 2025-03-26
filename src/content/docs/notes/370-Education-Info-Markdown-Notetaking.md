---
filetags: ":markdown:note:knowledge:management:epubnote:"
id: 92f9d2eb-ff99-46fb-911c-8d02af2179ad
title: Markdown Notetaking
---

## Thinking about VS Code for note taking

References:

- [Open format (VS Code
  section)](https://davidmytton.blog/the-best-note-taking-apps-for-mac-markdown-open-format-cross-platform/)
- [VS Code workflow with Joplin and
  extensions](https://dev.to/rxliuli/using-vscode-joplin-as-a-note-taking-tool-4i9j)
- [VS Code as Markdown Note-Taking App - Helge
  Klein](https://helgeklein.com/blog/2020/10/vs-code-as-markdown-note-taking-app/)
- [Markdown Notes with VS Code - Hammer Time
  Tech](https://www.hammertime.tech/2021/02/17/Markdown-Notes-with-VS-Code#Plugins) (plugins)
- [Foam -
  extensions](https://foambubble.github.io/foam/recommended-extensions),
  includes git auto commit

## Pandoc: Pasting and Conversion

- [GitHub -
  SjoerdV/ConvertOneNote2MarkDown](https://github.com/SjoerdV/ConvertOneNote2MarkDown)
- [Pandoc - Installing
  pandoc](https://pandoc.md/installing.html) / [pandoc/dockerfiles](https://github.com/pandoc/dockerfiles#available-images)
- [Paste to Markdown](https://github.com/justunsix/clipboard2markdown)
  fork of [Paste to Markdown
  website](http://euangoddard.github.io/clipboard2markdown/) and Github
  code for local run

## VS Code Extensions Evaluated

### Image/Paste management

- [Paste
  Image](https://marketplace.visualstudio.com/items?itemName=mushan.vscode-paste-image)

1.  Not Used

    - [Markdown
      paste](https://marketplace.visualstudio.com/items?itemName=telesoho.vscode-markdown-paste-image) -
      paste text, rich text, html, images
    - [PicGo](https://marketplace.visualstudio.com/items?itemName=Spades.vs-picgo)
      (image uploader, useful but for now - N/R)
    - [Turndown
      extension](https://marketplace.visualstudio.com/items?itemName=kurre.turndown-vscode)
      paste HTML to Markdown based on [Turndown at
      Github](https://github.com/domchristie/turndown)

### Minimal Extensions

To improve VS Code CPU and RAM usage

- Markdown All in One
- Markdownlint (optional)
- Nested tags (optional)

1.  Installed

    - [Nested Tags - Visual Studio
      Marketplace](https://marketplace.visualstudio.com/items?itemName=vscode-nested-tags.vscode-nested-tags)
    - [Markdown All in One - Visual Studio
      Marketplace](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)
    - [Spell Right - Visual Studio
      Marketplace](https://marketplace.visualstudio.com/items?itemName=ban.spellright)
      - [markdownlint - Visual Studio
      Marketplace](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)
    - [Markdown Extended - Visual Studio
      Marketplace](https://marketplace.visualstudio.com/items?itemName=jebbs.markdown-extended)
      for occasional use; with kbd option disabled, kbd turns wiki-links
      into non-clickable buttons, useful for tables)
    - [Markdown Notes - Visual Studio
      Marketplace](https://marketplace.visualstudio.com/items?itemName=kortina.vscode-markdown-notes)
    - [Markdown Table - Visual Studio
      Marketplace](https://marketplace.visualstudio.com/items?itemName=TakumiI.markdowntable)

    1.  Diagrams

        - [Draw.io](https://marketplace.visualstudio.com/items?itemName=hediet.vscode-drawio)
          recommended from [Foam
          diagrams](https://foambubble.github.io/foam/recipes/diagrams-in-markdown)
        - [Mermaid Support for
          Preview](https://marketplace.visualstudio.com/items?itemName=bierner.markdown-mermaid)
        - [Mermaid Markdown Syntax
          Highlighting](https://marketplace.visualstudio.com/items?itemName=bpruitt-goddard.mermaid-markdown-syntax-highlighting)

    2.  Not Required

        - [All Autocomplete - Visual Studio
          Marketplace](https://marketplace.visualstudio.com/items?itemName=Atishay-Jain.All-Autocomplete)
        - [Peacock - Visual Studio
          Marketplace](https://marketplace.visualstudio.com/items?itemName=johnpapa.vscode-peacock) (multi
          colour workspaces)
        - [Markdown Preview Enhanced - Visual Studio
          Marketplace](https://marketplace.visualstudio.com/items?itemName=shd101wyy.markdown-preview-enhanced)
        - [Mermaid Support for
          Preview](https://marketplace.visualstudio.com/items?itemName=bierner.markdown-mermaid) (N/R
          for later)
        - [Mermaid Markdown Syntax
          Highlighting](https://marketplace.visualstudio.com/items?itemName=bpruitt-goddard.mermaid-markdown-syntax-highlighting) (N/R
          for later)
        - [Web
          Clipper](https://marketplace.visualstudio.com/items?itemName=jsartelle.web-clipper) This
          is a Web Clipper as a VS Code extension, takes a webpage URL
          and outputs Markdown.
          Uses [mercury](https://github.com/postlight/mercury-parser)
        - [Markdown Clipper](https://github.com/deathau/markdownload)A
          Firefox and Google Chrome extension to clip websites and
          download them into a readable markdown file
        - [markdown-link-expander - Visual Studio
          Marketplace](https://marketplace.visualstudio.com/items?itemName=skn0tt.markdown-link-expander)
        - [git
          auto-push](https://github.com/loftkun/git-auto-push) (shell
          script) (existing [GitDoc - Visual Studio
          Marketplace](https://marketplace.visualstudio.com/items?itemName=vsls-contrib.gitdoc) extension
          could do it on save without error)
        - [Markdown
          Links](https://marketplace.visualstudio.com/items?itemName=tchayen.markdown-links)
          graph of markdown files and links between them for visualizing

## Converting from OneNote to Markdown

1.  Copy note from OneNote to Docx
2.  See [pandoc snippets](../005-computer-snippets-pandoc) section
    "Converting docx with images to markdown"

OR

Use [PowerShell
script](https://github.com/SjoerdV/ConvertOneNote2MarkDown), requires:

- Flatten all OneNote sections

## See Also

- [Pandoc Snippets](../005-computer-snippets-pandoc) - [Pandoc
  Snippets](id:56030404-6d4a-453b-9763-ceb5f016124b) - how to convert
  notes to other formats and paste into notes
- [Markdown Snippets](../005-computer-snippets-markdown) - [Markdown
  Snippets](id:f2162753-fa54-47d9-bd7d-b5ead55b40ee) - pieces of notes
  for reuse
- [VS Code Tips](../005-computer-shortcuts-vs-code) - [VS Code:
  Tips](id:b91168f4-673f-4580-a248-ae4b85aa3439)
- [Information management personal knowledge
  management](../370-education-info-personal-knowledge-management-system) -
  [Personal Knowledge Management
  System](id:0d36d526-cbec-4809-85cd-b306bb0bf573)
