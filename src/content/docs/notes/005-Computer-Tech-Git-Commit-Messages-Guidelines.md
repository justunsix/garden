---
filetags: ":git:commit:guideline:epubnote:"
id: 93c91cfe-c450-4d39-94b3-1984ddbc6581
title: Git Commit Messages Guidelines
---

Source: [Conventional Commits - Specification for human and machine
readable commit messages](https://www.conventionalcommits.org/)

## Use Case of using Conventional Commits

Since commit messages are structured, they can be used for:

- Automatically creating CHANGELOGs.
- Automatically determining a semantic version changes based on the
  types of commits landed
- Communicating changes to others
- Triggering build and release processes
- Make it easier for people to contribute and understand changes so they
  can explore a structured commit history

## Summary

### Commit Message Structure

\<type\>\[optional scope\]: \<description\>

\[optional body\]

\[optional footer(s)\]

1.  Examples

    1.  Example 1

        feat: allow provided config object to extend other configs

        BREAKING CHANGE: \`extends\` key in config file is now used for
        extending other config files

        Signed-off-by: Alice \<alice@example.com\> Signed-off-by: Bob
        \<bob@example.com\>

    2.  Example 2

        fix: prevent racing of requests

        Introduce a request id and a reference to latest request.
        Dismiss incoming responses other than from latest request.

        Remove timeouts which were used to mitigate the racing issue but
        are obsolete now.

        Reviewed-by: Z Refs: \#123

2.  Footer

    - Footer may use [git
      trailers](https://git-scm.com/docs/git-interpret-trailers)

### Commit types

- fix: a commit of the type fix patches a bug in your codebase. PATCH in
  Semantic Versioning).
- feat: a commit of the type feat introduces a new feature to the
  codebase. MINOR in Semantic Versioning).
- BREAKING CHANGE: in commit footer or add a `!` after the type/scope, a
  breaking change to program. MAJOR in semantic versioning
  - Example: feat(api)!: send an email to the customer when a product is
    shipped BREAKING CHANGE: \`extends\` key in config file is now used
    for extending other config files
- List of types from Angular contributing guidelines:
  - build: Changes that affect the build system or external dependencies
    (example scopes: gulp, broccoli, npm), bump versions
  - ci: Changes to our CI configuration files and scripts (examples:
    Github Actions, SauceLabs)
  - chore: minor version updates
  - docs: Documentation only changes
  - **feat**: A new feature
  - **fix**: A bug fix
  - perf: A code change that improves performance
  - refactor: A code change that neither fixes a bug nor adds a feature
  - test: Adding missing tests or correcting existing tests

## See Also

### Resources

- [Angular Contributing Guidelines, see Commit Message
  Format](https://github.com/angular/angular/blob/main/CONTRIBUTING.md)
