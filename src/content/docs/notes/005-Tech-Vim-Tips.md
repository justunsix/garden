---
filetags: ":vim:epubnote:"
id: d69fe5ea-c75c-45f4-9686-a6d60e421de2
title: Vim Tips
---

# How to Do 90% of What Plugins Do (With Just Vim)

Source:

- <https://www.youtube.com/watch?app=desktop&v=XA2WjJbmmoM> with Max
  Cantor
- Slides and info at <https://github.com/changemewtf/no_plugins>

## Config to start in vim.rc

Edited with comments from
<https://github.com/changemewtf/no_plugins/blob/master/no_plugins.vim>

``` rc

"       HOW TO DO 90% OF WHAT PLUGINS DO (WITH JUST VIM)

"                          Max Cantor

"               NYC Vim Meetup -- August 3, 2016











" FEATURES TO COVER:
" - Fuzzy File Search
" - Tag jumping
" - Autocomplete
" - File Browsing
" - Snippets
" - Build Integration (if we have time)










" GOALS OF THIS TALK:
" - Increase Vim understanding
" - Offer powerful options

" NOT GOALS OF THIS TALK:
" - Hate on plugins
" - Get people to stop using plugins





" {{{ BASIC SETUP
" BASIC SETUP:

" enter the current millenium
set nocompatible

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on









" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer


" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags





" AUTOCOMPLETE:

" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list





" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0        " disable top banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings



" SNIPPETS:

" Read an empty HTML template and move cursor to title
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

" NOW WE CAN:
" - Take over the world!
"   (with much fewer keystrokes)









" BUILD INTEGRATION:

" Steal Mr. Bradley's formatter & add it to our spec_helper
" http://philipbradley.net/rspec-into-vim-with-quickfix

" Configure the `make` command to run RSpec
set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter

" NOW WE CAN:
" - Run :make to run RSpec
" - :cl to list errors
" - :cc# to jump to error by number
" - :cn and :cp to navigate forward and back





"                          THANK YOU!

"                    Download this file at:
"                github.com/changemewtf/no_plugins/blob/master/no_plugins.vim

"                Follow me for kitten pictures:
"                     twitter.com/mcantor

"          Contact me at `max at maxcantor dot net` for:
"                  - Consulting (Dev and PM)
"                          - Tutoring
"                     - Classroom Teaching
"                     - Internal Training
"                       - Encouragement

```

## Fuzzy File Search

- With `path` variable setting above, can use `find` command to search
  all files in current working directory and files in subfolders

- Switch to open buffer using `:b` and name, number or partial unique
  string in the file name, also using `:b <tab>` does autocomplete

- See :help path and :help find

## Tag Jumping

Note: LSP provides same ability and more to navigate tags and other code
elements instead of ctags/similar tools. The following describing just
using ctags with vim:

- Requires `ctags` tool installed

- In CLI, run `ctags -R .` to generate tags file in folders

- Use Ctrl + \] to jump to tag under cursor - will go to tag in project
  file

- Use g Ctrl + \] for ambiguous tags - will provide list to go to file

- Use Ctrl + t to jump back up the tag stack

- Tip for updating tags, can bind ctags to save to update tags regularly

## Autocomplete

- Insert completion see :help ins-completion

- Automatically reads from tags file, current file information

- Activate using Ctrl + n, Ctrl + p (previous in list)

## File Browsing

- netrw is a plugin built into vim, like a file browser
  - Can integrate like with ssh
- open it like `:edit .`
- In netrw
  - Open file at point in split: s
  - Open file at point in tab: t

## Snippets

Above configuration:
`nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a` will create
a key mapping to running commands, can help with automation

- Sets up an html snippet with `,html` and moves the cursor to the title
  tag
- nnoremap - normal mode mapping, noremap makes sure it will not call
  itself
- ,html - type to activate the snippet
- : - enter command mode
- -1 - moves cursor minus one line
- read - read the file specified and paste its contents into the current
  buffer
- \<CR\>3jwfa - \<CR\> is enter (carriage return), sequence will move
  the cursor to the title tag and do insert

## Build Integration

- Use vim's make command, put it into an QuickFix format that vim can
  read and then go to errors in specific code
- :cl to list errors
- :cc# to jump to error by number
- :cn and :cp to navigate forward and back

## Using Help

- Use :help to look at things like commands, shortcuts like:
  - :help <sup>n</sup> - help on Ctrl + n key
    - :help i\_<sup>n</sup> - help on Ctrl + n in insert
  - :helpgrep
