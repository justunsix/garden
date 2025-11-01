---
filetags: ":emacs:emacs-evil:doom-emacs:epubnote:"
id: 53e11158-909c-4d77-a705-d12a0077d1e0
title: Emacs Shortcuts for Evil and Doom Emacs
---

## Evil

See [Evil key bindings map - Evil Emacs
package](https://github.com/emacs-evil/evil/blob/master/evil-maps.el)

| Name | Shortcut |
|----|----|
| Complete (autocomplete) next or previous (insert mode) | C-n or C-p |
| Digraph: insert | :evil-insert-digraph |
| Digraphs, show digraphs to sequences | :evil-ex-show-digraphs |
| Enter and Exit Emacs Mode (close to default Emacs) | C-z |
| Go to char using Avy | g s s (char), g s / (timer) |
| Go, to lower case (evil-downcase), downcase selection | g u , u |
| Go, to upper case (evil-upcase), upcase selection | g U , U |
| Go, to file under cursor at point | g f |
| Go, to file under cursor at point, with line | g F, evil-find-file-at-point-with-line |
| Navigation, previous/next paragraph/section | {, } |
| Navigation, previous/next sentence | (, ) |
| Record macro (command mode) | q + \<register like a\> |
| Replace macro | F4 |
| Window move up, down, left, right | C-w + arrow keys |

See [Vim Shortcuts](../005-computer-shortcuts-vim) - [Vim
Shortcuts](id:bdb62bfe-56b7-4c13-a1e4-9f91cf4e0bb5) which are mostly
implemented in Evil and for explanation of terms.

For "Go, to file under cursor at point, with line", an example is using
`gF` on text like myfile.txt:42 where 42 is the line number to go to

## Doom Emacs

See main key bindings at:
"~/.config/emacs/modules/config/default/+evil-bindings.el" or [Evil
Bindings - Doom
Emacs](https://github.com/doomemacs/doomemacs/blob/master/modules/config/default/+evil-bindings.el)

and "~/.config/emacs/modules/config/default/+emacs-bindings.el" [Emacs
Bindings - Doom
Emacs](https://github.com/doomemacs/doomemacs/blob/master/modules/config/default/%2Bemacs-bindings.el)

| Name | Shortcut |
|----|----|
| Back, error | \[ e |
| Back, section | \[\[ |
| Bookmarks | SPC Enter |
| Browse url of file, open in browser | SPC o b |
| Buffer, delete buffer | SPC b d |
| Buffer, open scratch buffer | SPC x |
| Code actions, Jump to definition | SPC c d |
| Code actions, Jump to reference | SPC c D |
| Code actions / LSP | SPC c a |
| Code actions, quickfix, list errors, problems, flycheck | SPC c x |
| Command, M-x | SPC : |
| Completion, cape, dictionary | C-x s |
| Completion, dabbrev | C-x C-n |
| Completion, file | C-x C-f |
| Completion, go down 1 choice | C-j |
| Completion, go up 1 choice | C-k |
| Completion, keyword | C-x C-k |
| Completion, snippet | C-x C-s |
| Dired, down directory or open file | l |
| Dired, edit with wdired | i |
| Dired, edit with wdired, save changes | :w or C-c |
| Dired, open marked files with external program | W, dired-do-open |
| Dired, up directory | h |
| Documentation, Look up or Web search on selection | K |
| eww, back URL | H or \[\[ |
| eww, bookmark | m |
| eww, bookmark add | m |
| eww, download | d |
| eww, eww-readable, see readable part of web page | r |
| eww, forward URL | L or \]\] |
| eww, go to bookmark | gb |
| eww, go to bookmark, quit | q |
| eww, jump to visible link | SPC s l |
| eww, list eww buffers | gt |
| eww, open URL | o |
| eww, quit | q |
| eww, URL, copy current URL | yy |
| eww, Z menu: text decrease, increase | zj, zk |
| Exit insert mode | Esc or jk |
| Format, region or buffer | +format/region or +format/buffer |
| Go to, Avy : go to char2 | g s s |
| Go to, Avy : go to timer | g s / |
| Go to, element Declaration | g D |
| Go to, element definition | g d |
| Go to, element Implementation | g I |
| Go to file or url at point | g f |
| Help: Doom, Doom Modules | SPC h d m |
| Insert, Evil Register | SPC i r |
| Insert, Snippet | SPC i s |
| Leader key while in insert mode | M-SPC |
| LSP, Restart workspace and server | lsp-workspace-restart |
| LSP, Update all servers installed | lsp-update-servers |
| Magit | SPC g g |
| Next buffer | C-x right arrow |
| Next, error | \] e |
| Next, section | \]\] |
| Org: Insert subheading (org-insert-subheading) | C-m Enter |
| Org: Link insert (org-insert-link) | SPC m l l |
| Org: Link store (org-store-link) | SPC n l |
| Project: Search | SPC / |
| Project - switch and open new workspace | SPC p p |
| Search - 2 char, next match or go into avy | ; or C-; |
| Search - 2 char, normal mode | s |
| Search - buffer | SPC s s |
| Search - imenu | SPC s i |
| Search - jump list | SPC s j |
| Spelling, suggest correct spelling of word | z =, ispell-word |
| Switch Buffer | SPC , |
| Tags: projectile find tag | C-t |
| Toggle: line numbers: absolute, relative, none | SPC t l or doom/toggle-line-numbers |
| Workspace (tab): Select workspace number | M-\<number\> like M-1 |
| Workspace (tab): Close | SPC tab d |
| Workspace (tab): Close session, work spaces, buffers | SPC tab x |
| Workspace (tab): List tabs | SPC Tab Tab |
| Workspace (tab): New | C-t |
| Workspace (tab): Next | gt |
| Z menu for folding, screen movement | z |
| Z menu: kill current buffer | zx |
| Z menu: org-mode toggle inline images | zi |

For completions, shortcuts are implemented similarly to completion
section of [Vim Shortcuts](../005-computer-shortcuts-vim) - [Vim
Shortcuts](id:bdb62bfe-56b7-4c13-a1e4-9f91cf4e0bb5) and complete the
same kind of items.

### Item Navigation with \[ and \] (Unimpaired Mode)

| Description               | Shortcut               |
|---------------------------|------------------------|
| Next, previous item       | \[ \<item\>\] \<item\> |
| Buffer                    | \[b, \]b               |
| Function                  | \[f, \]f               |
| Spelling: misspelled word | \[s, \]s               |

### Command Mode

| Name | Shortcut |
|----|----|
| GBrowse, Opens local file in browser in upstream like GitHub/Lab for local file | :gbrowse |
