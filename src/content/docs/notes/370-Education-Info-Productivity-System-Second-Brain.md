---
filetags: ":productivity:epubnote:"
id: 81a88400-1933-47d3-92a4-7381508c342c
title: Productivity System Second Brain
---

## Org Roam - Build a Second Brain in Emacs

### Sources:

- Video: [System Crafters - Getting Started with Org Roam - Build a
  Second Brain in Emacs](https://www.youtube.com/watch?v=AyhPmypHDEw)
- Source files: [Getting Started with Org
  Roam](https://systemcrafters.net/build-a-second-brain-in-emacs/getting-started-with.md-roam/)

### Introduction

Questions:

- How many org files do I need?
- What to put in org files?

Roam approach is creating topic focused org files rather than
hierarchical files. Like a personal wiki. Roam's strategy is taken from
Zettlekasten method.

- Single topic notes linked together to create a networked knowledge
  base
- Base reminds you of connections between topics

Why database?

- Org roam keeps track of all nodes and keeps track of links
- Allows to build on top of database

### Prerequisites

- Org Roam v2 depends on customized SQLite database
- Needs compiler to build or instructions for Windows

### Install

``` elisp
(use-package org-roam
  :ensure t)
```

- When run, will compile.
- Use a separate directory for org roam files as org roam files have
  special metadata
- If you have upgraded to v2, set to acknowledge the warning

### New Node

- Find, Create new node: `C-c n f`
  - Starts with a capture buffer before being created
- They are org file with additional properties. Org Roam will re-build
  database based on files. Database will system itself to files and can
  work across machines.
- New nodes can be created within a node with creating an org ID in a
  heading
- Create aliases for node names: `org-roam-alias-add`

### Link

- Create a new node insert: `org-roam-node-insert` or `C-c n i`
  - Inserts link to existing node. Link is based on org ID and not file
    paths
- Create new links to nodes and nodes will be automatically created

### Viewing Backlinks

-Shows backlinks to current node and context of resources:
`org-roam-buffer-toggle`

### Benefits

- Build personal knowledge base
- Write smaller notes and have relationships, think less of about
  hierarchy

## Capturing Notes Efficiently in Emacs with Org Roam

### Reference

- Video: [Capturing Notes Efficiently in Emacs with Org
  Roam](https://www.youtube.com/watch?v=YxgA5z2R08I)

### Overview

- Custom templates to insert into org roam files
- Good capture workflow

### Capture Templates

Common information you want to capture:

- Summary of content
- Bibliography
- Quotations
- Links to relevant notes and resources to expand on ideas learned

Org Roam has its own capture templates for new notes. It is a separate
capture system from org capture. During node creation, org roam can
prompt you to select your own custom capture templates.

1.  Default Org-Roam Capture Template

    To build custom templates, we will set the
    `org-roam-capture-templates` variable which will overwrite the
    default, so the default one needs to be copied over. The default is:

    ``` elisp

    '(("d" "default" plain
     "%?"
     :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
     :unnarrowed t))

    ```

    - "d" is the key to trigger the template
    - "default" is the name of the template
    - "plain" is the type of text to insert, others with subheadings in
      notes are available, plain is most common
    - "%?" is the actual text being inserted, from org mode
    - ":if-new …" is the file name and the header - recommend not
      changing to allow unique note names, title of document is set
      based on title you give
    - ":unnarrowed t" org setting so full file is visible on creation

    Opportunities to Configure:

    - File name
    - Text to insert in note
      - Prompt yourself to fill in information

    [Org Roam Manual: The Templating
    System](https://www.mdroam.com/manual.html#The-Templating-System)

2.  Topic Specific Template

    Example, new template on programming languages

    ``` elisp

    ("l" "programming language" plain
     "* Characteristics\n\n- Family: %?\n- Inspired by: \n\n* Reference:\n\n"
     :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
     :unnarrowed t)

    ```

    - "\* Characteristics" is the first heading
    - "- Family: …" bullet points to insert initially
    - "%?" where cursor will start
    - "if-new…" unchanged from default template

    Try it out with `org-roam-node-insert` and it will ask you for the
    template to use. Fill out note, then `C-c C-c` to save.

3.  Creating a literature reference template

    Notes for books, articles, etc.

    ``` elisp

    ("b" "book notes" plain
     "\n* Source\n\nAuthor: %^{Author}\nTitle: ${title}\nYear: %^{Year}\n\n* Summary\n\n%?"
     :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
     :unnarrowed t)

    ```

    - "%<sup>Author</sup>" is a prompt to fill in author
    - "%<sup>Year</sup>" is a prompt to fill in year
    - "\${title} insert title of new note as literature name
    - "\* Summary" first heading of note

    [Org Mode Manual: Template
    Expansion](https:/.mdmode.md/manual/Template-expansion.html#Template-expansion)

4.  Project template

    ``` elisp

    ("p" "project" plain "* Goals\n\n%?\n\n* Tasks\n\n** TODO Add initial tasks\n\n* Dates\n\n"
     :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: Project")
     :unnarrowed t)

    ```

    - Entries for name, status, dates, tasks (with org TODO), references
    - Notice in `if-new` has a `filetags:` section and file is tagged as
      project
      - Later you can use org-roam database to query project files like
        to use with org-agenda
      - Using selectrum/vertico with marginalia, can see tags in file
        list

5.  Store Templates in Org Files

    Instead of editing in elisp, can store the templates in org files

    - Create a new node after the name of your template, like
      "Note-Template-Book.org"

    ``` org

    * Source

    Author: %^{Author}
    Title: ${title}
    Year: %^{Year}

    * Summary

    %?

    ```

    - In actual template, remove the , in front of the \*
    - Save the file and replace the init.el entry like following:

    ``` elisp

    (org-roam-capture-templates
     '(("d" "default" plain
        "%?"
        :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
        :unnarrowed t))
     ("b" "book notes" plain (file "~/RoamNotes/Templates/Note-Template-Book.org")
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)
     )
    ```

6.  Customizing the Default Template

    ``` elisp

    ("d" "default" plain "%?"
     :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+date: %U\n")
     :unnarrowed t)

    ```

    - "+date: %u" adds a date to meta of note
    - You can customize the file name, like remove the timestamp, though
      beware of filename collisions

    See further examples of possible inserts in [Org Mode Manual:
    Template
    Expansion](https:/.mdmode.md/manual/Template-expansion.html#Template-expansion)

    If you change the template, keep in mind you'll need to update older
    files using the template to match your new format.

## Org Roam: The Best Way to Keep a Journal in Emacs

### Sources:

- [Org Roam: The Best Way to Keep a Journal in Emacs
  Video](https://www.youtube.com/watch?v=3-sLBaJAtew)

See also rest of series
[https://www.youtube.com/@SystemCrafters/search?query=org%20roam](https://www.youtube.com/@SystemCrafters/search?query.md%20roam)

## How to Build the Ultimate Productivity System (2022)

2../022-10-01 [source](https://www.youtube.com/watch?v=t6hmdrsLQj8) Ali
Abdaal

### Layer 1

- Calendar
- Email
- Task Manager
- File management

### Layer 2

- Reading / Library
  - Plus contextual notes
  - To read list
- Notes

### Layer 3

- "Second brain"
