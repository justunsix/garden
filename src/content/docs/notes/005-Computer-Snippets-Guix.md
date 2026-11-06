---
date: 2026-09-16
filetags: ":snippets:epubnote:guix:gnu:nix:declarative:foss:"
id: bf5f7c8e-cf2c-4f58-a786-269e37c05bec
title: Guix Snippets
---

GNU Guix is a package manager for GNU/Linux systems. Designed to give
users more control over their general-purpose and specialized computing
environments, and make these easier to reproduce and deploy to multiple
devices.

``` shell

# Install a package
guix install emacs-guix

# Search for a package
guix search icecat

# Remote a package
guix remove emacs-guix

# List installed packages
guix package --list-installed

# List generations
guix package --list-generations

# Update guix revision and package collection
guix pull

# Upgrade packages
guix upgrade

# See current revision information
guix describe

# Install or update Guix system
sudo guix system reconfigure config.scm

# Roll back system
sudo guix system roll-back

# List generations
guix package --list-generations

# Update guix revision and package collection
guix pull

# Upgrade packages
guix upgrade

# See current revision information
guix describe

# Activate guix home configuration in a container
guix home container reconfigure config.scm

# Activate guix home configuration
guix home reconfigure config.scm

# Open shell and unset existing environment variables (--pure) with specified manifest file (-m)
guix shell --pure -m manifest.scm

# Clean up unused files
guix gc --collect-garbage

# Run specific versions with time-machine
guix time-machine --commit=v1.2.0 -- \
    environment -C --ad-hoc guide -- guile
# Get Guix 1.2.0 and runs guix environment in container called "guile"

# Isolation with --container
# Run Antigravity CLI in a Guix sandbox with access to its config and the project directories.
# https://whhone.com/posts/switching-to-gnu-guix/
agy-guix() {
    guix shell --container --network --emulate-fhs \
         --share="$PWD" \
         --share="$HOME/.gemini" \
         --share="$HOME/.local/bin" \
         --preserve='^(TERM)$' \
         coreutils nss-certs bash guix guile emacs git ripgrep fd zip unzip -- $HOME/.local/bin/agy "$@"
}

```

## Example home configuration in Guix manual

``` scheme

(use-modules (gnu home)
             (gnu home services)
             (gnu home services shells)
             (gnu services)
             (gnu packages admin)
             (guix gexp))

(home-environment
  (packages (list htop))
  (services
   (append (list
            (service home-bash-service-type
                     (home-bash-configuration
                      (guix-defaults? #t)
                      (variables
                       `(("HISTFILE" . "$XDG_CACHE_HOME/.bash_history")
                         ("HISTSIZE" . "50000")))))

            (simple-service 'test-config
                            home-xdg-configuration-files-service-type
                            (list `("test.conf"
                                    ,(plain-file "tmp-file.txt"
                                                 "the content of
                                          ~/.config/test.conf")))))
           %base-home-services)))

```

## References

- [GNU Guix Reference Manual](https://guix.gnu.org/manual/)
