---
filetags: ":pandoc:document:conversion:snippets:epubnote:"
id: 56030404-6d4a-453b-9763-ceb5f016124b
title: Pandoc Snippets
---

## Getting Started

See Pandoc [getting started](https://pandoc.md/getting-started.html) and
[demos](https://pandoc.md/demos.html) for standard conversions for this
[inputs and outputs](https://pandoc.md/MANUAL.html#general-options) -
e.g:

``` bash
# Terminal input conversions

pandoc
Hello *pandoc*!

- one
- two

# Ctrl-D (or Ctrl-Z followed by Enter on Windows)
# ... Defaults to HTML output

# Markdown to HTML, -o output
pandoc test1.md -f markdown -t html -s -o test1.html

# Markdown to LaTeX
# requires https://miktex.org/howto/portable-edition installed and running
pandoc test1.md -f markdown -t latex -s -o test1.tex
```

## Markdown to Org

See also <span class="spurious-link"
target="Windows Clipboard">*Windows Clipboard*</span> for clipboard
markdown to org

``` bash
# How to migrate Markdown files to Emacs org mode format
# https://emacs.stackexchange.com/questions/5465/how-to-migrate-markdown-files-to-emacs-org-mode-format
find . -name \*.txt -type f -exec pandoc -f markdown -t org -o {}.org {} \;

# Convert a single GitHub flavoured markdown file to Emacs org format with pandoc
# and ignore property drawers / headings properties in markdown files
# and do not wrap based on pandoc auto column wrap
pandoc -f gfm -t org -o test.org test.md --lua-filter=remove-header-attr.lua --wrap=none

# Run in directory
find . -name \*.md -type f -exec pandoc -f markdown -t org -o {}.org {} --lua-filter=remove-header-attr.lua --wrap=none \;

# Remove all .md files in directory
find . -name \*.md -type f -delete
```

To [remove CUSTOM<sub>ID</sub> in
headers](https://emacs.stackexchange.com/questions/../54400/export-a-docx-file-to-using-pandoc-but-without-the-property-drawers)
see: - The drawers are added only if a header has additional attributes.
One can use a simple Lua filter to remove all attributes from headers in
pandoc's internal document format:

``` lua
function Header (header)
  return pandoc.Header(header.level, header.content, pandoc.Attr())
end
```

Write the above to a file named `remove-header-attr.lua` and call pandoc
with the additional parameter `--lua-filter=remove-header-attr.lua`.

## Org to Markdown, Org to HTML

``` shell

# Org to Markdown (MD)
# -s stands for standalone. It produces output with an appropriate header and footer (e.g., a set of HTML tags surrounding the body).
# input.org is your source Org file.
# -t gfm specifies the output format, in this case, GitHub Flavored Markdown
# -o output file
pandoc -s input.org -t gfm -o output.md

# With pandoc filter to change local org links in an org file to markdown links in the output file
pandoc --lua-filter="path/to/fix-org-links-to-md.lua" -s input.org org -t gfm -o output.md
## For example a link to file.org becomes file.md

# Org to HTML
pandoc -s input.org -o output.html

```

### fix-org-links-to-md.lua

``` lua

function Link(el)
  local orgfile = '.org'
  local mdfile = '.md'
  el.target = string.gsub(el.target, orgfile, mdfile)
  return el
end

```

## Org to HTML

``` shell

# Org to HTML
pandoc -s input.org -o output.html

```

## Docx to Org

``` bash

# Convert a single docx file to emacs org format
pandoc -f docx -t org -o converted.org toconvert.docx --lua-filter=remove-header-attr.lua --wrap=none

```

## Docx / Rich / ODT Text

``` shell
# Convert a docx file contents to markdown and send to Windows clipboard
pandoc -s .\clipboard.docx -t markdown | Set-Clipboard

# Convert a docx file contents to markdown and send to markdown file, extracts media/pictures to a media directory a "media" folder ../ from current directory
pandoc -s .\clipboard.docx -t markdown -o clipboard.md --extract-media=../

# or
pandoc -s .\clipboard.docx -t markdown-simple_tables-multiline_tables-grid_tables -o clipboard.md --extract-media=../
```

## Docx with Tables

``` shell
# Like above, but deal output in a table format compatible with Github flavour markdown.
# Note you have to adjust the output depending on the docx as well
pandoc .\clipboard.docx -f docx -t markdown-simple_tables-multiline_tables-grid_tables | Set-Clipboard

# Same as above but with ODT, use html to markdown to convert after
pandoc .\clipboard.odt -f odt -t markdown-simple_tables-multiline_tables-grid_tables | Set-Clipboard
```

## Clipboard to Clipboard Conversions

Pandoc supports pasting and getting a clipboard for conversions via
piping.

[Script to
convert](https://stackoverflow.com/questions/54410656/pandoc-powershell-option-to-use-to-avoid-in-place-of-the-closing-double-quot)
the raw Markdown-Plain-Text in my clipboard into pastable things that
can be used in an arbitrary browser. Example below using PowerShell and
piping to
[Set-Clipboard](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/set-clipboard?view=powershell-7.1)

``` shell

## xclip -o... : retrieve information from clipboard
## xclip -selection clipboard : data piped back to clipboard
## Convert copied html like from websites and emails to org
## wrap=none : removes wrapping of text
## sed ... : remove extra \\ added by pandoc to capture new line indictors
xclip -o -t text/html | pandoc -f html -t org --wrap=none | sed 's/\\\\//g' | xclip -selection clipboard

```

## Simple Clipboard Piping

### Windows Clipboard

``` powershell

# Get clipboard from markdown to org
## -Raw and --wrap=none to workaround odd characters in conversion
Get-Clipboard -Raw | pandoc -f markdown -t org --wrap=none | clip

# Get clipboard and convert its markdown to html
Get-Clipboard | pandoc -f markdown -t html | Set-Clipboard

# Alternate
Get-Clipboard | pandoc | Set-Clipboard -AsHtml

# Deprecated clip instead of newer Clipboard commands
# from https://docs.joshuatz.com/cheatsheets/markdown/ for more options and troubleshooting
`pandoc myfile.md | clip` -

```

[On Windows
source](https://stackoverflow.com/questions/54410656/pandoc-powershell-option-to-use-to-avoid-in-place-of-the-closing-double-quot)

### MacOS

``` bash
pbpaste | pandoc -f markdown -t html | pbcopy
```

[On
macOS](https://bendyworks.com/blog/cut-paste-rich-text-pandoc-markdown),
use `pbcopy`. On Unix, use `xclip`

### Linux

``` bash
pandoc -S file.mkd | xclip -t text/html -selection clipboard
```

## Converting docx with images to markdown

Pandoc puts extracted images in a `media` folder.

``` bash
pandoc --extract-media=. input.docx -o output.md

# or with multiline tables
pandoc --extract-media=. clipboard.docx -t markdown-simple_tables-multiline_tables-grid_tables --wrap=none --column=../999 -o clipboard
```

The `--extract-media=` option creates a media subfolder in the path
specified. If you use `--extractmedia`./media= the exported images will
be found in the ./media/media folder.
[Source](https://stackoverflow.com/questions/39956497/pandoc-convert-docx-to-markdown-with-embedded-images)

``` bash

# Command prompt, rename all files in directory with prefix, easier to reference them differently in Markdown file
cd media
for %a in (*.*) do ren "%a" "prefix - %a"
```

### Portable pandoc and MiKTeX and telling pandoc about MiKTeX

Make sure MiKTeX is running in background first

``` bash
# Command specifies pdf engine for pandoc to use
pandoc test1.md -s -o test1.pdf --pdf-engine=C:\usr\bin\PortableApps\PortableApps\miktexPortable\texmfs\install\miktex\bin\x64\pdflatex.exe
```

### Converting a web page to markdown

``` bash
pandoc -s -r html http://www.gnu.org/software/make/ -o example12.md
```

### Word (Docx) to markdown, including math

``` bash
pandoc -s example30.docx -t markdown -o example35.md
```
