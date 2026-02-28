---
filetags: ":snippets:epubnote:editorconfig:editor:"
id: 0f1c1552-c742-412f-8008-ae602020e576
title: Editorconfig Snippets
---

``` txt

# For all lua files, use spaces for indentation with 2 space as indent
[*.lua]
indent_style = space
indent_size = 2

[*.sh]
indent_style = space
indent_size = 2

# Exclude Makefiles
# Override: Disable rules for Makefile due to tab required for recipes
[Makefile]
indent_style = unset
indent_size = unset
end_of_line = unset
charset = unset
trim_trailing_whitespace = unset
insert_final_newline = unset

```

## See Also
