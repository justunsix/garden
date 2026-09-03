---
date: 2026-09-02
filetags: ":snippets:epubnote:devenvdevops:environment:nix:"
id: a6f31ac1-d323-4a39-9a8e-0a20528254fd
title: devenv Snippets
---

``` shell

# Initialize the environment, for example create project files
devenv init

# Enter environment
devenv shell
# Enter the Development Environment with relaxed hermeticity (state of being airtight)
devenv shell --impure

# Get detailed information about the current environment
devenv info --verbose

# Start processes with `devenv`
devenv up --config path/to/file

# Clean the environment variables and re-enter the shell in offline mode
devenv --clean --offline

# Delete the previous shell generations
devenv gc

# Generate an OCI container from your development environment
devenv container build <name>
# Build OCI shell container, equivalent container to the shell environment
devenv container build shell
# Build OCI shell container, equivalent container to the process, services in environment
devenv container build process
# Run container using Docker
devenv container run <name>
# Run container with podman directly
podman run <name>

```

## References

- [Your whole development environment, declared. \|
  devenv](https://devenv.sh/)
