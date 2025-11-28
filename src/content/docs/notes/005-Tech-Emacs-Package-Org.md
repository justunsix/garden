---
description: Explain concepts that org-mode serves and demonstrate use
  cases
filetags: ":org:emacs:package:epubnote:"
id: c64cef99-01d4-4c3b-aee1-d96e40101951
title: Emacs Org-mode
---

## Org Mode - a system for note-taking and project planning

Source: [Emacs Org-mode - a system for note-taking and project
planning](https://www.youtube.com/watch?v=oJTwQvgfgMM) with speaker:
Carsten Dominik, creator of org mode. Including notes from [org mode is
awesome - YouTube](https://www.youtube.com/watch?v=fgizHHd7nOo),
[Org-mode manual](https:/.mdmode.md/)

### Use cases

- Take notes
  - Outline documents
- Tasks, planning
  - To do list manager
  - Day planner (org-agenda)
  - Getting Things Done (GTD)
    - to do states, tags, contexts and agendas
- Time planning and accounting
- Small database (properties, metadata)
- Construct documents and websites
- Making drafts
- Swiss army knife

### Why Org Mode?

- Everything is text based
- Note based project planning
- GTD starts with projects, then tasks instead of just starting with
  tasks
  - Task come from projects. Use same tool for notes and planning
- Supports links, spreadsheets, export to different formats
- Easily use and embed latex - good for university

Principles:

- Simple core
- Not impose complexity

1.  Why not Org mode?

    - You will likely continue to customize and change it to your own
      needs
    - Not for masses and was intended for Emacs users

### Features

- Use outlines
- `Tab` to cycle view
- Promote and demote headings easily
- Ordered and unordered lists

### Meta Data

- Inheritance: org documents can have tags/properties, can be inherited
  by children
  - Search tags with `org-agenda` with `m` "Match TAGS/PROP/TODO option,
    then type tag you want to search on
- Accumulation: certain properties can be summed up (numbers, times,
  status flags)
- Support for
  - One key per tags
  - Completion (tags)
  - Clocking and timesheet system
  - Templates: to do lists, journal entries, links to context
  - Links to websites, org documents in specific places and headings,
    citations, emails, attachments, etc.

### Configuration

Add your org files using `org-agenda-files` variable or configuration in
your personal settings

``` elisp
;; Add my pcode org files so org agenda can find them
(custom-set-variables
 '(org-directory "~/myorgfiles")
 '(org-agenda-files (list org-directory)))
```

### Remember

- Remember
  - Quickly remember an item without disrupting your workflow with
    Remember: `M-x remember`
  - Recall notes with `M-x remember-notes`

### Collect and Display

- Tasks can be collected in special list, use queries
- Sparse tree - for single file, find stuff in outline structure
- Agenda view - parse outline nodes into a flat list

### Exporting and Publishing

- Export to HTML, PDF, LaTeX, Markdown, ASCII, iCal
  - Example: LaTeX equations
- Sets of documents can be linked to a publishing project

### Interfaces

- Date time
- Columns: Activate Org mode Columnar view: `C-c C-x C-c` and quit use
  `org-columns-quit`

1.  Tables

    ``` org

    | Name    |        Phone | Room        |
    |---------+--------------+-------------|
    | Peter   |       463733 | 32          |
    | John    | 323-323-4242 | Upstairs 62 |
    | Sabrina |      Unknown | Flr 1 242   |
    |         |              |             |
    ```

    - Press tab to start editing
    - Create header line with `|----` then press tab

    1.  Calculator

        - Interface with emacs calculator and tables to do math

        ``` org

        | Student  | Maths | Physics | Mean |
        |----------+-------+---------+------|
        | Bertrand |    13 |      09 |   11 |
        | Henri    |    15 |      14 | 14.5 |
        | Arnold   |    17 |      13 |   15 |
        |----------+-------+---------+------|
        | Means    |    15 |      12 |      |
        #+TBLFM: $4=vmean($2..$3)::@5$2=vmean(@2$2..@4$2)::@5$3=vmean(@2$3..@4$3)
        ```

        - Mean is a column formula, access it using: `C-c =`
        - Mean row is a row and cell formula

    2.  Radio Tables

        - [Org mode manual entry: Radio
          Tables](https:/.mdmode.md/manual/Radio-tables.html)

        - Embed an org-mode table in any file (e.g. Markdown, C,
          Javascript)

        - The key to finding the target location is the magic words
          'BEGIN/END RECEIVE ORGTBL'. They have to appear as comments in
          the current mode. Example insert into a C file:

        ``` c
        // At the location of source, Org needs a special line to direct Orgtbl to translate and to find the target for inserting the translated table. For example:

        #+ORGTBL: SEND table_name translation_function arguments ...

        /* BEGIN RECEIVE ORGTBL table_name */
        /* END RECEIVE ORGTBL table_name */
        ```

### Timer

- Set timer `org-timer-set-timer`

### Context Sensitive Keys

- Meta + cursor: Structure editing, table structure editing

- Look and update: `C-c C-c`

- `Tab`: Headline visibility, motion and table evaluation, LaTeX
  template expansion

- All printing characters: automatic overwrite mode in tables

- For radio tables, org table mode is a context sensitive minor mode

### Literate Programming

- Write programs and output results to org file (weave) or save to file
  (tangle)
- Can also work with compiled languages by combining tangle with shell
  command to compile and run source code file

In Linux shell

``` org
#+begin_src sh :results output
  echo PID: "$$"
  uname -a
,end_src
```

## See Also

- [Emacs org-mode shortcuts](/garden/notes/005-tech-emacs-shortcuts-mode) -
  [Emacs Shortcuts for
  org-mode](id:f3812051-ffec-4691-bdd0-c6bf791bb870)
- [Emacs Org-mode Clock](/garden/notes/005-tech-emacs-package-org-clock) - [Emacs
  Org-mode Clock](id:53ed1ca0-bf70-4a92-bd36-4e9a9e8cc260)
- [Emacs Org-mode Agenda](/garden/notes/005-tech-emacs-package-org-agenda) - [Emacs
  Org-mode Agenda](id:61e24f99-2680-48cd-8fee-7a686619e914)
