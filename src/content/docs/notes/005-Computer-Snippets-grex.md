---
filetags: ":snippets:epubnote:grex:regex:rust:"
id: 4bb2d854-a1f0-44c8-8bfe-f3de31658ab2
title: grex Snippets
---

``` shell

# Generate a simple `regex to match exact strings
grex space_separated_strings

# Generate a case-insensitive `regex`:
grex [-i|--ignore-case] space_separated_strings

# Replacements - good for more generic matches given specific test cases
# Replace digits with '\d'
grex [-d|--digits] space_separated_strings
# Replace Unicode word character with '\w':
grex [-w|--words] space_separated_strings
# Replace spaces with '\s':
grex [-s|--spaces] space_separated_strings

# Add {min, max} quantifier representation for repeating sub-strings
grex [-r|--repetitions] space_separated_strings

```

## See Also

### Resources

- [GitHub - pemistahl/grex: A command-line tool and Rust library with
  Python bindings for generating regular expressions from user-provided
  test cases](https://github.com/pemistahl/grex)
