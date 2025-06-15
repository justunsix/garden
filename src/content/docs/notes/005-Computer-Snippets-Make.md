---
filetags: ":make:snippets:epubnote:"
id: 55fa5347-938b-43d8-9c98-3d1a8d28595d
title: Make Snippets
---

From [How to create a self-documenting Makefile \|
victoria.dev](https://victoria.dev/blog/how-to-create-a-self-documenting-makefile/)

``` makefile

SHELL := /bin/bash

.PHONY: help
help: ## Show this help
@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

save-dconf: ## Save dconf settings to .config/dconf/settings.dconf
dconf dump /org/gnome/ > .config/dconf/settings.dconf

save-vsce: ## Save a list of VSC extensions to .config/Code/extensions.txt
ls ~/.vscode/extensions/ > .config/Code/extensions.txt

save: save-dconf save-vsce ## Update dconf and vsc extensions files

update: ## Do apt upgrade and autoremove
sudo apt update && sudo apt upgrade -y
sudo apt autoremove -y

## Make all changes in one shell session
.ONESHELL:
pandoc-markdown-to-org: ## markdown to org
  cd lc/scripts/pandoc
  find . -name \*.md -type f -exec pandoc -f markdown -t org -o {}.org {} --lua-filter=remove-header-attr.lua --wrap=none \;
  sed -i 's/\xc2\xa0/ /g' *.org

## If you have subdirectories with their own Makefiles, you can use recursive make invocations.
##    Create a top-level Makefile that calls make in each subdirectory:
all:
  $(MAKE) -C subdir1
  $(MAKE) -C subdir2
  $(MAKE) -C subdir3

```

``` shell

# Run make in a different working directory
make -C /path/to/working/directory

```

## Check Makefile syntax

Per:
<https://stackoverflow.com/questions/16931770/makefile4-missing-separator-stop>

Make defines a [tab is required to start each
recipe](https://www.gnu.md/software/make/manual/make.html#Rule-Introduction).
All actions of every rule are identified by tabs. If you prefer to
prefix your recipes with a character other than tab, you can set the
.RECIPEPREFIX variable to an alternate character.

``` shell

# To check, the command:
# -e shows non-printing characters
# -t shows tabs
# -v shows lines
cat -e -t -v makefile_name
cat -e -t -v Makefile

```

- It shows the presence of tabs with <sup>I</sup> and line endings with
  \$.
- Both are vital to ensure that dependencies end properly and tabs mark
  the action for the rules so that they are easily identifiable to the
  make utility.

Example:

``` shell

cat -e -t -v  mk.t
all:ll$      ## here the $ is end of line ...
$
ll:ll.c   $
^Igcc  -c  -Wall -Werror -02 c.c ll.c  -o  ll  $@  $<$
## the ^I above means a tab was there before the action part, so this line is ok .
 $
clean :$
   \rm -fr ll$
## see here there is no ^I which means , tab is not present ....
## in this case you need to open the file again and edit/ensure a tab
## starts the action part

```

## See Also

### Resources

- [Managing Projects with GNU Make, Third
  Edition](https://www.oreilly.com/openbook/make3/book/index.csp) - in
  particular chapter 7: Portable Makefiles
- [Victoria Drake's Dotfiles with
  Makefile](https://github.com/victoriadrake/dotfiles/tree/master)
