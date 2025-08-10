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

```

## Markdown to HTML / Latex and HTML to Markdown with media

``` bash

# Markdown to HTML, -o output, --verbose to output conversion log
pandoc test1.md -f markdown -t html -s -o test1.html --verbose

# Markdown to LaTeX
# requires https://miktex.org/howto/portable-edition installed and running
pandoc test1.md -f markdown -t latex -s -o test1.tex

# HTML or web page to Markdown, media like images will be stored in a media folder
pandoc -f html https://mywebpage.html -o mywebpage.md --extract-media media

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
headers](https://emacs.stackexchange.com/questions/54400/export-a-docx-file-to.md-using-pandoc-but-without-the-property-drawers)
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

# Select an org file to convert, use a specific css stylesheet
pandoc -s (fzf) --css=basic-org.css --standalone -o output.html; firefox output.html
# --standalone / -s as stylesheet will go in the html output header

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

### Windows / PowerShell

``` powershell

# Get clipboard from markdown to org
Get-Clipboard -Raw | pandoc -f markdown -t org --wrap=none | clip
## -Raw and --wrap=none to workaround odd characters in conversion

# Get clipboard and convert its markdown to html
Get-Clipboard | pandoc -f markdown -t html | Set-Clipboard

# Alternate
Get-Clipboard | pandoc | Set-Clipboard -AsHtml

# Deprecated clip instead of newer Clipboard commands
# from https://docs.joshuatz.com/cheatsheets/markdown/ for more options and troubleshooting
`pandoc myfile.md | clip` -

# or
#
# Script using PowerShell to get markdown clipboard contents and paste converted to org to clipboard
$markdowncontent = get-clipboard; set-content -path input.md -value $markdowncontent
pandoc -f markdown -t org -o input.md.org -s input.md --wrap=none 
$fileContent = Get-Content -Path input.md.org; Set-Clipboard -Value $fileContent

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

### Linux / Bash

``` bash
pandoc -S file.mkd | xclip -t text/html -selection clipboard

# or
#
# Script using bash to get markdown clipboard contents and paste converted to org to clipboard
xsel -ob >input.md
pandoc -f markdown -t org -o input.md.org -s input.md --wrap=none
# Replace odd spacing and characters in org file
sed -i 's/\xc2\xa0/ /g' ./*.org
xsel --clipboard <input.md.org

```

## Converting docx with images to markdown

Pandoc puts extracted images in a `media` folder.

``` bash
pandoc --extract-media=. input.docx -o output.md

# or with multiline tables
pandoc --extract-media=. clipboard.docx -t markdown-simple_tables-multiline_tables-grid_tables --wrap=none --column=999 -o clipboard.md
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

Make sure MiKTeX (Console)'s packages are all updated before running

``` bash

# Command specifies pdf engine for pandoc to use
pandoc test1.md -s -o test1.pdf --pdf-engine=C:\Users\MyUser\scoop\apps\miktex\current\texmfs\install\miktex\bin\x64\pdflatex.exe
# --pdf-engine flag is not needed if pdflatex is already in path

```

### HTML to Markdown, Converting a web page to markdown or other formats

``` bash

pandoc -s -r html https://www.gnu.org/gnu/gnu.html -o example12.md
# the -o example12.md implies output format of -t markdown

# Convert multiple web pages to larger document
pandoc -f html https://www.gnu.org/gnu/gnu.html https://www.gnu.org/licenses/licenses.html -o aboutgnu.md
# Like above but make into simpler HTML
pandoc -f html https://www.gnu.org/gnu/gnu.html https://www.gnu.org/licenses/licenses.html -o aboutgnu.html

# Convert HTML page with media/pictures to media folder to Emacs Org format
pandoc -f html https://lazyvim-ambitious-devs.phillips.codes/course/chapter-1/ -o chapter-1.org --extract-media media

```

### Word (Docx) to markdown, including math

``` bash
pandoc -s example30.docx -t markdown -o example35.md
```

## Slide shows (Presentations in PDF, HTML, PowerPoint)

Source: [Pandoc Manual, Slide
Shows](https://pandoc.md/MANUAL.html#slide-shows)

``` shell

# Create slide show
pandoc -t FORMAT -s source.txt -o output.html
# FORMAT can be beamer (PDF slide show), s5, slidy, slideous, dzslides, or revealjs
# Create slide show and embed JS, CSS files - for slide, reveal.js S5
pandoc -t revealjs -s source.txt -o output.html --standalone

# Using a markdown source, convert to HTML and JS presentation
pandoc -t revealjs -s source.md -o presentation.html -V revealjs-url=https://unpkg.com/reveal.js@^5
# There are other -t options, see pandoc manual
# --slide-level to Override slide level with like 1, 2, 3

# Convert markdown to RevealJS presentation without transition, use white theme and local css
pandoc -t revealjs -s source.md -o presentation.html -V theme=white -V transition=none -V revealjs-url=https://unpkg.com/reveal.js@^5 --css slides.css
# Set custom stylesheet with --css

# Set revealjs configuration options using variables -V and set width and height of monitor used for presentation
pandoc -t revealjs -s source.md -o presentation.html -V theme=white -V transition=none -V revealjs-url=https://unpkg.com/reveal.js@^5 -V width=2560 -V height=1000 --css slides.css

# Create a Microsoft PowerPoint presentation, using a Emacs org-mode source
pandoc -s mydoc.org -o presentation.pptx

# Create a Microsoft PowerPoint Presentation from a template
pandoc -s mypresentation.md -o presentation.pptx --reference-doc reference.pptx
# --reference-doc - the PowerPoint template to us
# Modify the existing pandoc template by downloading the template:
# https://github.com/jgm/pandoc/blob/main/test/pptx/footer/basic/reference.pptx
# then in slide master view, make changes to the template

```

Example `source.md` for pandoc slide show presentations showing features
like: background images, slide headers, lists, pauses, and speaker notes

``` md

---
title: My Slide Show
parallaxBackgroundImage: /path/to/my/background_image.png
title-slide-attributes:
    data-background-image: /path/to/title_image.png
    data-background-size: contain
---

# Habits of John Doe March 22, 2005 Title Slide

## Slide One (alternatively, use markdown heading 1 for all slides)

Slide 1 has background_image.png as its background.

## {background-image="/path/to/special_image.jpg"}

Slide 2 has a special image for its background, even though the heading has no content.

## Slide 3 Introduction to Routines

[user.github.io/my-presents/habits](https://user.github.io/my-presents/habits)

Tips for navigating the slides in a browser

- Press O or Escape for overview mode
- [Print this presentation](?print-pdf)

## Slide 4 Getting up

- Turn off alarm
- Get out of bed
- Longer list of stuff

## Slide 5 Breakfast

- Eat eggs
- Drink coffee

---

Slide 6 content

::: notes

This is my note.

- It can contain Markdown
- like this list

:::

## Slide with a pause

content before the pause

. . .

content after the pause

## Slide with list displayed incrementally

::: incremental

- Eat spaghetti
- Drink wine

:::

## Slide with side by side columns (div containers)

:::::::::::::: {.columns}
::: {.column width="40%"}
contents...
:::
::: {.column width="60%"}
contents...
:::
::::::::::::::

```
