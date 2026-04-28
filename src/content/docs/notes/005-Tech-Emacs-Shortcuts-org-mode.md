---
filetags: ":emacs:shortcuts:epubnote:"
id: f3812051-ffec-4691-bdd0-c6bf791bb870
title: Emacs Shortcuts for org-mode
---

## File

| Name                                  | Shortcuts   |
|---------------------------------------|-------------|
| Quickly capture something like a task | org-capture |

## Edit

| Name                        | Shortcuts               |
|-----------------------------|-------------------------|
| Bold:                       | `*bold*`                |
| Italic                      | `/italic/`              |
| Link:                       | `[[link][description]]` |
| Mark element                | M-h                     |
| Lint file for syntax issues | org-lint                |

### Headings, Navigation

| Name                                            | Shortcuts          |
|-------------------------------------------------|--------------------|
| Go to next visible heading line at same level   | C-c C-f            |
| Go to visible heading: next or previous         | C-c C-n or C-c C-p |
| Insert new heading of same level below          | C-Enter            |
| Insert new heading of same level immediately    | M-Enter            |
| Move heading up/down (promote/demote)           | M-up or M-down     |
| Sort - Entries like headings, table, list, todo | C-c ^ or org-sort  |
| Copy heading content                            | org-copy-subtree   |

### Lists

| Name                                 | Shortcuts                         |
|--------------------------------------|-----------------------------------|
| Sort lists, tables by selection [^1] | org-sort= , =org-table-sort-lines |
| Indent headings/bullets              | M-left/right                      |
| Insert next item in list             | M-Enter                           |
| Check checkbox                       | C-c C-x C-b                       |
| org toggle on context [^2]           | Shift-Left or Shift-Right         |
| Toggle task priority (A, B, C)       | Shift-Up or Shift-Down            |

### Metadata

| Name                | Shortcuts                               |
|---------------------|-----------------------------------------|
| Tags - Add          | org-set-tags-command or counsel-org-tag |
| Tags - Add multiple | M-Enter                                 |
| Time estimate set   | org-set-effort                          |

#### Tags

- In configuration, add your custom tags with `org-tag-alist` like (setq
  org-tag-alist '(("work") ("home")))

### Paste org-download

| Name                           | Shortcuts              |
|--------------------------------|------------------------|
| Paste from clipboard           | org-download-clipboard |
| Paste images or media from URL | org-attach             |

- Favour using `org-download-clipboard` to get images or `org-mode`
  attach for links

## View

| Name                           | Shortcuts                                |
|--------------------------------|------------------------------------------|
| Toggle headings visibility     | Shift-Tab , Shift-Tab-Tab                |
| Open all folds of next heading | outline-show-subtree (z O in Doom Emacs) |

## Links

| Name | Shortcuts |
|----|----|
| Insert link | C-c C-l, org-insert-link |
| Insert link in any file like org mode would | org-insert-link-global |
| Open link | C-c C-o |
| Open link in any file like org mode would | org-open-at-point-global |
| Get link to current position such as heading in org file | org-store-link |
| Go back | org-mark-ring-goto |

`org-store-link` can be used outside of org files as well

- Insert link from other location like: `org-insert-link` or `C-c C-l`
  - Can be stored link from: `org-store-link`, which has no keyboard
    shortcut
  - To [insert a link from one org file to another
    file](https://emacs.stackexchange.com/questions/19598.md-mode-link-to-heading-in-other.md-file),
    use `org-store-link` at the location to link to, then
    `org-insert-link` where you want to link to be
  - Examples: https, roam, email, attachments
  - source: [Handling Links (The Org
    Manual)](https://orgmode.org/manual/Handling-Links.html)

## Search

- Search tags: `org-agenda` with `m` "Match TAGS/PROP/TODO option, then
  type tag you want to search on

| Name                  | Shortcuts |
|-----------------------|-----------|
| Navigate org headings | imenu     |

## Tables

Source: [Org tutorial for tables -
orgmode.org](https://orgmode.org/worg/org-tutorials/tables.html),
[james-stoup/org-mode-table-tutorial: A simplified guide to mastering
Org Mode table functions ·
GitHub](https://github.com/james-stoup.md-mode-table-tutorial)

Create table `C-c |` from scratch or existing values like a csv
formatted list.

| Name | Shortcuts |
|----|----|
| Cell, edit in other window | C-c \` |
| Change formula / format of table column | C-c = or org-table-eval-formula |
| Create or convert table from region/existing content | org-table-create-or-convert-from-region |
| Help, See current cell row and column information and reference | C-c ? |
| Table, Insert column to left or right | S-M-Right arrow or S-M-Left arrow |
| Table, Insert row to down or up | S-M-Down arrow or S-M-Up arrow |
| Table, Move column to left or right | M-Right arrow or M-Left arrow |
| Table, Move row down or up | M-Down arrow or M-Up arrow |
| Table, Move to next cell / auto format table | TAB |
| Table, sort | org-sort or C-c ^ |
| View, Adjust column width to expand to maximum | org-table-expand |
| View, Adjust column width to specific length | org-table-shrink |

For table formulas, see:

- Tutorial and examples at:
  [https://orgmode.org/worg/org-tutorials/org-spreadsheet-intro.html](https:/.orgmode.org/.md.md-tutorials.md-spreadsheet-intro.html)
- [https://orgmode.org/manual/field-and-range-formulas.htmand](https:/.orgmode.org/manual/Field-and-range-formulas.htmand)
- [https://orgmode.org/manual/formula-syntax-for-calc.html#formula-syntax-for-calc](https:/.orgmode.org/manual/Formula-syntax-for-Calc.html#Formula-syntax-for-Calc)

### Table Notation

Org mode uses the @ symbol to denote rows and the \$ symbol to denote
columns:

|        |        |        |
|--------|--------|--------|
| @1 \$1 | @1 \$2 | @1 \$3 |
| @2 \$1 | @2 \$2 | @2 \$3 |
| @3 \$1 | @3 \$2 | @3 \$3 |

## Literate Programming

### Babel Library of Source Code - Collection of code blocks

- For any user to add code to the library, first save the code in
  regular code blocks of an Org file, and then load the Org file with:
  `org-babel-lob-ingest`
- Source: [Library of Babel (The Org
  Manual)](https://orgmode.org/manual/Library-of-Babel.html)

## Org-clock Shortcuts

| Name                                   | Shortcuts        |
|----------------------------------------|------------------|
| Start clock on current task            | org-clock-in     |
| Stop clock on current task             | org-clock-out    |
| Get clock report for current task/file | org-clock-report |

## Org-roam

See also:

- [Info Productivity System Second
  Brain](/garden/notes/370-education-info-productivity-system-second-brain)
- [Org-roam User
  Manual](https://www.mdroam.com/manual.html#The-Org_002droam-Buffer)

| Name | Shortcuts |
|----|----|
| Create aliases for node names | org-roam-alias-add |
| Shows backlinks to current node and context of resources | org-roam-buffer-toggle |
| Add tag to current node | org-roam-tag-add |

### Org-roam-ui

| Name                                              | Shortcuts             |
|---------------------------------------------------|-----------------------|
| Start server and web interface                    | org-roam-ui-mode      |
| Zoom to current node in web (should be automatic) | org-roam-ui-node-zoom |

## Doom Org Module

+org/dwim-at-point: like check boxs, follow items, and [other
functions](https://github.com/doomemacs/doomemacs/blob/9620bb45ac4cd7b0274c497b2d9d93c4ad9364ee/modules/lang.org/autoload.md.el#L151)

[^1]: different than sort-lines due options and sorts alphabetical and
    sub bullets correctly with uppercase and lowercase

[^2]: Act on element according to context:

    - switch a timestamp at point one day into the past
    - on a headline, switch to the previous TODO keyword, like DONE
    - on an item, switch entire list to the previous bullet type
    - on a property line, switch to the previous allowed value
    - on a clocktable definition line, move time block into the past
    - in a table, move a single cell left
