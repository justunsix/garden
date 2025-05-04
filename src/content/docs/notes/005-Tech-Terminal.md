---
filetags: ":terminal:programs:epubnote:"
id: af66c501-039b-4af6-ba93-18e759546761
title: Terminal
---

## Modern Terminal Commands

- [alacritty](https://alacritty.md/) - terminal emulator, URLs can open,
  search, VI bindings
- [atuin](https://github.com/ellie/atuin) - interactive shell history
- [ag](https://github.com/ggreer/the_silver_searcher) - A code searching
  tool similar to ack, but faster.
- bacon - re-runs cargo clippy, build, test, or run
- bat - cat with colours, line numbers, git integration, paging
- bob-nvim - nvim version manager
- [bottom](https://github.com/ClementTsang/bottom) - like htop with
  widgets, cross platform
- [broot](https://dystroy.md/broot/) - directory and file navigation
  with directory sizes, search
- curlie - user friendly curl, good also for API tests
- cheat - cheat sheets
- dog - user friendly, powerful dig
- cargo-info - shows info about crates
- choose - uman-friendly and fast alternative to cut and (sometimes) awk
- [coreutils](https://github.com/uutils/coreutils) - GNU coreutils in
  Rust, cross platform, can alias to run rust coreutils instead of OS
  ones like alias usort = "coreutils sort"
- Difftastic: structural diff tool that compares files based on their
  syntax.
- duf - df alternative
- [dust](https://github.com/bootandy/dust) - file and folder size tree,
  du with colours like subdirectories, intuitive interface
- evcxr<sub>jupyter</sub> - rust kernel for jupyter, requires Jupyter
  framework to be installed
- [eza](https://github.com/eza-community/eza) - ls with colours, icons
- fd - find with shorter syntax, some limitations, colours
- fzf - fuzzy finder
- [hurl](https://hurl.dev/) - for repeatable tests and plain text files
  for requests, API testing
- hyperfine - command line benchmarking tool
- jq - sed for JSON
- httpie - user friend HTTP client
- [gitui](https://github.com/extrawurst/gitui) - terminal client for git
- [irust](https://github.com/tarcieri/irust) - interactive rust REPL
- lsd - ls with more accessible output, colours, icons
- macchina: A system information frontend
- mcfly - better history search
- [monolith](https://github.com/y2z/monolith): CLI tool for saving
  complete web pages as a single HTML file
- [mosh](https://mosh.md/) - remote terminal allowing roaming,
  intermittent connectivity, like SSH
- [mprocs](https://github.com/pvolok/mprocs) - like tmux, but useful for
  long running non-interactive single processes to give them status
- ncspot - spotify client
- [nu](https://www.nushell.sh/) - shell, has plugins
- Ouch: Painless compression and decompression for your terminal with
  autodetection of file types
- porsmo - pomodoro timer
- [posting](https://github.com/darrenburns/posting) - API TUI, good for
  API tests
- [procs](https://github.com/dalance/procs) - ps with colours and more
  accessible output, search
- pgcli - postgresql interface
- ripgrep - faster grep, grep with default recursive search, filters
- rtx-cli - version manager of programming languages like python, node,
  ruby, like program `asdf`
- [sccache](https://github.com/mozilla/sccache) - cache for compiler
  tools, support for Rust code, see
  [usage](https://github.com/mozilla/sccache#usage) for set up
- [sd](https://github.com/chmln/sd) - Intuitive find & replace CLI (sed
  alternative)
- skim - command fuzzy finder
- speedtest-rs - network speedtesters
- starship
- [starship](https://starship.rs/) prompt - cross platform/shell
  configurable prompt
- tig - git log viewer
- tldr ([tealdeer](https://github.com/dbrgn/tealdeer)) - shortened man
  pages with examples
- tokei - code statistics
- [typst](https://github.com/typst/typst) - markup-based typesetting
  system, like a modern LaTex, Word, Google docs, good for academic and
  technical documentation
- [topgrade](https://github.com/topgrade-rs/topgrade) Upgrade all the
  things by detecting the tools you use and running the appropriate
  commands to update them.
- wiki-tui - wikipedia terminal ui
- [wormhole](https://github.com/magic-wormhole/magic-wormhole) - private
  file transfer from computer to computer
- [wttr.in](https://github.com/chubin/wttr.in) - using curl to query
  weather like curl wttr.in/toronto
- [zellij](https://github.com/zellij.md/zellij) - terminal multiplexer
  like tmux, no Windows implementation as of 2023-06-14
- [zoxide](https://github.com/ajeetdsouza/zoxide) - smart cd to jump to
  frequently used directories

nix package manager on Linux, MacOS and scoop on Windows covers most of
these programs

### Support Summary as of 2025-02-13

Key commands I use regularly and packaging support:

| Program        | Arch    | Debian | Fedora | FreeBSD | Ubuntu | Void | MSYS2 | scoop |
|----------------|---------|--------|--------|---------|--------|------|-------|-------|
| atuin          | x       | x      |        | x       |        | x    |       |       |
| bat            | x       | x      | x      | x       | x      | x    | x     | x     |
| broot          | x       | x      |        | x       |        | x    |       | x     |
| carapace       | x (AUR) | x      |        | x       | x      | x    |       | x     |
| fd             | x       | x      | x      | x       | x      | x    | x     | x     |
| fzf            | x       | x      | x      | x       | x      | x    | x     | x     |
| helix          | x       |        | x      | x       |        | x    | x     | x     |
| lazygit        | x       |        | x      | x       |        | x    |       | x     |
| mprocs         | x (AUR) |        |        | x       |        |      |       | x     |
| nushell        | x       |        | x      | x       |        | x    |       | x     |
| ripgrep        | x       | x      | x      | x       | x      | x    | x     | x     |
| starship       | x       | x      | x      | x       | x      | x    | x     | x     |
| topgrade       | x       |        |        | x       |        | x    |       | x     |
| vcstool (pipx) | x       | x      | x      | x       | x      | x    | x     | x     |
| yazi           | x       |        |        | x       |        | x    | x     | x     |
| zoxide         | x       | x      | x      | x       | x      | x    | x     | x     |

### Installation

Most packages above can be installed using cargo with
`cargo install <command>`

[Installation - The Cargo
Book](https://doc.rust-lang.md/cargo/getting-started/installation.html)

## See Also

- [Termux](../005-tech-termux) - Mobile Android Linux like system
- [Linux Terminal Shortcuts](id:bf3b61d8-23cc-4959-a5c7-17041d7e43f4)
  ([Linux Terminal
  shortcuts](../005-computer-shortcuts-linux-terminal-gnu-readline))
- [Local Computer Tools and
  Applications](id:58b9016f-4e75-43d5-ac66-36fc4725e754) ([Local
  applications](../005-tech-local-computer-tools-apps)) - Free / Open
  Source Software Suggestions
- [Charm Gum - tool for glamourous shell
  scripts](../005-tech-terminal-charm-gum) - [Charm Gum - tool for
  glamourous shell scripts](id:a4eb2482-a0cd-4761-a08d-4afb4f285b4d)

### Resources

- [14 Rust Tools for Linux Terminal
  Dwellers](https://itsfoss.com/rust-cli-tools/)
- [Oxidise Your Life: Rust User
  Land](https://github.com/0atman/noboilerplate/blob/main/scripts/20-rust-userland.md) -
  Suggested cross platform rust terminal programs
- [Modern Unix](https://github.com/ibraheemdev/modern-unix)
- [A list of new(ish) command line tools - Julia
  Evans](https://jvns.ca/blog/2022/04/12/a-list-of-new-ish--command-line-tools/)
