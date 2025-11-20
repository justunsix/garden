---
filetags: ":emacs:shortcuts:epubnote:"
header-includes:
- <link rel="stylesheet" type="text/css" href="basic-org.css"/>
id: daea5d06-6895-4073-a5c7-64e8f21bf085
title: Emacs Shortcuts
---

<link rel="stylesheet" type="text/css" href="basic-org.css"/>

## Sources

- Main source is [Absolute Beginners Guide to
  Emacs](http://www.jesshamrick.com/2012/09/10/absolute-beginners-guide-to-emacs/)
  with pictures and key bindings, good plain language overview
- Use modeline to check place in file: \<file\> line number:column
  top/bot/all/xx%
  - Top first line is visible
  - Bot last line is visible
  - All first and last line are visible
  - 45% relative position in the file
  - Format is same as vim ruler (in vim `:help ruler`)

## High usage

| Name | Shortcuts |
|----|----|
| Run any command | M-x |
| Run commands relevant to buffer modes | M-S-X (M-X) |
| Find / Open file | find-file |
| Save buffer | C-x C-s |
| Help | C-h C-h |
| Quit partial command | C-g |
| Exit emacs | C-x C-c |
| Switch buffers | C-x b |
| Switch buffers: List Buffers | C-x C-b |
| Switch buffers: Cycle through buffers | C-x right , C-x left |
| Quit read only buffer | q |
| Personal and common major mode leader key | C-c |
| Reload screen, mode (many modes like magit, dashboard) | g |

## System

| Name | Shortcuts |
|----|----|
| proced: htop equivalent, list system processes and act on them | proced |
| proced: Mark | m |
| proced: sort, select sorting | s |
| proced: sort, by memory | s m |
| Restart Emacs | restart-emacs |

### Updates of Packages

| Name                                   | Shortcuts               |
|----------------------------------------|-------------------------|
| Update all packages                    | auto-package-update-now |
| Update all straight installed packages | straight-pull-all       |

## Frame (Modern Windows) Management and Buffers

### Frames

| Name                                  | Shortcuts |
|---------------------------------------|-----------|
| New frame (window)                    | C-x 5 2   |
| Close frame (window)                  | C-x 5 0   |
| Speedbar (like file, buffer explorer) | speedbar  |

### Windows

| Name                                         | Shortcuts |
|----------------------------------------------|-----------|
| Split, set only 1 window (un-split)          | C-x 1     |
| Split window horizontally                    | C-x 2     |
| Split window vertically                      | C-x 3     |
| Go to other windows (cycle through windows)) | C-x o     |

## Editing

### General Editing

| Name                    | Shortcuts                                   |
|-------------------------|---------------------------------------------|
| Indent region `fn1`     | C-M-\\ or indent-region                     |
| Indent region right     | Ctrl + right arrow                          |
| Indent region left      | Ctrl + left arrow                           |
| Indent region with keys | Select region, C-x TAB, use arrows, ESC x 3 |

- `fn1` Indent region can be used to indent region to same column or
  "delete" an indent by reset the first item in the region to the
  desired indentation.

### Select / Marking, Killing and Yanking Text

| Name | Shortcuts |
|----|----|
| Mark / Select | C-SPC (Spacebar) to start/stop highlight |
| Mark - multiple select, region in rectangle, if in Evil, switch to Emacs | C-x SPC or rectangle-mark-mode |
| Mark - paragraph | mark-paragraph |
| Mark - select current paragraph | M-h |
| Cut (kill marked) text | SHIFT-DEL or C-w |
| Cut to end of current line | C-k |
| Copy (copy marked) text | C-INSERT or M-w |
| Paste (yank text back) | SHIFT-INSERT or C-y |
| Paste (using kill ring) | M-y or M-Y (reverse direction) |
| Undo - redo | C-/ or C-\_ |
| Undo | C-M-\_ |
| Undo Multiple Mode | undo-tree-mode |
| Kill word (delete word near cursor) | M-d |
| Comment Region / Uncomment region | M-; / uncomment-region |
| Comment region with box | comment-box |
| Clear kill ring | (setq kill-ring nil) |

- For undo in region, select/mark region and undo will be limited to the
  region, there are other operations like replace-string (search and
  replace) that work the same way

### Find and Replace

See also:

- [Emacs Search with fzf, ripgrep, ivy, counsel, consult,
  vertico](../005-tech-emacs-search-fzf-ripgrep-ivy-counsel) - [Emacs
  Search with fzf, ripgrep, ivy, counsel, consult,
  vertico](id:026ff642-5c97-4465-a4c2-e71fa8e2b63a)

1.  Default isearch, occur

    Only matches characters, not regex unless using isearch-…-regex

    | Name | Shortcuts |
    |----|----|
    | Search in file isearch | C-s or isearch-forward, C-s or isearch-backward |
    | Search in file isearch, cancel | C-g |
    | Search in file isearch, enter at point | Enter |
    | Search in file isearch, enter beginning of search word | C-b |
    | Search in file isearch, repeat last search | C-s C-s or C-r C-r |
    | Search in file isearch regex | C-M-s or isearch-forward-regex, C-M-r or isearch-backward-regex |
    | Search with search results occur | M-s-o or occur |
    | Search in file isearch with occur for buffer with results | C-s \<search-text\> M-s-o (while in isearch) |
    | Search and highlight in file | M-s h l or hi-lock-face-buffer |
    | Search and highlight in file, cancel | M-s h u or hi-lock-unface-buffer aka unhighlight-regexp |

2.  Find/Search and Replace

    | Name | Shortcuts |
    |----|----|
    | Search all files with \* | M-x grep , grep \<options\> PATTERN \* |
    | Search and replace with extra functionality | M-Shift-% or query replace or replace-string |
    | Find and replace search query | M-% or query-replace |
    | Find and replace search query from isearch | C-s \<search-text\> M-% (while in isearch, can also work with isearch regex commands) |
    | Find and replace search query, previous queries | M-p |

3.  Other packages

    Find and replace works for whole buffer or selected region

    | Name | Shortcuts |
    |----|----|
    | Search in file | M-x swiper or helm-swoop |
    | Find and replace - Close all file buffers | projectile-replace |
    | Find and replace - Close all file buffers | `dired-do-find-regexp-and-replace` (Q) in dired in a directory or with marked files |
    | Find word -Search (backward) | C-r or Backspace (aka DEL) |
    | Regexp "helper" | M-x re-builder |

### Delete

| Name | Shortcuts |
|----|----|
| Delete the character just before the cursor | \<DEL\> |
| Delete the next character after the cursor, delete line on character before empty lines | C-d |
| Delete to end of line/beginning of line | C-k, C-u |
| Kill from the cursor position to end of line | C-k |
| Kill the next word after the cursor | M-d |
| Kill the word immediately before the cursor | M-\<DEL\> |
| Kill to the end of the current sentence | M-k |

### Abbreviations

- Use `abbrev-mode` to auto expand abbreviations when they are typed

- Combine abbreviations like:

  - Instead of typing “electromagnetic” type: eltr M-' mgntc; and emacs
    will expand it to “electromagnetic”

### Capitalization Of Words

Use various functions to convert region/words to all uppercase,
lowercase or capitalize all words

| Name                           | Shortcuts      |
|--------------------------------|----------------|
| Capitalize words in region     | Capitlize-dwim |
| Upper case all words in region | upcase-dwim    |
| Lower case all words in region | downcase-dwim  |

## View and Buffer Navigation

- Combine navigation commands with `C-u` + number plus the navigation
  command to move by that number (e.g. `C-u 2 C-f` to move forward 2
  characters).

| Name | Shortcuts |
|----|----|
| Move forward a character | C-f |
| Move backward a character | C-b |
| Move forward a word | M-f= or `C-arrow-key-left                 | | Move backward a word                        | M-b` or =C-arrow-key-right |
| Move to next line | C-n |
| Move to previous line | C-p |
| Move to beginning of line | C-a or home |
| Move to end of line | C-e or end |
| Move to beginning of buffer | M-\< or =C-Home |
| Move to end of buffer | M-\> or =C-End |
| Move back to beginning of sentence | M-a |
| Move forward to end of sentence | M-e |
| Scroll up | Page Up or C-v |
| Scroll up other window | M-Page Up |
| Scroll down | Page Down M-v |
| Scroll down other window | M-Page Down |
| Increase font / text size | C-x C-+ or text scale increase |
| Navigate on headings / code parts in buffer | counsel-imenu or imenu / M-g i (Emacs 29) |
| Navigate on headings | counsel-outline |
| Switch to or restart '****scratch****' buffer | scratch-buffer |
| Center current line in buffer | C-l |
| Center current line in buffer, then top | C-l C-l |
| Clone, duplicate buffer | clone-buffer |

### Justification, Margins, Fixed Width of Columns, Guide lines

Source: [Issue 001 - System
Crafters](https://systemcrafters.net/newsletter/sc-news-001.html) - see
Tips of the Week

| Name | Shortcuts |
|----|----|
| Draw line in buffer where fill-column is set | display-fill-column-indicator-mode |
| Automatically wrap paragraph text to fit within the specified width | auto-fill-mode |
| Center a region | center-region |
| Reshapes a paragraph of text so that it fits under 80 columns | M-q or fill-paragraph |

- Set at where `fill-column` cuts off for display fill column indicator

### Bookmarks and Registers

Source: [GNU Emacs Manual -
Registers](https://www.gnu.org/software/emacs/manual/html_mono/emacs.html#Registers)

Register is like a bookmark/saved text, position, window/frame
configuration, and rectangle for later use. Register names are a single
character like r.

| Name                       | Shortcuts                |
|----------------------------|--------------------------|
| Bookmark set               | C-x r m, bookmark-set    |
| Bookmark: jump to          | C-x r b , bookmark-jump  |
| Bookmark: list all         | C-x r l , list-bookmarks |
| Bookmark: save all to file | bookmark-save            |

| Name | Shortcuts |
|----|----|
| Register: View contents of named register "r" | view-register RET r |
| Register: Record position of point in register "r" | C-x r SPC r , point-to-register |
| Register: Go to register "r", recall frameset, number, etc. | C-x r j r , jump-to-register |
| Register: Copy region into register "r" | C-x r s r , copy-to-register |
| Register: Insert (paste) from register "r" | C-x r i r, insert-register |
| Register: Append region to register "r" | append-to-register RET r |
| Register: Prepend region to register "r" | prepend-to-register RET r |
| Register: Copy rectangle region to register "r" | C-x r r r , copy-rectangle-to-register |
| Register: Insert rectangle region to register "r" | C-x r i r , copy-rectangle-to-register |
| Register: Save window and frame configurations | window-configuration-to-register |
| Register: Save frames and windows configurations | frameset-to-register |
| Register: Restore window/frame config (same as jump) | C-x r j r , jump-to-register |
| Register: Store number in register "r" | C-x r n r , number-to-register |
| Register: Increment number in register "r" | C-x r + r , increment-register |
| Register: Save macro to register "r" | C-x C-k x r , kmacro-to-register |
| Register: Execute keyboard macro in register "r" | C-x r j r |

- Save file and buffer names in registers:
  `(set-register r '(file . name))`

## Options and Customization

| Name | Shortcuts |
|----|----|
| Customize interface | M-x customize |
| Activate text major mode | M-x text-mode |
| Completion, minibuffer | M-x.ido-mode or fido-mode |
| Change margins for auto-fill-mode auto line wrapping) | C-x f |
| Set directory local variables | M-x.add-dir-local-variable or use .dir-locals.el |

- Set directory local variables that only apply in a certain directory
  like with using projectile-test-cmd, setting file formatter, project
  and [language specific
  configurations/LSPs](https://blog.aheymans.xyz/post/emacs-lsp-rust-features/)
  and others

Example `.dir-locals.el` to set compile command

``` commonlisp

((nil . ((compile-command . "cmake --fresh -S <source> -B <build> && cmake --build  <build> -j32 && ctest --output-on-failure --test-dir <build> -j32"))))

;; For a rust project, tells LSP to analyze the code with the generate_templates feature enabled
;; Additional multiple features can be added like debug_mode and experimental
((nil . ((lsp-rust-features . ["generate_templates" "debug_mode" "experimental"]))))

```

## Macros

- per [Emacs: store music playlists
  (Dired+Bongo)](https://youtu.be/-qo2Ai3pZRk?t=553)
- per [Keyboard Macros are Misunderstood - Mastering
  Emacs](https://www.masteringemacs.org/article/keyboard-macros-are-misunderstood)

| Name | Shortcuts |
|----|----|
| Record macro | F3 |
| Stop recording macro | F4 |
| Execute macro | F4 |
| Execute macro until end of file or error | C-0 F4 |
| Name, save macro | M-x kmacro-name-last-macro= (use a prefix like mp-) |
| Have Emacs generate Elisp for a macro | M-x insert-kbd-macro |

- Tip: using `insert-kbd=macro`, save for use as an interactive function
  for repetitive use

## Help

| Name | Shortcuts |
|----|----|
| Help | C-h |
| Help on feature | C-h c |
| Help on command | C-h k |
| Help on function (describe-function) | C-h f= - can drill into function's cod |
| Help on variable (describe-variable) | C-h v |
| Help on key bindings for current function/minibuffer | C-h b |
| Help on all active major and minor modes | C-h m or M-x describe-mode |
| Help Apropos (search command keyword) | C-h a |
| Help Search - search all manuals | info-apropos |
| Read manuals (aka info) for installed packages | C-h i |
| Open emacs manual | C-h r |
| Help buffer - next / Previous page in Info buffer | n / p |

### Info Mode

For Emacs manuals, `info-emacs-manual` and press `h` to view info mode
manual

| Name                                      | Shortcuts        |
|-------------------------------------------|------------------|
| Cross references                          | f                |
| Directory, list of manuals                | d                |
| Help for info mode                        | S-H or ?         |
| Link, go back                             | l                |
| Link, history of nodes visited            | L                |
| Link, return to previous node             | r                |
| Menu, up                                  | u                |
| Node, go to node by name                  | g                |
| Node, menu                                | m                |
| Node, menu selections (if available)      | 1, 2, 3, - , 9   |
| Node, next                                | n, Enter, \]     |
| Node, previous                            | p, \[            |
| Node, top node of current manual          | t                |
| Node, top of info manuals directory       | d                |
| Page, Backward                            | Del or Backspace |
| Page, Forward or next node at end of page | Space            |
| Page, Reset                               | C-l              |
| Quit                                      | q                |
| Search, all info manuals installed        | M-x info-apropos |
| Searc, with autocomplete                  | m                |
| Search, index                             | i                |
| Search, manual                            | s                |

g command examples

| Name                               | Shortcuts          |
|------------------------------------|--------------------|
| Go to info-mode directory node     | g(dir)Top\<RET\>   |
| Go to Emacs directory node         | g(emacs)Top\<RET\> |
| Go to whole file of current manual | g\*\<RET\>         |

## Emacs Window, Start, Lisp

| Name                                     | Shortcuts     |
|------------------------------------------|---------------|
| Suspend Emacs temporarily                | C-x C-z       |
| Run emacs for first time on command line | emacs -q      |
| Check for unbalanced parentheses in Lisp | check-parens= |

### Evaluate Elisp

| Name | Shortcuts |
|----|----|
| Run elisp code | eval-expression or M-: |
| Evaluate the current elisp expression | C-x C-e or eval-last-sexp |
| Evaluate region or buffer | C-c C-e or elisp-eval-region-or-buffer |

## Terminal

| Name             | Shortcuts  |
|------------------|------------|
| Open shell       | M-x eshell |
| Open other shell | M-x term   |

### term-mode / ansi-term modes

| Name | Shortcuts |
|----|----|
| Line mode to navigate buffer independent of prompt | C-c C-j (on) / C-c C-k (off) |
| Access Emacs command prompt | C-x M-x= (my binding is F1) |
| Scroll one screen at a time | S-Page Up/Down |
| Send `C-c` SIGINT to terminal | C-c C-c or `C-g C-c C-c` to quit any keyboard commands and send SIGINT) |

### Async shell command

- Run shell command asynchronously: `M-&` - show command results in
  separate buffer

### eshell

| Name             | Shortcuts      |
|------------------|----------------|
| Run command, one | eshell-command |

## Artist mode - drawing

| Name                             | Shortcuts   |
|----------------------------------|-------------|
| Activate artist mode for drawing | artist-mode |

## Web Browser: EWW / System

| Name | Shortcuts |
|----|----|
| Open web browser | eww |
| Open system browser on current file / url | browse-url-of-file, browse-url |
| Open html file, from eww or other browser | eww-open-file |
| Reader mode to remove nav headers and others | R, eww-readable |
| Copy text from eww with org mode links | org-eww-copy-for-org-mode |
| Previous, next page | l, r |

## Development on Languages, include Prose

| Name | Shortcuts |
|----|----|
| Completion, Suggestions at cursor | completion-at-point |
| Flycheck, check LSP, linters, checkers enabled | C-c ! v or flycheck-verify-setup |
| Flycheck, LSP, linters, Errors List | C-c ! l or flycheck-list-errors |
| LSP Mode - Leader key | C-c l |
| LSP Mode - Find references | C-c l g r |
| LSP Mode - Find definitions | C-c l g g |
| LSP Mode - Refactor like rename | C-c l r |
| LSP Mode - Flymake tracks problems in file | flymake-show-buffer-diagnostics |
| LSP Mode - Code formatting | C-c l = == or TAB |
| LSP Mode - Display symbols with treemacs | M-x lsp-treemacs-symbols |
| LSP, Update LSP servers | M-x lsp-update-servers |
| LSP, Update LSP specific server | M-x lsp-update-server |
| Tags, automatically regenerate TAGS file in repo | M-x etags-regen-mode |
| Spelling - Flyspell autocorrect word | C-M-i |
| Spelling - Flyspell suggest words for correction | C-c-\$ |
| Compile, run async shell command, output buffer | M-x compile |
| Compile, go to next error and file | C-x \` |
| Compile, run last compile command again | M-x recompile |

### Diff

Source: [ediff Basics -
Prot](https://www.youtube.com/watch?v=pSvsAutseO0)

- Function to see difference between files side by side
- When going through diffs, see ediff control panel for description of
  differences
- Buffers are normal buffers and can be edited
- ediff can be used in magit status, when selecting commits

| Name                                                | Shortcuts     |
|-----------------------------------------------------|---------------|
| Diff on Files                                       | ediff-files   |
| Diff on 3 Files                                     | ediff3-files  |
| Diff on buffers                                     | ediff-buffers |
| Diff on buffers, ediff help                         | ?             |
| Diff, ediff move difference at point in file A to B | a             |
| Diff, ediff move difference at point in file B to A | b             |
| Diff, ediff next, previous difference               | n, N          |
| Diff, ediff diff output difference                  | D             |
| Diff, ediff quit                                    | q             |

## Files

| Name                       | Shortcuts        |
|----------------------------|------------------|
| Recover file from autosave | M-x recover-file |

## Fonts

| Name           | Shortcuts              |
|----------------|------------------------|
| List all fonts | M-x list-faces-display |

## Version Control

| Name                                         | Shortcuts |
|----------------------------------------------|-----------|
| Commit current file                          | C-x v v   |
| Display diff showing changes to current file | C-x v =   |
| See annoted version of file showing commits  | C-x v g   |
| See log of previous changes to file          | C-x v l   |

## Mouse Integration

| Name                                       | Shortcuts    |
|--------------------------------------------|--------------|
| Convert strokes to commands, see more with | strokes-help |

## Tramp

Supports remote systems and docker, podman, and kubernetes connection
methods

- Open new SSH connection like:
  /<ssh:user@host#port:/path/to/remote/file_or_path>
- See troubleshooting at [Emacs Wiki -
  Tramp](https://www.emacswiki.org/emacs/TrampMode#toc7)

## Themes - Emacs look

| Name                                | Shortcuts     |
|-------------------------------------|---------------|
| Load a new theme                    | load-theme    |
| Toggle a theme variant if available | toggle-theme  |
| Disable a theme                     | disable-theme |

## Games and Therapy

| Name                     | Shortcuts  |
|--------------------------|------------|
| Play game, pong          | M-x pong   |
| Play game, snake         | M-x snake  |
| Play game, tetris        | M-x tetris |
| Psychotherapy with Eliza | M-x doctor |

## See Also

- [Emacs Snippets](../005-computer-snippets-emacs) - [Emacs
  Snippets](id:f1e69dcf-1ee5-48c5-9efe-a05affb4236c)
- [Emacs Shortcuts Evil Doom](../005-tech-emacs-shortcuts-evil-doom) -
  [Emacs Shortcuts for Evil and Doom
  Emacs](id:53e11158-909c-4d77-a705-d12a0077d1e0)
- [Emacs Shortcuts in a Graphical Cheat
  Sheet](../005-tech-emacs-shortcuts-graphical-cheat-sheet) - [Emacs
  Shortcuts in a Graphical Cheat
  Sheet](id:222d371a-92ff-41ae-8af5-c12743b36edd)
- [Emacs Shortcuts from Other
  Packages](../005-tech-emacs-shortcuts-other-packages) - [Emacs
  Shortcuts from Other
  Packages](id:c83f42e0-ecb2-427d-bf75-0a3ca824bf1d)
- [Emacs Shortcuts for dired](../005-tech-emacs-shortcuts-dired) -
  [Emacs Shortcuts for dired](id:8f08d874-1ec0-4709-b492-dc0d679513a0)
- [Emacs Shortcuts for elfeed](../005-tech-emacs-shortcuts-elfeed) -
  [Emacs Shortcuts for elfeed](id:54b690fd-eac4-4934-8a30-97388d72e99f)
- [Emacs Shortcuts for org-mode](../005-tech-emacs-shortcuts-mode) -
  [Emacs Shortcuts](id:daea5d06-6895-4073-a5c7-64e8f21bf085)
- [Emacs Shortcuts for Magit](../005-tech-emacs-shortcuts-magit) -
  [Emacs Shortcuts for Magit](id:18083c56-9942-44b7-804d-623b22866188)
- [Emacs Shortcuts for
  plantuml-mode](../005-tech-emacs-shortcuts-plantuml-mode) - [Emacs
  plantuml-mode Shortcuts](id:4f3385f7-4b51-48cd-b004-2e4a73e6f27a)
