---
description: Tips to improve rust compilation times
filetags: ":epubnote:rust:compilation:"
id: 7696f344-68a6-4851-b39d-7b73e131a252
title: Rust Faster Compile Times
---

See [Tips for Faster Rust Compile
Times](https://corrode.dev/blog/tips-for-faster-rust-compile-times/) for
details.

Summary of tips:

- Keep rust updated
- `cargo check` to just check without compiling
- Remove unused depenencies, use simpler dependencies, remove unused
  features
- `cargo build --timings` for find slow crate and profile compilation
- Switch to simpler dependencies
- Use workspaces to split big crates and related workspace tools
- Use features to split up code in a crate
- Cache dependencies, including using CI or remote servers - see below
  on sccache
- Alternative compilers, linkers, and running tests
- Compilation, debugging environment variables
- OS specific development settings, in memory file system, better
  hardware or offload to remote
- Code specific use and optimization
- Container layer caching, see `cargo-chef`
- IDE, development environment optimizations

## When and why to use Rust dependency caching

For when to use a rust dependency cache like sccache for caching see
[Why you need
sccache](https://elijahpotter.dev/articles/why_you_need_sccache).

> In short: you need sccache if you are frequently swapping between
> branches with similar (but not identical) dependencies or expect to
> frequently delete Rust's disk cache.
