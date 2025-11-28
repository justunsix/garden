---
filetags: ":emacs:dotfiles:epubnote:"
header-includes:
- <link rel="stylesheet" type="text/css" href="basic-org.css"/>
id: 68838d6e-0c84-426a-9e35-296d9e4e2db1
title: Emacs from Scratch
---

<link rel="stylesheet" type="text/css" href="basic-org.css"/>

Source: My personal notes from System Crafter's Emacs configuration
video series

## Emacs from Scratch

### Introduction

- David Wilson - System Crafter's own configuration
  - Use org file to manage configurations
  - Linux running GNU GUIX
- Navigate files: `find-files`
- Switch buffers: `switch-to-buffer`

### 1- Basic Configuration

- Run emacs for first time: `emacs -q`
- Run emacs for first time with your configuration:
  `emacs -q -l init.el`
- In the video, we build a basic configuration `init.el`
- [See
  code](https://github.com/daviwil/emacs-from-scratch/tree/3075158cae210060888001c0d76a58a4178f6a00)
- Open init.el below and reload changes to init.el within emacs to see
  immediate changes: `M-x eval-buffer`
- Evaluate the current elisp expression with `C-x C-e` or
  `eval-last-sexp`

### 2 - Adding Helpful UI Improvements

[Source](https://www.youtube.com/watch?v=IspAZtNTslY)

- [Configuration from
  stream](https://github.com/daviwil/emacs-from-scratch/tree/3075158cae210060888001c0d76a58a4178f6a00)
- Suggest replace [Caps Locks with
  Control](https://github.com/daviwil/emacs-from-scratch/tree/master#replace-capslock-with-ctrl)
  to improve ergonomics
- Improve help, navigation, and command execution with ivy-rich,
  counsel, helpful, which-key and others. Bind keys and commands to
  better or easier versions.

### 3 - Keybindings and Evil

- Use general package for keybindings
- Use `check-parens` for unbalance parentheses
- Use `evil-mode` for vim keybindings
- Run `list-packages` to refresh packages to prevent errors on update
  and use packages

### 4 - Projectile and Magit

[
Source](https://www.youtube.com/watch?v=INTu30BHZGk&list=PLEoMzSkcN8oPH1au7H6B7bBJ4ZO7BXjSZ&index=4)

- Global find file in project/projects: `C-c p f`

- Projectile can run a command for project to:

  - Start project
  - Test
  - Compile
  - Set up local variables and settings for Emacs to use

- Counsel-projectile-rg can grep inside a folder

- Magit is a git interface for Emacs

  - Easily correct commits, branching
  - Move newer commits from master to a separate branch
  - Move new staged changes to older commits using commit menu and then
    instant fix up option
  - Combine commits using rebase menu and interactive rebase, then
    squash to combine commits
  - Active command line options by pressing keys in the menu (e.g. `-f`
    in push menu to force push)
  - Stash changes temporarily to get remote changes

- Forge - package to improve magit abilities

Pointer to what I am listening to

### 5 - Org Mode Basics

[Source](https://youtu.be/VcgjTEa0kU4?list=PLEoMzSkcN8oPH1au7H6B7bBJ4ZO7BXjSZ&t=5)

- Org mode is an outliner, a note taking system, a task manager, a
  project management tool, a calendar, a diary, a publishing system, a
  markup language, and a literate programming environment.

and:

Interactive computing (source code blocks in org mode)

Task Management:

- Default is TODO and DONE states. More can be customized with
  `org-todo-keywords`

### 6 - Organize your life with Org Mode - Project/task management

[Source](https://youtu.be/PNE-mgkZ6HM?list=PLEoMzSkcN8oPH1au7H6B7bBJ4ZO7BXjSZ&t=12)

- Set `org-deadline-warning-days` for deadline reminders
- Can use queries to manage tasks (e.g. org-ql)
- Can set up repeating tasks from `org-time-stamp` like birthdays
  - Notifications can be enabled using org-wild-notifier
- Refile DONE tasks using: `org-refile-targets`
  - Set up autosave after refiling so all org files are saved

1.  Capture Template

    - Quickly capture something without disrupting your flow
    - Use templates to capture tasks: with configuration
      `org-capture-templates` and activate using `org-capture`
    - Items like journal entries, tasks, notes, custom entries in a
      specific org file
    - Use `define-key` to bind `org-capture` to speed up captures

2.  Customize agenda view

    [Source part of
    video](https://youtu.be/PNE-mgkZ6HM?list=PLEoMzSkcN8oPH1au7H6B7bBJ4ZO7BXjSZ&t=1607):

    - Dashboard
    - Next actions
    - Tags with Tasks
      - Add tag with `counsel-org-tag`. Add multiple tags with `M-Enter`
      - Queries based on tags
      - In configuration, add your custom tags with `org-tag-alist`
      - Set multiple tags with hotkeys: `org-set-tags-command`
    - Set up a custom agenda - like a kanban board with
      `org-agenda-custom-commands` and configurations. See example:

    ``` elisp
    ;; Configure custom agenda views
     (setq org-agenda-custom-commands
      '(("d" "Dashboard"
        ((agenda "" ((org-deadline-warning-days 7)))
         (todo "NEXT"
           ((org-agenda-overriding-header "Next Tasks")))
         (tags-todo "agenda/ACTIVE" ((org-agenda-overriding-header "Active Projects")))))

       ("n" "Next Tasks"
        ((todo "NEXT"
           ((org-agenda-overriding-header "Next Tasks")))))

       ("W" "Work Tasks" tags-todo "+work-email")

       ;; Low-effort next actions
       ("e" tags-todo "+TODO=\"NEXT\"+Effort<15&+Effort>0"
        ((org-agenda-overriding-header "Low Effort Tasks")
         (org-agenda-max-todos 20)
         (org-agenda-files org-agenda-files)))

       ("w" "Workflow Status"
        ((todo "WAIT"
               ((org-agenda-overriding-header "Waiting on External")
                (org-agenda-files org-agenda-files)))
         (todo "REVIEW"
               ((org-agenda-overriding-header "In Review")
                (org-agenda-files org-agenda-files)))
         (todo "PLAN"
               ((org-agenda-overriding-header "In Planning")
                (org-agenda-todo-list-sublevels nil)
                (org-agenda-files org-agenda-files)))
         (todo "BACKLOG"
               ((org-agenda-overriding-header "Project Backlog")
                (org-agenda-todo-list-sublevels nil)
                (org-agenda-files org-agenda-files)))
         (todo "READY"
               ((org-agenda-overriding-header "Ready for Work")
                (org-agenda-files org-agenda-files)))
         (todo "ACTIVE"
               ((org-agenda-overriding-header "Active Projects")
                (org-agenda-files org-agenda-files)))
         (todo "COMPLETED"
               ((org-agenda-overriding-header "Completed Projects")
                (org-agenda-files org-agenda-files)))
         (todo "CANC"
               ((org-agenda-overriding-header "Cancelled Projects")
                (org-agenda-files org-agenda-files)))))))
    ```

3.  Habit Tracking

    - Uses `org-habit`
    - Check you are regularly doing habits by tracking it

### 7 - Configure Everything with Org Babel

[Source](https://youtu.be/kkqVTDbfYp4?list=PLEoMzSkcN8oPH1au7H6B7bBJ4ZO7BXjSZ&t=10)

- Org babel allows you to be put code blocks into your org files and
  execute and see results

- Turn on/off ask for confirmation on code execution using:
  `org-confirm-babel-evaluate`

- Use org tangle to output source to files. After configuration in org
  file, use `org-babel-tangle` to output files, can concatenate output
  into one file.

  - e.g. `#+begin_src elisp :tangle ~/emacs-scratch/init-new.el`

- You can define output tangle file for org file using org file property
  at top of file

- Output all tangles from an org in an automated way:

``` elisp
(org-babel-tangle)
(org-babel-tangle-file "~/Projects/Code/emacs-from-scratch/Emacs.org")
```

- Use tangle to output to different files like
  `#+begin_src conf :tangle ~/.gitconfig :mkdirp yes`. `:mkdirp yes`
  says to create the directory if the source file doesn't exist yet.

- Allows you to pass variables into babel using `noweb`

- Use `imenu` to navigate to org headings

### 8 - Build Your Own IDE with lsp-mode

[
Source](https://youtu.be/E-NAM9U5JYE?list=PLEoMzSkcN8oPH1au7H6B7bBJ4ZO7BXjSZ&t=45)

- Langauge Server Protocop (LSP)-mode addresses multiple language
  editing in different editors
- [Emacs LSP](https://emacs-lsp.github.io/lsp-mode/)
- History is OmniSharp came up with idea and VS Code developed it
- Each langauge server (LS) allows different messages to editor. Some LS
  have more features than others.
- Emacs LSP-mode is a package to allow Emacs to be a client to LSPs
- For video, will use TypeScript language:
  - Prerequisite: Install LS of the target language. For
    [TypeScript](https://emacs-lsp.github.io/lsp-mode/page/lsp-typescript/)
    which requires npm installed.
  - Restart Emacs after LS is installed and open file to see LSP
    starting

LSP features:

- Default completion in Emacs - suggestions at cursor:
  `completion-at-point`
- Information about methods, variables when highlighted or using
  completions
- Highlighting text provides feedback like highlight variable throughout
  code
- Find references: `C-c l g r`
- Find definitions: `C-c l g g`
- Refactor like rename: `C-c l r`
- Diagnostics - problem checks
  - Flymake tracks problems in file: `flymake-show-buffer-diagnostics`
    - Modeline will display lightbulb for quick fixes
- Code formatting `C-c l = =`
- Comment line with `comment...`
- Integrate with other packages to enhance:
  - Ivy for search of symbols and other
  - Treemacs for references, symbols, messages, files

### 9 - Learn to Love the Terminal Modes

[
Source](https://youtu.be/wa_wZIuT9Vw?list=PLEoMzSkcN8oPH1au7H6B7bBJ4ZO7BXjSZ&t=52)

- Learn and configure terminal and shell modes in Emacs

- `term`: Terminal emulator in emacs lisp, will be slower then other
  terminals and is available in default emacs. It emulates being on a
  console and interrupts control codes and sends and share input/output.

  - `term-char-mode`: Send keys directly to emulators
  - `term-line-mod`: Regular mode, all Emacs commands, buffer
    manipulation are enabled
  - Opening it again will return you to same terminal unless you rename
    first terminal buffer

- `ansi-term`: automatically opens a new terminal each time

- Term and ansi-term is hardcoded to using sh. It is not possible to use
  is easily in Windows. If on Windows, use shell instead.

- `vterm`: uses native compiled library and requires dependencies and
  allows it to be faster

- `shell`: like in between terminal and eshell.

  - Not terminal emulator, just a shell with buffer I/O is managed by
    emacs

  - Disadvantages: certain commands like htop will not work

  - Advantages:

    - Emacs buffer editing and commands can work. E.g. shell history

  - For Windows, configure powershell as default is an option

    ``` elisp
    (when (eq system-type 'windows-nt)
      (setq explicit-shell-file-name "powershell.exe")
      (setq explicit-powershell.exe-args '()))
    ```

- `eshell`: native, consistent, bash like, emacs lisp shell and provides
  full access and integration with Emacs

  - Pros:
    - Bash shell replication
    - Support aliases
    - Consistent shell across operating systems
    - Can run Elisp REPL and Emacs commands like dired
    - Can redirect output to buffers
  - Cons compared to terminal:
    - Less completions
    - Slower
    - Syntax differences
    - Some tools do not work like nvm, virtualenv

- Recommendations:

  - Use `ansi-term` and `vterm` for terminal emulation
  - Use `shell` for native shells
  - Use `eshell` for cross platform consistency and Emacs lisp. Has
    potential.

### 10 - Effortless File Management with Dired

Source:

[Emacs From Scratch \#10 - Effortless File Management with
Dired](https://youtu.be/PMWwM8QJAtU?list=PLEoMzSkcN8oPH1au7H6B7bBJ4ZO7BXjSZ&t=71)

- `C-x d` to open dired
  - Looks like ls output
- Configure with `dired-listing-switches`
  - `dired-listing-switches "-alh"` to show hidden files and human
    readable sizes
  - `dired-listing-switches "-alh --group-directories-first"` to group
    directories first
  - `dired-listing-switches "-alh --group-directories-first --color=always"`
    to show colors
- Use package "dired single" to prevent multiple dired buffers remaining
  - Use package "dired-hide-dotfiles" to toggle showing dot (hidden)
    files

### 11 - Keeping Your Emacs Packages Up to Date

Source:

- [Keeping Your Emacs Packages Up To Date - Emacs From Scratch
  \#11](https://www.youtube.com/watch?v=dtjq68F2dXw&list=PLEoMzSkcN8oPH1au7H6B7bBJ4ZO7BXjSZ&index=11)

- Emacs won't remind you to update your packages, it won't do background
  checks. You have to do it manually.

- List packages: `M-x list-packages`

  - `U` to mark for update
  - `x` to execute update
  - `i` to mark for install
  - `d` to mark for delete
  - `r` to refresh
  - `g` to refresh and update
  - `q` to quit

- Manual update:

  - Use `list-packages`
  - `U` to mark ones ready for update
  - `x` get upgrades
  - Restart Emacs

- Automatic update:

  - Can use a package `auto-package-update`
  - `M-x auto-package-update-now` to update

- Should you auto update?

  - Updates could break your Emacs

### 12 - How to Cut Emacs Start Up Time in Half

Source:

- [How to Cut Emacs Start Up Time in Half! - Emacs From Scratch
  \#12](https://www.youtube.com/watch?v=9i_9hse_Y08&list=PLEoMzSkcN8oPH1au7H6B7bBJ4ZO7BXjSZ&index=12)

1.  Pain point, slow Emacs startup

    - Emacs start up time can get slow as you configure and use more
      packages.

    - It is not daemon mode related where Emacs and always running as
      daemon

    - Does Emacs actually start slow? no, try `emacs -Q` to start
      without any configuration and see it is instant.

2.  Startup time

    You can track start up times with dashboard package or example:

    ``` elisp

    ;; Track start up time and number of garbage collections
    (defun efs/display-startup-time ()
      (message "Emacs loaded in %s with %d garbage collections."
               (format "%.2f seconds"
                       (float-time
                       (time-subtract after-init-time before-init-time)))
               gcs-done))

    (add-hook 'emacs-startup-hook #'efs/display-startup-time)
    ```

    All start up stuff can be seen in function `normal-top-level` and/or
    read list of [Summary: Sequence of Actions at
    Startup](https://www.gnu.org/software/emacs/manual/html_node/elisp/Startup-Summary.html).

3.  Advice on Startup times

    [See
    tips](https://github.com/daviwil/emacs-from-scratch/blob/master/show-notes/Emacs-Scratch-12.md#the-most-important-tip-dont-load-any-packages)

    `use-package` gives you a few different ways to defer package
    loading:

    - `:hook` - Package will be loaded the first time one of the hooks
      is invoked
    - `:bind` - Package will be loaded the first time one of the key
      bindings is used
    - `:commands` - Package will be loaded when one of the commands are
      used
    - `:mode` - Package will be loaded the first time a file with a
      particular extension is opened
      - Regexp pattern on file before a mode is loaded
    - `:after` - Load this package after other specific packages are
      loaded
    - `:defer` - If you don't use any of the other options, this one
      will defer loading until after startup
      - Defer to later or number of seconds after startup
      - Determine if packages needs to be there at startup, otherwise
        defer
    - `:demand t` - If you want to load a package at startup despite
      other options, use demand
    - Load stuff after other things using `with-eval-after-load`
    - Adjust garbage collection. See also package
      [gcmh](https://akrl.sdf.org/) that adjusts garbage collections
      during run time

### Emacs from Scratch Old Series - Final Init.el

See my dotfiles

### N1 The Basics of Emacs Configuration

[The Basics of Emacs
Configuration](https://www.youtube.com/watch?v=OaF-N-FuGtc)

- Edit Emacs configuration in a file in Emacs Lisp language
  - `~/.emacs` or `~/.emacs.d/init.el`
  - Recommendation for Linux `~/.config/emacs/init.el`

Common use cases:

- Set variables
- Change features

1.  Set Variables

    ``` elisp
    ;; Do not show splash screen
    ;; Flash on warnings
    (setq inhibit-startup-message t
          visble-bell t) ;; Comment at end of line

    ;; t = true
    ;; nil = false
    ```

    - This is a lisp expression (wrapped in parentheses) that is a
      "call" to a function called `setq`. The function `setq` takes two
      arguments, the first is the variable name and the second is the
      value to set it to.
    - Variable and function names in Emacs are usually form
      `some-variable-name` = lower case words with hyphen characters
      between them.
    - You can evaluate Emacs configuration as it is running.

2.  Change Features

    ``` elisp
    ;; Disable tool bar
    (tool-bar-mode -1)
    ```

    - `-1` in this case means false

    1.  Setting Theme

        ``` elisp
        ;; Set theme to Modus Vivendi (Emacs 28 and later)
        (load-theme 'modus-vivendi t)
        ```

        `'` before modus-vivendi tells lisp to not evaluate the theme's
        name and just read it as a name

3.  Getting Help

    Get documentation

    - describe-symbol - documentation on any

    Can read from cursor:

    - describe-variable - documentation on any variable
    - describe-function - documentation on any function

### N2 The 6 Emacs Settings Every User Should Consider

[The 6 Emacs Settings Every User Should
Consider](https://www.youtube.com/watch?v=51eSeqcaikM)

- `(recentf-mode 1)` - recall recently opened file

- `(savehist-mode 1)` - save history of minibuffer

  - I use package `amx` instead which saves recent commands and recalls
    them during `M-x`

- `(save-place-mode 1)` - remember the last place you visited in a file

- Save customization variables to a different place instead of your
  `init.el`

``` elisp
(setq custom-file (locate-user-emacs-file "custom-vars.el")
(load custom-file 'noerror 'nomessage)
```

- `use-dialog-box nil` - disable graphical dialog boxes
- `(global-auto-revert-mode 1)` - automatically check for changes on
  disk. To manually update files if this mode is not on in the buffer,
  use `revert-buffer`
  - `(setq global-auto-revert-non-file-buffers t)` - check for changes
    in non-file buffers

## See Also

### Sources: Video Series from System Crafters

- [Emacs from Scratch
  Series](https://www.youtube.com/watch?v=74zOY-vgkyw&list=PLEoMzSkcN8oPH1au7H6B7bBJ4ZO7BXjSZ) -
  customization, UI, Bindings, Projectile, Magit, Org Mode, IDE and
  LSP-mode, Terminal, File Management with Dired, Update packages, Cut
  start up times
- Configuration with Org Babel
  ([configuration](https://github.com/daviwil/dotfiles/blob/master/Emacs.md#presentations))
