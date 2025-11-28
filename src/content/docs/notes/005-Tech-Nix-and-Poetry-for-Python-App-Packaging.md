---
filetags: ":nix:python:epubnote:"
id: b8f60b30-8bf6-4e81-a7df-c25730c83e16
title: Nix and Poetry for Python App Packaging
---

## Nix and direnv for reproducible environments

Source: [Package and deploy Python apps faster with Poetry and Nix -
YouTube](https://www.youtube.com/watch?v=TbIHRHy7_JM)

Create shell.nix

Include required packages like poetry to manage python dependencies

``` shell

{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {

  buildInputs = [
    pkgs.python3
    pkgs.poetry
  ];

}

```

- Use direnv and direct it to use shell.nix with `echo use_nix > .envrc`
- Run poetry in direnv, add dependencies using poetry

``` shell

poetry init
# And then we’ll add our dependencies:
poetry add requests pillow flask

```

- Use poetry to run python program

- Create default.nix that uses poetry2nix to translate poetry lock file
  to nix installed packages

``` shell

{ pkgs ? import <nixpkgs> {} }:
pkgs.poetry2nix.mkPoetryApplication {
  projectDir = ./.;
}

```

- bin/.appname file will be a script with all dependencies and run
  program
- Can use that nix to build a docker image
- Image can be loaded locally
