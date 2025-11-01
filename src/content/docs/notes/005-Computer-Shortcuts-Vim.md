---
filetags: ":vim:shortcuts:epubnote:"
id: bdb62bfe-56b7-4c13-a1e4-9f91cf4e0bb5
title: Vim Shortcuts
---

## Movement

From `vimtutor`

To move the cursor, press the h,j,k,l keys as indicated.

^ k Hint: The h key is at the left and moves left. \< h l \> The l key
is at the right and moves right. j The j key looks like a down arrow. v

## Normal and Insert, Switching Modes

| Description | Shortcut |
|----|----|
| Enter insert mode, from normal mode | i (insert before cursor), a (append after cursor) |
| Leave insert mode, activate normal mode | Esc or Ctrl + c or Ctrl + \[ (US Keyboard) |
| Leave insert mode, activate normal mode for 1 command | Ctrl + o |
| Quit and Save | Z Z , :wq |
| Quit and do not save | Z Q , :q! |

## File Explorer, netrw

| Description                                  | Shortcut            |
|----------------------------------------------|---------------------|
| File Explorer, open                          | :Explore or :edit . |
| File Explorer, new tab in current directory  | :Te                 |
| File Explorer, open file selected in new tab | t                   |
| File Explorer, open file selected in split   | s                   |
| File Explorer, Delete file                   | D                   |
| File Explorer, Rename file                   | R                   |
| File Explorer, Make directory                | d                   |

## Command Mode, aka Ex Mode - Frequently Used

| Description                                         | Shortcut          |
|-----------------------------------------------------|-------------------|
| Save (write)                                        | :w                |
| Save all open buffers                               | :wa               |
| Source, current file                                | :source %         |
| Quit                                                | :q                |
| Save only if there are changes and quit             | :x                |
| Save, write buffer even if no changes and quit      | :wq               |
| See working directory                               | :pwd              |
| Change directory to current open file/buffer        | :cd %:p:h         |
| Change directory to specific directory              | :cd \<directory\> |
| Change directory to current working directory (cwd) | :lcd              |
| Quit without saving                                 | :q!               |

### Command Mode - Other

| Description | Shortcut |
|----|----|
| Search: command history | C-f |
| Search: set case insensitive | :set ic |
| Search: set case sensitive | :set noic |
| Search: highlight | :set hls |
| File, Open, Edit \<file\> | :e \<file\> or :edit \<file |
| File, Save as | :f |
| File, set file encoding | set fileencoding=utf8 |
| Show list of commands / autocomplete | : \<…\> Ctrl + D or tab |
| Autocomplete, chose choices | Tab |
| Autocomplete, accept choice, keep in command mode | Ctrl + y |
| Line numbers: absolute as in file / deactivate | :set nu :set nonu |
| Line numbers: relative to point / deactivate | :set rnu :setnornu |
| Line numbers: hybrid of above / deactivate | :set:nu rnu :set nonu nornu |
| Earlier, go back in time of file, 2 number of times | :earlier 2 |
| Earlier, go back in time of file, {N} minutes before | :earlier {N}m |
| Make, run make by default or makeprg defined command | :make |
| Make, set makeprg (make program) | :set makeprg make |
| Messages, Vim logs View | :messages |
| Lines, copy given line range, see :h cmdline-ranges | :copy or :t |
| Lines, move given line range | :norm |
| Normal mode commands execution | :move or :m |
| Key mappings, depends on mode, see :h map-overview | :map |
| Settings, Tab stop or number of spaces for a tab | :set tabstop 2 |
| Digraphs, show call digraph codes | :diagraphs |

For `:make`, output will go to quickfix list for easy fixes on items

### Search for patterns with :grep, :lgrep, :vimgrep, :lvimgrep

| Description                                   | Shortcut               |
|-----------------------------------------------|------------------------|
| Grep, with external application               | :grep                  |
| Grep, see results in quickfix list            | :cw or :copen          |
| Grep, with external application, local window | :lgrep                 |
| Grep, see results quickfix list, local window | :lw or :lopen          |
| Grep, on all files with pattern               | :grep my-pattern \*    |
| Grep, include hidden dotfiles                 | :grep my-pattern ./.\* |

Usage:

:vim\[grep\]\[!\] *{pattern}*\[g\]\[j\] {file} …

- 'g' option specifies that all matches for a search will be returned
  instead of just one per line
- 'j' option specifies that Vim will not jump to the first match
  automatically.

### Quickfix List, Compilation

Supports with Vim's edit-compile-edit cycle to edit code, compile for
errors and fix them. Similar to Emacs `compile` function when combined
with Vim's `:make` and `:copen`. See `:h quickfix`.

| Description                                 | Shortcut             |
|---------------------------------------------|----------------------|
| Quickfix, Open                              | :copen               |
| Quickfix, Close                             | :cclose              |
| Next item                                   | :cnext or \]q or :cn |
| Previous item                               | :cprev or \[q or :cp |
| First, last item                            | :cfirst :clast       |
| Open item 3 or item by number               | :cc 3                |
| Go to quickfix item                         | Enter                |
| Run command on each quickfix item           | :cdo COMMAND         |
| Run command on each quickfix item, per file | :cfo COMMAND         |

For c, think of it as compilation. COMMAND can be a sequence of
commands.

### :copy, :move, :norm examples

- Copy previous 2 lines and current line: `:-2,t`
- Move line down: `:m+1`, move line up 2 `:m-2`
- Append \\ to all lines in buffer: `:%norm A\\`
- In Python, comment all lines with the word print: `:g/print/norm I#`
- Find all lines with the pattern beg.\*tab (e.g. \begin{tabular}) and
  go to line before and append \\ to line: `g/beg.*tab/norm kA\\`
  - Find all the lines matching the pattern beg.\*tab (a way for me to
    match \begin{tabular} without having to type the whole thing).
  - For each of those lines, go to the preceding line.
  - Append \\ to that line.

1.  Global :g examples - act on range, pattern and Ex execute command

    Source: [Power of g - Vim
    Tips](https://vim.fandom.com/wiki/Power_of_g)

    | Description | Shortcut |
    |----|----|
    | Global, act on range, pattern and execute command | :\[range\]g/pattern/cmd |
    | Global, Display context (5 lines) for all occurrences of a pattern | :g/pattern/z#.5 |
    | Global, Delete all lines matching a pattern | :g/pattern/d |
    | Global, Delete all lines not matching a pattern | :g!/pattern/d or :g!/pattern/d |
    | Global, Delete all blank lines | :g/^$`/d                     |
    | Global, Copy all lines matching pattern to end of file             | :g/pattern/t`$ |
    | Global, Copy all lines matching a pattern to register 'a' | qaq:g/pattern/y A |
    | Global, Fast Delete (do not copy) all lines matching a pattern | :g/pattern/d \_ |

    See more with

    - :help ex-cmd-index provides a list of Ex commands.
    - :help 10.4 is the section of the user manual discussing the
      :global command.
    - :help multi-repeat talks about both the :g and :v commands.

2.  Using do commands to search and replace

    Source: [Search and replace in multiple files - Vim Tips
    Wiki](https://vim.fandom.com/wiki/Search_and_replace_in_multiple_buffers)
    and =:h substitute

    - :argdo: (all files in argument list)
    - :bufdo (all buffers)
    - :tabdo (all tabs)
    - :windo (all windows in current tab)
    - :cdo (all files/items listed in quickfix list)

    Example in Vim command mode. grep uses external command, vimgrep
    uses internal to vim function.

    ``` shell

    # Grep in current file and open results
    grep PATTERN %
    copen
    # Search and replace on quickfix items
    cdo s/OLDPATTERN/NewPATTERN/g

    # Close all files appearing in quickfix list
    cfdo bd

    # Save Quickfix list results to file
    w results.txt

    ```

    Example in LazyVim

    ``` shell

    # Grep in current file and open results
    grep PATTERN %
    # Grep on pattern in call files
    vimgrep PATTERN *
    # or
    vim PATTERN *
    # Grep on src directory recursively
    grep PATTERN src/**
    # C-q to add all items to quickfix list
    # Open quickfix list
    copen

    # Search and replace on quickfix items
    cdo s/OLDPATTERN/NewPATTERN/g | update
    # Search and replace and ask for check
    cdo s/OLDPATTERN/NewPATTERN/gc | update


    ```

    Vim command mode:

    ``` bash

    # Search and replace in all open buffers from :ls
    :bufdo %s/pattern/replace/ge | update

    # Explanation
    # bufdo     Apply the following commands to all buffers.
    # %s    Search and replace all lines in the buffer.
    # pattern   Search pattern.
    # replace   Replacement text.
    # g     Change all occurrences in each line (global).
    # e     No error if the pattern is not found.
    # |     Separator between commands.
    # update    Save (write file only if changes were made).

    # Suppose all *.cpp and *.h files in the current directory need to be changed (not subdirectories)
    # use the argument list (arglist):
    :arg *.cpp  All *.cpp files in current directory.
    :argadd *.h     And all *.h files.
    :arg    Optional: Display the current arglist.
    :argdo %s/pattern/replace/ge | update   Search and replace in all files in arglist.

    # Search and replace, change, with all files
    :arg **/*.cpp   All *.cpp files in and below current directory.
    :argadd **/*.h  And all *.h files.
    ...     As above, use :arg to list files, or :argdo to change.

    # Replace current word
    :arg **/*.cpp   All *.cpp files in and below current directory.
    :argadd **/*.h  And all *.h files.
    ...     As above, use :arg to list files, or :argdo to change.

    # Replace items in quickfix list
    :cdo s/variable_old_name/variable_new_name/g
    # Replace items in quickfix list with prompt
    :cdo s/variable_old_name/variable_new_name/gc

    ```

### Status, Spell Commands

| Description                   | Shortcut                        |
|-------------------------------|---------------------------------|
| Show file location and status | Ctrl + g                        |
| Retrieve and place in buffer  | :r \<file or external command\> |
| Spell check                   | :set spell                      |

### External Commands

| Description           | Shortcut      |
|-----------------------|---------------|
| Execute shell command | :!\<command\> |

1.  External Command Examples

    ``` shell

    # Execute shell command to list directory, then press enter to return to vim
    !ls

    # Get command output of {cmd} and place in buffer
    :r !{cmd}
    # Place date in buffer
    :r !date

    # Get file and place in buffer
    :r {file}

    # Replace current line with output of shell
    # Example use: decoding strings, formatting text like json, using . for the current line
    :.!{cmd}
    # Replace entire buffer with command output, using % for entire
    :%!{cmd}
    # Replace a selection with the output of a shell command
    # Example use: sorting, complex text changes
    :'<,'>!{cmd}
    #### Sort entire buffer
    :% !sort

    # Send current buffer as input to a command
    :w !{cmd}

    ## Practical Examples

    ### Backup a file
    :!cp % %.bak

    ### Insert External Data
    #### Date
    :r !date

    ### Buffer as command input
    #### Create files listed in the buffer
    :w !xargs touch

    #### Decode base64 string on current line and replace the line in buffer
    :.!base64 -d
    #### Format current line json
    :.!jq .

    #### Sort selection
    :'<,'>!sort

    #### Sort case insensitive
    :'<,'>!sort i

    # Run current file
    :!%

    ```

    1.  Key binding

        Execute current line and output the result to the command line.
        Execute in bash and see result in Vim

        vim.keymap.set("n", "\<leader\>ex", ":.w !bash -e\<cr\>", opts)

        Execute file and see results in Vim

        vim.keymap.set("n", "\<leader\>eX", ":%w !bash -e\<cr\>", opts)

        [6 Practical External Command Tricks: Level Up Your Neo(vim)
        Skills](https://itnext.io/6-practical-external-command-tricks-level-up-your-neo-vim-skills-ed656abf38b1)

### Additional Commands

``` shell

# Go to, line number in file
:103

# Copy current file name to system clipboard register @+
:let @+ = expand('%')
# expand('%') gets the current file name

# Pipe visual selection to shell command
:'<,'>w !psql $DATABASE_URL > sql.out
# Use case is running an SQL statement in vim, piping to a database connection
# and getting the output in a file

# Set make to execute current file like a bash script
:set makeprg=bash\ %
# Set local variable make to execute current file like a nushell script
:setlocal makeprg=nu\ %

# Set error format used by makeprg in quickfix list, :h errorformat
:set errorformat=%f:\ line\ %l: %m
# Error format is one given when running shell scripts
# %f filename
# \  escaped space
# %l line number
# %m error message

# View available compilers
:compiler

# Output variable
echo &makerpg

```

## Common VI Shortcuts

This first table per [DevOps Bootcamp - Operating Systems and Linux
Basics](../005-computer-tech-devops-bootcamp-twn-operating-systems-and-linux-basics) -
[DevOps Bootcamp - Operating Systems and Linux
Basics](id:e37ac848-6bb2-4f18-afcf-71c6a7388961)

Other table per `vimtutor` command

| Description | Shortcut |
|----|----|
| Delete 10 lines | d10, d |
| Delete all lines | :%d |
| Delete character at point | x |
| Delete line | dd |
| Enter Insert mode, append text at end of character at point | a |
| Enter Insert mode, Append text at end of line, insert mode | A |
| Enter Insert mode, at beginning of line | I |
| Enter Insert mode, at new line below / above current one | o, O |
| Go to, beginning of file | gg |
| Go to, end of file | G |
| Go to, file, url at point (open with system app) | gf , gx |
| Go to, file with line number (like file.txt:42) | gF |
| Go to, last insert mode | gi |
| Go to, last selected text | gv |
| Go to line 12, Go to line 100 | 12G, 100G or :100 |
| Jump history back (o for out), forward (i for in) | C-o, C-i |
| Jump to beginning of line (bol) | 0 / Home / ^ (soft) |
| Jump to end of line (eol) | \$ / End |
| Repeat last command, repeat macro (like command, inserts, combos) | . |
| Replace all occurrences of string<sub>old</sub> with new, new can be blank | :%s/string<sub>old</sub>/new |
| Replace in region string<sub>old</sub> with new, new can be blank | :'\<,'\>s/string<sub>old</sub>/new/g |
| Search: command history | q: (like C-f in command mode) |
| Undo | u |

## Other Shortcuts

### Editing, Selection (Marking), Text viewing and editing

| Description | Shortcut |
|----|----|
| Case of character at point, toggle | ~ |
| Case of inner tag selection, toggle | g~it |
| Case of word, toggle | g~w |
| Copy 1 to 10 lines of file | :1,10y |
| Copy (yank) entire file | :%y or gg v G, or :1,\$y |
| Copy (yank) entire line | yy |
| Copy (yank inside) content inside quotations " | yi" |
| Copy (yank) selection | y |
| Copy (yank) word | yw |
| Fold, close | zc |
| Fold, open | zo |
| Format, auto format | = = |
| Format, auto format file | = g |
| Join lines | J |
| Put (paste deleted or copied text) | p |
| Put (paste deleted or copied text) and align with surrounding text | \]p |
| Redo | Ctrl + r |
| Select, Start select - visual selection | v |
| Select, visual and selected area | v i \<choose selection options\> |
| Select, visual and text inside selected symbol, like bracket | v i \], v i ', v i " |
| Select, visual block mode (rectangle mark, multiple cursor select) | C-v |
| Select, visual line mode | V |

- `p` can be combined with `dd` to delete and then paste the deleted
  line.

### Registers

Source: :h registers, <https://www.brianstorti.com/vim-registers/>

| Description | Shortcut |
|----|----|
| Registers mini-mode (insert mode) | C-r |
| Registers mini-mode (insert mode), paste (system clipboard) | \+ |
| Registers mini-mode (insert mode) paste from register 'a' | C-r a |
| Register - access register at char 'r' | "r |
| Register - yank text to register 'r' | "ry |
| Register - paste text from register 'r' | "rp |
| Registers - List, last 0-9 registers are last yanked (copied) text | :reg |
| Registers - List | :reg a b c |

1.  4 read only Registers

    | Description                                       | Shortcut |
    |---------------------------------------------------|----------|
    | Register: Last inserted text                      | ".       |
    | Register: Current file path                       | "%       |
    | Register: Last executed command                   | ":       |
    | Register: Alternative file, like last edited file | "#       |

2.  Expression and Search Registers

    | Description           | Shortcut |
    |-----------------------|----------|
    | Register: Expressions | "=       |
    | Register: Search      | "/       |

    1.  Example use

        - ". to write same text twice
        - "% enter current file name in commands
        - ": to re run the last command like :w
        - "# is the file used with Ctrl + ^
        - \#= used with results of expression, like in insert mode, do
          Ctrl+r = and do `2+2 <enter>`, then 4 is printed. Or do Ctrl+r
          = and in the command do `system('ls') <enter>` and the output
          of the `ls` command is pasted in the buffer
        - "/ to reuse the last searched word for another search and
          search and replace

3.  Moving by Words ("web and WEB") and Lines, Go to words, line
    positions

    | Description                               | Shortcut |
    |-------------------------------------------|----------|
    | Move one word forward / after whitespace  | w / W    |
    | Move one word backward / after whitespace | b / B    |
    | Move to end of word / after whitespace    | e / E    |
    | Move to word after next whitespace        | W        |
    | Move to end of line                       | \$       |
    | Move to beginning of line                 | 0        |
    | Move to first non blank character         | ^        |

    - Specifically, a capital W will move to just after the next
      whitespace character, where a lowercase w will use other forms of
      punctuation to delimit a word.

    1.  Listing 9. Example Method Call and usage of web and WEB

        Source: [Chapter 3: Getting Around - LazyVim for Ambitious
        Developers](https://lazyvim-ambitious-devs.phillips.codes/course/chapter-3/#_moving_by_words_only_bigger)

        ``` txt

        myObj.methodName("foo", "bar", "baz")
        -----ww---------w-w--w--ww--w--ww--w---->
        ------------------------W------W-------->

        ```

        | Description | Shortcut |
        |----|----|
        | Replace character at point | r + \<character to replace\> |
        | Replace mode (like Insert mode, delete replaced characters) | R |

        `v` visual selection can be combined with commands `d` for
        delete, `y` for copy, `c` for change

4.  Open lines

    | Description                         | Shortcut |
    |-------------------------------------|----------|
    | Open line below cursor, insert mode | o        |
    | Open line above cursor              | O        |

5.  Files

    | Description                          | Shortcut    |
    |--------------------------------------|-------------|
    | Save selected lines to file FILENAME | :w FILENAME |

6.  Combination Commands

    | Description | Shortcut |
    |----|----|
    | Replace content between symbols | di + \<symbol\> like di" |
    | Cut content between symbols | ci + \<symbol\> like ci( |
    | Swap lines up and down (delete line, paste it) | ddp |
    | Delete entire document - G from first line, gg from last line | dG or dgg |
    | Auto indent entire document | gg=G |

### Movement and Search

1.  Movement

    | Description | Shortcut |
    |----|----|
    | Begin/End of paragraph | { / } |
    | Begin/End of sentence | ( / ) |
    | Find mode, character, move to next match | f \<char\> |
    | Find mode, move to next match of pattern | ; |
    | Find mode (til / until), character, move to before it | t \<char\> |
    | Half page down | Ctrl + d |
    | Half page up | Ctrl + u |
    | Jump \# of times using hjkl cursor | 10j / \#j |
    | Move cursor top, middle, bottom of screen | (Shift) H, M, L |
    | Navigation Next ) | \]) |
    | Navigation Next, Quickfix item | \]q |
    | Navigation Next, Spelling error | \]s |
    | Navigation Previous, method end | \[M |
    | Navigation Previous, method start | \[m |
    | Navigation Previous, ( or { or \< | \[( or \[{ or \[\< |
    | Navigation Previous, Quickfix item | \[q |
    | Navigation Previous, Spelling error | \[s |
    | Page Down | Ctrl + f |
    | Page Up | Ctrl + b |
    | Scroll screen, z mini mode: Move screen and leave cursor, top, bottom, middle | zt, zb, zz |
    | Search word at point | \* |

2.  Search and Replace

    | Description                                | Shortcut               |
    |--------------------------------------------|------------------------|
    | Search text in file forwards               | / + \<phrase\> + Enter |
    | Search next / previous                     | n / N                  |
    | Search text in file backwards              | ? + \<phrase\> + Enter |
    | Find matching bracket                      | %                      |
    |                                            |                        |
    | Change text in brackets                    | ci\[ or ci\] or ci{    |
    | Change text in quotations                  | ci"                    |
    | Search x and Replace with y in entire file | :%s/x/y/g              |

    1.  Search and Replace Command Mode

        - To substitute new for the first old in a line type
          `:s/old/new`
        - To substitute new for all 'old's on a line type `:s/old/new/g`
        - To substitute phrases between two line \#'s type
          `:#,#s/old/new/g`
        - To substitute all occurrences in the file type `:%s/old/new/g`
        - To ask for confirmation each time add 'c' `:%s/old/new/gc`

        Search and replace also takes regex like `\d` for digits, see
        `:help pattern-search`

3.  Tags

    | Description                 | Shortcut |
    |-----------------------------|----------|
    | Find tag                    | C-\]     |
    | Find ambiguous tag          | g C-\]   |
    | Jump back in tag jump stack | C-t      |

### Deletions

Using `d` delete operator and a motion that the operator will operate on

| Description                               | Shortcut |
|-------------------------------------------|----------|
| Delete word with first character at point | dw       |
| Delete to end of line                     | d\$      |
| Delete to end of current word             | de       |

1.  Delete with Counts

    | Description               | Shortcut   |
    |---------------------------|------------|
    | Delete 2 words from point | d2w / d#w  |
    | Delete 2 / \# of lines    | 2dd / \#dd |

2.  Change Operator

    Delete and make changes

    | Description                              | Shortcut |
    |------------------------------------------|----------|
    | Delete to end of word and insert mode    | ce       |
    | Delete line and insert mode              | cc       |
    | Delete line to end from point and insert | c\$      |

### Counts for a motion

| Description                         | Shortcut |
|-------------------------------------|----------|
| Move cursor 2 / \# words forward    | 2w / \#w |
| Move cursor 2 / \# words backward   | 2b / \#b |
| Move curse to end of 3 / \# forward | 3e / \#e |

### Macro

| Description                         | Shortcut                   |
|-------------------------------------|----------------------------|
| Record macro to register like a     | qa                         |
| Record macro to register, then quit | q\<register\>\<commands\>q |
| Stop macro during recording         | q                          |
| Run macro                           | @                          |
| Run macro at register w 6 times     | 6@w                        |
| Run last macro                      | @@                         |

Source: :h recording, <https://www.redhat.com/sysadmin/use-vim-macros>
and <https://www.brianstorti.com/vim-registers/>

- To record a macro and save it to a register, type the key q followed
  by a letter from a to z that represents the register to save the
  macro, followed by all commands you want to record, and then type the
  key q again to stop the recording.
- Example to store macro in register a, go down and delete line and then
  stop macro recording: `qajddq`

1.  Macros are just text and can be edited, examples

    - Add a semicolon to end of the `w` macro :let @W='i;'
      - W in uppercase means append value to the register
    - Edit the register :let @w '\<Ctrl-r w\> and change what you want
      and close the quotes
    - Copy `ivim is awesome` into the clipboard register "+ and execute
      @"+

2.  Sample Key Combinations

    Delete lines containing a string in a file

    :g/\<your<sub>string</sub>\>/d

    - :g Prepare to execute a command globally (on all lines that match
      a certain pattern).
    - /\<your<sub>string</sub>\> Start specifying the pattern to match
      \<your<sub>string</sub>\>. Replace this with the string you want
      to delete lines based on.
    - / End specifying the pattern to match.
    - d The command to execute on all lines that match the pattern. In
      this case, delete those lines.

### Marks (Bookmarks)

Source: [Using Marks - Vim Tips
Wiki](https://vim.fandom.com/wiki/Using_marks)

| Description                              | Shortcut                |
|------------------------------------------|-------------------------|
| Mark place in file                       | m \<lower case letter\> |
| Mark place in file to access in any file | m \<upper case letter\> |
| Marks, normal mode, go to mark           | \` \<mark letter\>      |
| Marks, list marks                        | :marks                  |

## Insert (Edit) Mode

### Editing

| Description                               | Shortcut                     |
|-------------------------------------------|------------------------------|
| Delete word at point                      | C-w                          |
| Delete character at point                 | C-h                          |
| Run normal mode command, then run command | C-o                          |
| Digraph, insert                           | C-k                          |
| Digraph, insert alpha                     | C-k a\*                      |
| Digraph, insert other Greek letters       | C-k \<US keyboard letter\>\* |

From vim :h digraph

Diagraphs are used to enter characters that normally cannot be entered
by an ordinary keyboard. These are mostly printable non-ASCII
characters.

### Completion (Autocomplete) in Insert Mode

| Description                                 | Shortcut   |
|---------------------------------------------|------------|
| Completion, (autocomplete)                  | C-n or C-p |
| Completion, omni completion                 | C-x C-o    |
| Completion, complete line                   | C-x C-l    |
| Completion, keyword (anything from file)    | C-x C-n    |
| Completion, filenames                       | C-x C-f    |
| Completion, tags                            | C-x C-\]   |
| Completion, definition                      | C-x C-d    |
| Completion, dictionary                      | C-x C-k    |
| Completion, dictionary, spelling            | C-x s      |
| Completion, anything with 'complete' option | C-n        |
| Completion, accept suggestion               | C-y        |

See :h complete<sub>infomode</sub>

## Window management and movement

From :h windows-intro:

> A buffer is the in-memory text of a file. A window is a viewport on a
> buffer. A tab page is a collection of windows.

| Description                          | Shortcut                            |
|--------------------------------------|-------------------------------------|
| Move to next window                  | Ctrl + w w                          |
| Move window to new tab               | Ctrl + w T                          |
| Resize, Balance windows              | Ctrl + w =                          |
| Resize, Maximize height              | Ctrl + w \_                         |
| Resize, Maximize width               | Ctrl + w                            |
| Switch to windows by direction       | Ctrl + w, hjkl                      |
| Split frame, horizontal (top, down)  | C-w, s or :sp                       |
| Split frame, vertical (left, right)  | C-w, v or :vsp                      |
| Split frame, open file in new window | :sp \<file\>                        |
| Close split frame                    | C-w c                               |
| Close window                         | :q                                  |
| Zoom in / Zoom out                   | Ctrl + Shift + - / Ctrl + Shift + = |
| Max height                           | \_                                  |

See `:h wincmd` for more commands

### Buffers

| Description | Shortcut |
|----|----|
| List buffers | ls |
| Switch buffers | :bnext :bprevious :bp |
| Switch buffers by number or (partial) name | :b \<number or name or partial unique name\> |
| Switch buffers - see also Navigation previous, next | \[b , \]b |
| Buffer Forward | Ctrl + i |
| Buffer Back | Ctrl + o , Ctrl + ^ |
| Buffer back to last buffer, alternate buffers | Ctrl + ^ (Ctrl + Shift + 6, sometimes Ctrl + 6) |
| Refresh buffer | :e |
| Close buffer | :bd |

### Tabs

Tabs in Vim are like layouts or workspaces and not like tabs in newer
IDEs. They preserve the window layout.

| Description                         | Shortcut          |
|-------------------------------------|-------------------|
| Edit/Open in new tab                | :tabe example.txt |
| Open current buffer in new tab      | :tabnew %         |
| Close tab                           | :tabc (close)     |
| Close all other tabs except current | :tabo (only)      |
| Next tab                            | gt                |
| Prior tab                           | gT                |
| Numbered tab                        | nnngt             |
| list all tabs                       | :tabs             |

## Help

| Description                               | Shortcut                    |
|-------------------------------------------|-----------------------------|
| Help                                      | :help or :h                 |
| Help key                                  | F1                          |
| Help on command                           | :help \<command\>           |
| Help on a key in normal mode              | :help \<key\>               |
| Help on a key in insert mode              | :help i\_\<key\>            |
| Help on a key in command mode             | :help c\_\<key\>            |
| Help, search for a word                   | :helpgrep \<word\>          |
| Help, go to documentation/link at point   | K                           |
| Documentation at point                    | K                           |
| Documentation at point, enter docs buffer | K K or K Ctrl + w, Ctrl + w |
| Documentation at point, exit docs buffer  | q                           |

## Terminal

| Description         | Shortcut       |
|---------------------|----------------|
| Open terminal       | :term          |
| Exit to Normal mode | Ctrl-\\ Ctrl-N |

- Tip on switching to terminal on Unix/Linux:
  - Ctrl + z to have vim go into background and bring up terminal
  - fg to resume vim

## Sessions

| Description                              | Shortcut                    |
|------------------------------------------|-----------------------------|
| Suspend vim, go back to terminal         | C-z                         |
| Suspend vim, from terminal return to vim | Type fg in terminal + enter |
| Save a session to file                   | mksession session.vim       |
| Load a session from file                 | source session.vim          |

## See Also

- [DevOps Bootcamp Techworld with
  Nana](../005-computer-tech-devops-bootcamp-twn) - [DevOps Bootcamp
  Series with Nana Janashia](id:47b64b3b-67a0-4cc5-9e96-2369c5877b08)
- [Emacs Shortcuts Evil Doom](../005-tech-emacs-shortcuts-evil-doom) -
  [Emacs Shortcuts for Evil and Doom
  Emacs](id:53e11158-909c-4d77-a705-d12a0077d1e0)
- [Neovim Shortcuts](../005-computer-shortcuts-neovim) - [Neovim
  Shortcuts](id:441cec9c-4ca1-479a-9dcc-b0b0bbe294f6)

### Resources

- `vimtutor` command tutorial in terminal
- [LazyVim for Ambitious Developers, Vim, Neovim, Lazyvim
  Guide](https://lazyvim-ambitious-devs.phillips.codes/)
- [Compile Code The Way Vim Intended - Gavin
  Freeborn](https://www.youtube.com/watch?v=vB3NT9QIXo8&t) - makeprg,
  errorformat, compilation
