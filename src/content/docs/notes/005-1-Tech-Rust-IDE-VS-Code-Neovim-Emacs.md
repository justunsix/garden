---
date: 2026-06-03
filetags: ":rust:cargo:ide:editor:neovim:nvim:emacs:doom-emacs:epubnote:"
id: 75d11278-ed55-459f-911e-df1209bceb76
title: Rust Integrated Development Environment (IDE) with VS Code,
  Neovim, and Emacs
---

This article describes setting up a Rust language integrated development
environment on VS Code \[fn:1\], Neovim \[fn:2\], and Emacs \[fn:3\].
The structure of the article and wording follows [Rust in Visual Studio
Code](https://code.visualstudio.com/docs/languages/rust) and attribution
is given to VS Code contributors for the structure of their
documentation that is used in this article.

## Introduction

Setup will be similar across different operating systems (Windows,
MacOS, Linux, BSD) since the editors and Rust are available. BSD may
require specific instructions or ports for the software mentioned.

The setup uses additional plugins/distributions to make set up easier:

- [VS Code](https://code.visualstudio.com/) uses the [rust-analyzer
  extension](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer)
- Neovim uses the [LazyVim distribution](https://www.lazyvim.org/)
- Emacs uses the [Doom Emacs
  distribution](https://github.com/doomemacs/doomemacs)

Follow your editor of choice instructions to install on your computer.
For Neovim/Emacs, follow the distribution's instructions after
installing the editor.

Learn more about [Rust](https://www.rust-lang.md) with the [The Rust
Programming Language](https://doc.rust-lang.org/book) book.

Note the shortcut keys in this article assume the editor is configured
with the above plugins/distributions which can differ from the default
shortcuts. For MacOS, where Ctrl (control) is shown, use the command
key. SPC stands for Spacebar.

## Install Rust

Install the Rust tools on your machine using the
[rustup](https://rustup.rs) installer, which supports installation on
Windows, macOS, and Linux. Follow instructions for your platform, taking
care to install any extra tools required to build and run Rust programs.

For more information or if you run into problems, see the [Rust
installation guide in The Rust Programming Language
book](https://doc.rust-lang.org/book/ch01-01-installation.html).

Install components for rust development using the `rustup` command line
interface and check settings:

``` shell

# Install rust formatter, linter, and language server
rustup component add rustfmt clippy rust-analyzer

# Check your Rust installation
rustc --version

```

Description of rust components installed:

- `rustfmt` - formatter
- `clippy` - linter, code checking and tips to fix issues
- `rust-analyzer` -
  "[rust-analyzer](https://github.com/rust-lang/rust-analyzer) is an
  implementation of Language Server Protocol for the Rust programming
  language. It provides features like completion and goto definition for
  many code editors, including VS Code, Emacs and Vim \[fn:4\]"

Keep your Rust installation up to date with the latest version by
running:

``` shell

rustup update

```

There are new stable versions of Rust published every 6 weeks so this is
a good habit.

Restart any terminal and other development program instances to get the
updated `PATH`.

## Rust in Visual Studio Code, Neovim or Emacs

Follow instructions depending on which editor you are using:

### VS Code Extensions

Within Visual Studio Code, install the [rust-analyzer
extension](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer)
and restart VS Code.

### Neovim LazyVim Plugins

Using `:LazyExtras`, enable the [Rust language LazyVim
extra](https://www.lazyvim.org/extras/lang/rust). Restart Neovim and run
`:Mason` to download other dependencies.

### Doom Emacs Packages

Add the rust language [module under
languages](https://github.com/doomemacs/doomemacs/blob/master/docs/getting_started.md#modules)
in Doom's `init.el` add `(rust +lsp +tree-sitter)`. The `+tree-sitter`
flag is optional and requires
[tree-sitter](https://github.com/tree-sitter/tree-sitter) installed.

## Rust documentation Locally and on Web

The `rustup` install includes the full Rust documentation set locally
installed on your machine by running:

``` shell

rustup doc

```

The Rust documentation, including [The Rust Programming
Language](https://doc.rust-lang.org/book/title-page.html) and [The Cargo
Book](https://doc.rust-lang.org/stable/cargo/), will open in your local
browser so you can use it offline.

## Hello World

Follow [Hello, World! - The Rust Programming
Language](https://doc.rust-lang.org/book/ch01-02-hello-world.html) in
your editor and use [Cargo](https://doc.rust-lang.org/cargo), the Rust
package manager in the next tutorial [Hello, Cargo! - The Rust
Programming
Language](https://doc.rust-lang.org/book/ch01-03-hello-cargo.html).

In the two tutorials, all commands can be run on the terminal or use the
editor's terminal or shell command/task runners. Each editor will have
their own way of running the program, here are examples:

- VS Code: use terminal, `cargo run`
- Neovim: `:!cargo run`
- Emacs: M-x compile `cargo run`

There are other ways depending on the editor or use the terminal.

## Code Information, Suggestions

[rust-analyzer](https://github.com/rust-lang/rust-analyzer/releases)
gives features through the Rust language server giving detailed code
information and smart suggestions. In VS Code, this feature is called
IntelliSense and Neovim/Emacs may call them Language Server Protocol
(LSP) information and features.

When you first open a Rust project, rust-analyzer's progress can be seen
in the editor, usually in a status area like the bottom left or messages
buffer. Wait until rust-analyzer has completely reviewed your project to
use the language server's features.

## Inlay hints

One of the first things you may notice is rust-analyzer providing inlay
hints to show inferred types, return values, named parameters in light
text in the editor like the occurance of the word `String` in the
example below.

``` rust

let mut guess: String = String::new();

```

## Hover/Documentation information

Hovering on any variable, function, type, or keyword will give you
information on that item such as documentation, signature, etc.

Shortcut keys:

| Feature             | VS Code               | Neovim | Emacs |
|---------------------|-----------------------|--------|-------|
| Documentation/Hover | Mouse or cursor hover | K      | K     |

In VS Code, hovering can be done with the cursor and mouse. Neovim and
Doom Emacs can use the Hover/Documentation key `K` in normal mode like
Vim's K to look up documentation for the item at the cursor.

You can also jump to the type definition in your own code or the
standard Rust libraries using the hover in VS Code or Neovim/Doom Emacs
`gd` for go to definition.

| Feature          | VS Code               | Neovim | Emacs |
|------------------|-----------------------|--------|-------|
| Go to definition | Mouse or cursor hover | gd     | gd    |

## Auto completions

As you type in a Rust file, completions give you suggested completions
and parameter hints. The completions are specific to packages installed
in the editor.

- VS Code - IntelliSense
- Neovim/Doom Emacs - Completion packages

Completions will use things like context of the file and its language as
well as other keywords, file context, and other completions you have
configured.

Completions can also be triggered manually:

| Feature | VS Code | Neovim | Emacs |
|----|----|----|----|
| Completion (Manual trigger) | Ctrl + Space | Ctrl + Space | M-x cape-\<depending on completion\> |

These completions are determined looking at files and content and are
would be separate completions from ones that may come from artificial
intelligence integration to the editors.

In other words, the completions do not use artificial intelligence.
Completions may use a combination of editor's understanding of the text,
programming language (for example functions, variables), dictionary
words, files, code snippets and other configured items in the editor.

## Semantic syntax highlighting

rust-analyzer is able to use semantic syntax highlighting and styling
due to its understanding of source code.

In VS Code, for example mutable variables are underlined in the editor.

## Code navigation

Code navigation features are available in the context menu and/or
functiosn of the editor

| Code navigation feature | VS Code | Neovim | Emacs |
|----|----|----|----|
| Go to Definition | F12 | gd | gd |
| Peek Definition/Documentation | Alt + F12 | K | K |
| Go to References | Shift + F12 | gr | SPC c D |
| Show Call Hierarchy | Shift Alt + H | footnote-cn1 | lsp-treemacs-call-hierarchy |
| Go to Symbol in File | Ctrl + Shift + O | SPC s s | SPC s i |
| Go to Symbol in Workspace | Ctrl + T | SPC s S | SPC c J |

footnote-cn1:

``` lua

:lua vim.lsp.buf.incoming_calls()
:lua vim.lsp.buf.outgoing_calls()

```

Each editor may have further useful code navigation like search symbol
in open files/buffers.

## Linting

The Rust toolset includes linting, provided by `rustc` and `clippy`, to
detect issues with your source code.

The rustc linter is enabled by default and detects basic Rust errors and
clippy will provide more tips.

Clippy can be used manually to check files in the current project root
directory with:

``` shell

cargo clippy

```

### VS Code

To enable clippy integration in rust-analyzer, change the Rust-analyzer
\> Check: Command (rust-analyzer.check.command) setting to clippy
instead of the default check. The rust-analyzer extension will now run
cargo clippy when you save a file and display clippy warnings and errors
directly in the editor and Problems view.

## Code Action Fixes, Quick Fixes

When the linter finds errors and warnings in your source code,
rust-analyzer can often provide suggested Quick Fixes (also called Code
Actions), which are available via a warning or indicator (light bulb in
VS Code) editor. Open available Quick Fixes with:

| Feature         | VS Code  | Neovim  | / Emacs |
|-----------------|----------|---------|---------|
| Code action fix | Ctrl + . | SPC c a | SPC c a |

## Refactoring

Due to rust-analyzer's semantic understanding of your source code, it
can also do smart renames, across your Rust files. With your cursor on a
variable, do rename symbol

| Feature       | VS Code                             | Neovim / Emacs |
|---------------|-------------------------------------|----------------|
| Rename symbol | Rename symbol in context menu or F2 | SPC c r        |

The rust-analyzer extension also supports other code refactor features
and code generation, which the extension calls
[Assists](https://rust-analyzer.github.io/manual.html#assists-code-actions).
Examples are:

- Convert if statement to guarded return
- Inline variable
- Extract function
- Add return type
- Add import

## Formatting

The Rust toolset includes a formatter,
[rustfmt](https://github.com/rust-lang/rustfmt), which can format your
source code to conform to Rust conventions.

Format your Rust file using:

| Feature            | VS Code         | Neovim  | Emacs   |
|--------------------|-----------------|---------|---------|
| Format file/buffer | Shift + Alt + f | SPC c f | SPC c f |

You also have the option to run the formatter on each save using VS Code
settings Editor: Format on save and Neovim/Emacs distributions can be
configured to format on save.

## Debugging

Debugging will vary with the editor.

### VS Code

Install one of two language extension with debugging support:

- [Microsoft
  C++](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)
  (ms-vscode.cpptools) – on Windows
- [CodeLLDB](https://marketplace.visualstudio.com/items?itemName=vadimcn.vscode-lldb)
  (vadimcn.vscode-lldb) – on macOS/Linux

### Neovim

[Neovim Debugging](/garden/notes/005-tech-vim-neovim-debug) provides an overview
of debugging in Neovim.

### Command Line

Install and run [LLDB](https://lldb.llvm.org/). See example commands at
[GDB and LLDB
Snippets](/garden/notes/005-computer-snippets-gdb-lldb-gnu-debugger) - [GDB and
LLDB Debugger Snippets](id:7fba6e8c-f671-4deb-8126-88a1208d567e).

### Shortcuts

| Feature | VS Code              | Neovim  | Emacs |
|---------|----------------------|---------|-------|
| Debug   | Rust Analyzer: Debug | SPC d r |       |

## Editor Settings Configuration

Features mentioned above can be configured like inlay hints, semantic
syntax highlighting, linting commands, and others.

Each editor can configure the features in settings like VS Code's
settings / `settings.json`, Neovim LazyVim's `options.lua`, and Doom
Emacs' `config.el` files.

You can learn more about rust-analyzer's semantic syntax customizations
in the [Editor
features](https://rust-analyzer.github.io/manual.html#editor-features)
section of the rust-analyzer documentation.

## Next steps

This article explains the rust-analyzer features with each editor. See
the details in the Rust Analyzer extension [User
Manual](https://rust-analyzer.github.io/manual.html) and see latest
features/bug fixes for rust-analyzer at
[CHANGELOG](https://rust-analyzer.github.io/thisweek).

If you have any issues or feature requests, log them in the
rust-analyzer extension
[repository](https://github.com/rust-lang/rust-analyzer/issues).

See the References section below for links to each editors' page on Rust
support including dealign with common issues and install problems.

## See Also

- [GDB and LLDB
  Snippets](/garden/notes/005-computer-snippets-gdb-lldb-gnu-debugger)
- [Neovim Debugging](/garden/notes/005-tech-vim-neovim-debug)
- [Neovim Language Server Protocol (LSP)](/garden/notes/005-tech-vim-neovim-lsp) - includes setup for
  Neovim with Rust
- [Rust](/garden/notes/005-1-tech-rust)
- [Rust on Windows](/garden/notes/005-1-tech-rust-on-windows)

## References

- \[fn:1\] [Rust in Visual Studio
  Code](https://code.visualstudio.com/docs/languages/rust)
- \[fn:2\] [Rust \| LazyVim](https://www.lazyvim.org/extras/lang/rust)
- \[fn:3\] [doomemacs/modules/lang/rust/README.org at master ·
  doomemacs/doomemacs ·
  GitHub](https://github.com/doomemacs/doomemacs/blob/master/modules/lang/rust/README.md)
- \[fn:4\] [rust-lang/rust-analyzer: A Rust compiler front-end for IDEs
  · GitHub](https://github.com/rust-lang/rust-analyzer)
