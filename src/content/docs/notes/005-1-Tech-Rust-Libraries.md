---
description: Useful Rust libraries or frameworks
filetags: ":rust:tech:libraries:epubnote:"
id: 1163ccec-6925-455a-bf8a-4c3a1c5ee1f9
title: Rust Libraries
---

## Crates

- [Axum](https://lib.rs/crates/axum) - Web framework that focuses on
  ergonomics and modularity, HTTP server, APIs
- [Chrono](https://crates.io/crates/chrono) - Timezone-aware date and
  time handling
- [Clap](https://lib.rs/crates/clap) - CLI argument parsing
- [command-run](https://crates.io/crates/command-run) - running a
  command in a subprocess; thin wrapper around the
  `std::process::Command` type with additional convenient features like
  logging, success check, command output
- [crossterm](https://lib.rs/crates/crossterm) - Low-level
  cross-platform terminal rendering and event handling
- [CSV](https://lib.rs/crates/csv) - Fast CSV parsing with support for
  serde
- [grex](https://github.com/pemistahl/grex) - Generate a matching
  regular expression from the test cases you provide
- [GTK4](https://lib.rs/crates/gtk4) - GUI Rust bindings for GTK4
- [Itertools](https://crates.io/crates/itertools) - Extra iterator
  adaptors, iterator methods, free functions, and macros
- [Jiff](https://crates.io/crates/jiff) - date-time library providing
  high level datetime primitives that are difficult to misuse and have
  reasonable performance. Jiff is heavily inspired by the Temporal
  project, TC39 proposal to improve datetime handling in JavaScript.
- [Polars](https://pola.rs/) - Dataframes
- [Ratatui](https://lib.rs/crates/ratatui) - terminal user interfaces
- [Rayon](https://lib.rs/crates/rayon) - convert sequential computation
  into parallel computation with one call - \`par<sub>iter</sub>\`
  instead of \`iter\`
- [reqwest](https://crates.io/crates/reqwest) - ergonomic,
  batteries-included HTTP Client for Rust. Includes features like async
  and blocking, bodies, proxies, WASM, cookie store
- [RusTLS](https://crates.io/crates/rustls) - modern TLS library; offers
  cryptographic security, requires no configuration to achieve that
  security, and provides no unsafe features or obsolete cryptography by
  default
- [Serde](https://lib.rs/crates/serde) - generic
  serialization/deserialization framework
- [SQLx](https://crates.io/crates/sqlx) - SQL Toolkit. An async, pure
  Rust SQL crate featuring compile-time checked queries without a DSL.
  Supports PostgreSQL, MySQL, and SQLite and others
- [syntect](https://crates.io/crates/syntect) - high quality syntax
  highlighting and code intelligence using Sublime Text's grammars
- [Tokio](https://lib.rs/crates/tokio) - oldest async runtime in the
  Rust ecosystem and still the most widely supported. Recommended for
  new projects.
- [utoipa](https://crates.io/crates/utoipa) - Auto-generated OpenAPI
  documentation

### Errors

- [Anyhow](https://lib.rs/crates/anyhow) - Provides a boxed error type
  that can hold any error, and helpers for generating an
  application-level stack trace. Good for function caller logging error
  and stopping.
- [color-eyre](https://crates.io/crates/color-eyre) - error report
  handler for panics and eyre::Reports for colorful, consistent, and
  well formatted error reports for all kinds of errors
- [eyre](https://crates.io/crates/eyre) - Flexible concrete Error
  Reporting type built on std::error::Error with customizable Reports

## Cross Platform GUI

Based on [Blessed.rs Native GUI section](https://blessed.rs/crates) and
[A 2025 Survey of Rust GUI Libraries \|
boringcactus](https://www.boringcactus.com/2025/04/13/2025-survey-of-rust-gui-libraries.html)
and [GitHub - flosse/rust-web-framework-comparison: A comparison of some
web frameworks and libs written in
Rust](https://github.com/flosse/rust-web-framework-comparison).
Recommendations based on accessibility and productivity.

- [Dioxus](https://dioxuslabs.com/) - full stack cross platform app and
  web for Rust
- [egui](https://lib.rs/crates/egui) - easy to use, pure rust, runs on
  the web, native, and game engine
- [gpui](https://www.gpui.rs/) - UI framework from creators of Zed
- [Iced](https://iced.rs/) - Retained mode UI with a nice API
- [Leptos](https://lib.rs/crates/leptos) - front end web, full stack
- [Tauri](https://tauri.app/) - cross platform app platform
  - Example: <https://github.com/readest/readest>

## Standard Library

- [Command in std::process -
  Rust](https://doc.rust-lang.org/std/process/struct.Command.html)
  ([DevDocs](https://devdocs.io/rust/std/process/struct.command)) -
  Command, like shell command execution

## Utilities

- [bacon](https://crates.io/crates/bacon) - background rust compiler
  that watches your project and run jobs
- [cargo-generate](https://crates.io/crates/cargo-generate) - create
  cargo projects from templates
- [cargo-nextest](https://crates.io/crates/cargo-nextest) - fast test
  runner for Rust, check and manage tests
- [cargo-seek](https://crates.io/crates/cargo-seek) - search crates.io
  TUI, manage crates in current project
- [cargo-update](https://crates.io/crates/cargo-update) - cargo
  subcommand for checking and applying updates to installed executables
- [clippy](https://doc.rust-lang.org/stable/clippy/index.html) - code
  checker with [Cargo.toml
  configuration](https://www.namtao.com/rust-toolkit-2026/#clippy-config)
- [watchexec](https://crates.io/crates/watchexec) - execute commands in
  response to file modifications, for example clippy, test, run or any
  commands

## External Links

### Rust Package Recommendations

Where to find trusted, recommended crates

- [Awesome Rust](https://github.com/rust-unofficial/awesome-rust)
- [Blessed.rs](https://blessed.rs/)
- [crates.io Rust community’s crate registry](https://crates.io/)
- [Lib.rs — home for Rust crates](https://lib.rs/) - includes library
  descriptions, download metrics, links to library source and examples
