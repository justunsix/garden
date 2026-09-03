---
filetags: ":nix:package-manager:linux:macos:devenv:epubnote:"
id: 2ce2d5be-f9d1-45a1-a3f6-975c044ba771
title: devenv - Development and CI Environments
---

devenv can define a whole development/CI environment. "Fast,
Declarative, Reproducible, and Composable Developer Environments"

## Use Case

Manage development and CI environments across machines and easily share
them with others.

You create devenvs in `.nix` files to declare their attributes.

## Features

devenv uses [Nix](https://nixos.org/) to make the environments
declarative and reproducible.

- programming language integration (example: Python, JavaScript, Rust)
- platform integration
  - Examples: Android development, Codespaces Devcontainer, GitHub
    Actions continuous integration (CI) platform, WordPress development
- tasks
  - Example: general tasks, tasks running on a condition like file
    changes
- git hooks
  - Example: running formatters on commits
- processes
- services
  - Example: run databases, services with their configuration and ports
    open for use
    - Ports can be uses as variables in other parts of the devenv, like
      running a test when a port is available
    - Many [services are available](https://devenv.sh/services/) like
      HTTP servers, various databases, search, networking, monitoring or
      you can define your own
- containers
  - Example: Build equivalent container to the shell environment,
    processes, services
- multiple profiles
- packages, using nix packages
- ad-hoc environments
- environment variables
- profiles
  - Example: options depending on use case like stages of development,
    user of the environment, different machines
- scripts
  - Example: Can use any scripting language
- secrets management using [secretspec](https://secretspec.dev/)
  - Example: Secret names defined and retrieved using secrets providers.
    Secret provide logic is separate from the `devenv`

It is similar to `shell.nix` for Nix and adds more features and
integration.

## Example devenv for Rust and additional services

Example `devenv.nix` at [devenv.sh](https://devenv.sh/) for Rust
development, Postgres database, Redis cache, task runner, secrets
management, and others packages required in the environment

``` nix

{ pkgs, ... }: {
  languages = {
    # devenv.sh/languages/rust/
    rust = {
      enable = true;
      channel = "stable";
    };
  };

  services = {
    # devenv.sh/services/postgres/
    postgres = {
      enable = true;
      initialDatabases = [{ name = "app"; }];
    };

    # devenv.sh/services/redis/
    redis.enable = true;
  };

  # devenv.sh/tasks/
  tasks."app:test".exec = "cargo test";

  # devenv.sh/integrations/secretspec/
  processes.api.exec =
    "secretspec run -- cargo run";

  packages = [
    # devenv.sh/packages/
    pkgs.docker
  ];
}

```

## See Also

- [NixOS and Nix functional package manager](/garden/notes/005-tech-nix-nixos)

## References

- [devenv](https://devenv.sh/) - Define packages, languages, services,
  tasks, secrets, and tooling once. Gives developers and continuous
  integration (CI) fast, reproducible environments. Requires Nix package
  manager.
- [Devenv.sh: Instant Reproducible Dev Environments with Nix -
  Vimjoyer - YouTube](https://www.youtube.com/watch?v=Oj9AxyiaVvU)
- [My 2026 Rust Toolkit - No Boilerplate -
  YouTube](https://www.youtube.com/watch?v=jlWnoRsGJNQ) and text version
  at [My 2026 Rust Toolkit -
  namtao](https://www.namtao.com/rust-toolkit-2026/)
