---
filetags: ":helix:snippets:epubnote:"
id: 0ad986a2-9bec-4d2c-8687-f91af216c662
title: Helix Editor Snippets
---

``` shell

# Check LSP, formatters, etc
hx --health

# Check for a specific language
hx --health rust

# Fetch and build grammars
hx -g fetch; hx -g build
# Optionally delete runtime folder to refresh runtimes
# or syntax highlighting issues before grammar updates
rm -rf ~/.config/helix/runtime

```
