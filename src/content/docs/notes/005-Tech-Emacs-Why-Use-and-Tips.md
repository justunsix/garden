---
filetags: ":emacs:epubnote:"
id: e2e564a8-a928-42e5-a2d7-3d3f8c187878
title: Why Use Emacs and Tips
---

## About Emacs

Sources:

- [Beginners Guide to
  Emacs](https://www.masteringemacs.org/article/beginners-guide-to-emacs) -
  technical introduction
- [Absolute Beginners Guide to
  Emacs](http://www.jesshamrick.com/2012/09/10/absolute-beginners-guide-to-emacs/)
  with pictures and key bindings, good plain language overview

Tagline: Emacs is the extensible, customizable, self-documenting
real-time display editor.

Emacs is:

- a tiling window manager

### Terms

- **Buffer**: where you read/write text, can be a shell, file, snippets,
  email, etc.
- **Frames** and **windows**:
  - Frame can be open, closed, minimized, maximized, and dragged around
  - Window is bit of the frame that displays a buffer. There can be
    unlimited windows in a frame
- **Modeline**, **Echo area**, **Minibuffer**
  - Echo area: void at bottom of emacs and is only ever one. Used to
    display messages.
  - Mode line: each window has its own mode line with information about
    the buffer in the that window
  - Minibufer and echo share space: when emacs prompts for action, you
    are asked to answer in a minibuffer (a small buffer)
- **Command** and **Function**
  - Command is an interactive function. Not all functions are commands.
    Command is something you can interact with in `M-x`. Commands are
    sometimes bound to one or more key bindings.
- **Major** and **Minor Modes**
  - A major mode imbues a buffer with the capabilities it needs to do a
    particular job (e.g. open a `.c` file or an `.org` file to activate
    that mode for the file).
    - You can only have one major mode active in a buffer at a time.
    - Unlimited minor modes can be active at the same time.
- **Point and Mark**
  - Point = cursor caret.
  - Mark is a transient beacon (selection rectangle) that is on the
    other region of the point.
  - Together they form the region
- **Killing and Yanking**
  - Emacs clipboard is the kill ring.
  - Killing (cut) text appends to the same clipboard entry if you
    successively kill text. The clipboard entry the text goes into is
    only broken when you break the chain of kill commands by using a key
    binding or command that does not kill text.
    - e.g. calling `M-d` (delete forward word) 3 times creates a kill
      ring entry with the three words
  - Yanking (paste) text can recall the end of the ring and previously
    killed items using `C-y` with `M-y` to cycle through the ring.
  - Kill ring entries can be limited to set emacs to discard entries.
- **Undoing**
  - Undo works like the kill ring and undo actions can be redone.
- **Movement and Editing**
  - Arrow keys can be used
  - Emacs also has its own keys

### Asking Emacs Help

- Use `C-h r`, which is also bound `to M-x info` or Help -\> Read the
  Emacs Manual in the menu bar. Also use Help -\> Search Documentation.
- Ask about a specific key to know what is does: `C-h k` (or Help -\>
  Describe -\> Describe Key or Mouse Operation). It is contextual so run
  it for the buffer you intend to run the command.
- If you know the name of the function or command, use:
  - `C-h f` (or Help -\> Describe -\> Describe Function)
  - You're then treated to a documentation string of the function along
    with any keys it's bound to.
  - You can press `i` (Emacs 28+) to open the corresponding manual page,
    if any, for that function.
  - The manual is usually more detailed and includes similar functions
- Check active modes in the current buffer:
  - `C-h m` (or Help -\> Describe -\> Describe Buffer Modes)

### Customizing Emacs

- You can customize Emacs with elisp or with the builtin Customize
  interface. Customize is recommended for beginners.
- Applying One-off Changes
  - One example is `M-x fido-mode` or `ido-mode` an intelligent
    search-as-you-type framework. If you were to just type it into M-x
    then it'll work great until you exit Emacs. At that point it, or
    indeed any other change you've made but haven't explicitly saved, is
    lost.
  - How do you fix that? You can add it to your init.el file in
    ~/.emacs.d/init.el or you can check and see if it's supported by the
    customize interface: M-x customize-option RET fido-mode RET.

## Why Learn Emacs?

Source: [Why use emacs in
2021](https://www.youtube.com/watch?v=bEfYm8sAaQg)

### Top Reasons

- Productivity environment you can customize with Lisp
- Manage projects, tasks, and appointments with org mode
- Manage email (mu4e), IRC/Telegram/Facebook/etc. chats (ERC, telega.el)
  with packages
- Management remote servers with TRAMP
- Full desktop environment with Emacs X Window Manager (EXWM) - only on
  Linux

and:

- Vim style editing with `evil mode`
- IDE capabilities with `lsp-mode` and `dap-mode`
- Magit git client: GUI and one button commands
- Integration with compilers, test runners, linters, debuggers, etc.

### Keyboard driven interface

- Specific Bindings for modes
- Create your own bindings that are bound to prefixes (use a leader key
  like `C-SPC`)
- Enable transient keymaps (`set-transient-map`)

### Discoverable

- Use `describe-bindings` or `which-key` to know keys
- Use `describe-key` to know what a key does

### Crafting Environment

- UI is open to customization, see [Emacs from scratch - customization
  of UI](https://www.youtube.com/watch?v=74zOY-vgkyw)
- Customize behaviour:
  - Hook - a function that is called when a certain event occurs
  - Advice - a function that is called before or after another function

### Power of Org Mode

- Todo lists, writing notes and logs
- Literate programming - run code blocks and have results in buffer;
  like Jupyter notebook
- Spreadsheets
  - Calculations
- System configuration
  - [System configuration through
    org-babel](https://www.youtube.com/watch?v=kkqVTDbfYp4)
  - Blocks can export output to file system configuration files

## Tips

- Use `M-x menu-bar-mode` to enable the menu bar temporarily
- Use the mouse and menu bar for contextual help, links, and bottom bar
  options
- View packages `M-x list-packages` or selecting it from Options -\>
  Manage Emacs Packages
  - Update packages: run list-packages hit `U` to mark available
    upgrades, then review to decide if there are any not required. Then
    `x` to upgrade
- M (alt) is used for operations related to units of the language
  (words, sentences). While C (Control) operates on basic units like
  characters and lines
