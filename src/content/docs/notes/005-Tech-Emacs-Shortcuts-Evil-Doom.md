---
filetags: ":emacs:emacs-evil:doom-emacs:epubnote:"
id: 53e11158-909c-4d77-a705-d12a0077d1e0
title: Emacs Shortcuts for Evil and Doom Emacs
---

## Evil

See [Evil key bindings map - Evil Emacs
package](https://github.com/emacs-evil/evil/blob/master/evil-maps.el)

| Name                                                         | Shortcut                    |
|--------------------------------------------------------------|-----------------------------|
| Record macro (command mode)                                  | q + \<register like a\>     |
| Replace macro                                                | F4                          |
| Enter and Exit Emacs Mode (close to default Emacs)           | C-z                         |
| Window move up, down, left, right                            | C-w + arrow keys            |
| Complete (autocomplete) next or previous (insert mode)       | C-n or C-p                  |
| Go to char using Avy                                         | g s s (char), g s / (timer) |
| To lower case (downcase), upper case (upcase) with selection | u, U                        |

## Doom Emacs

See main key bindings at:
"~/.config/emacs/modules/config/default/+evil-bindings.el" or [Evil
Bindings - Doom
Emacs](https://github.com/doomemacs/doomemacs/blob/master/modules/config/default/+evil-bindings.el)

and "~/.config/emacs/modules/config/default/+emacs-bindings.el" [Emacs
Bindings - Doom
Emacs](https://github.com/doomemacs/doomemacs/blob/master/modules/config/default/%2Bemacs-bindings.el)

| Name                                             | Shortcut                            |
|--------------------------------------------------|-------------------------------------|
| Autocompletion, cape, dictionary                 | C-x s                               |
| Autocompletion, dabbrev                          | C-x C-n                             |
| Autocompletion, file                             | C-x C-f                             |
| Autocompletion, keyword                          | C-x C-k                             |
| Autocompletion, snippet                          | C-x C-s                             |
| Bookmarks                                        | SPC Enter                           |
| Browse url of file, open in browser              | SPC o b                             |
| Buffer, delete buffer                            | SPC b d                             |
| Buffer, open scratch buffer                      | SPC x                               |
| Code actions / LSP                               | SPC c a                             |
| Code actions, list errors, problems              | SPC c x                             |
| Command, M-x                                     | SPC :                               |
| Completion, go down 1 choice                     | C-j                                 |
| Completion, go up 1 choice                       | C-k                                 |
| Dired, down directory or open file               | l                                   |
| Dired, up directory                              | h                                   |
| Exit insert mode                                 | Esc or jk                           |
| Go to file or url                                | g f                                 |
| Go to, Avy : go to char2                         | g s s                               |
| Go to, Avy : go to timer                         | g s /                               |
| Go to, element Declaration                       | g D                                 |
| Go to, element Implementation                    | g I                                 |
| Go to, element definition                        | g d                                 |
| Help: Doom, Doom Modules                         | SPC h d m                           |
| Leader key while in insert mode                  | M-SPC                               |
| Magit                                            | SPC g g                             |
| Next buffer                                      | C-x right arrow                     |
| Next, section                                    | \]\]                                |
| Next, error                                      | \] e                                |
| Back, section                                    | \[\[                                |
| Back, error                                      | \[ e                                |
| Org: insert subheading                           | C-m Enter                           |
| Project - switch and open new workspace          | SPC p p                             |
| Project: Search                                  | SPC /                               |
| Search - 2 char, next match or go into avy       | ; or C-;                            |
| Search - 2 char, normal mode                     | s                                   |
| Search - buffer                                  | SPC s s                             |
| Search - imenu                                   | SPC s i                             |
| Search - jump list                               | SPC s j                             |
| Switch Buffer                                    | SPC ,                               |
| Tags: projectile find tag                        | C-t                                 |
| Toggle: line numbers: absolute, relative, none   | SPC t l or doom/toggle-line-numbers |
| Workspace (tab): Close                           | SPC tab d                           |
| Workspace (tab): List tabs                       | SPC Tab Tab                         |
| Workspace (tab): New                             | C-t                                 |
| Workspace (tab): Next                            | gt                                  |
| Z menu for folding, screen movement              | z                                   |
| Z menu: kill current buffer                      | zx                                  |
| Z menu: org-mode toggle inline images            | zi                                  |
| eww, back URL                                    | H or \[\[                           |
| eww, bookmark add                                | m                                   |
| eww, download                                    | d                                   |
| eww, eww-readable, see readable part of web page | r                                   |
| eww, forward URL                                 | L or \]\]                           |
| eww, jump to visible link                        | SPC s l                             |
| eww, list eww buffers                            | gt                                  |
| eww, open URL                                    | o                                   |
| eww, quit                                        | q                                   |

### Command Mode

| Name                                                                            | Shortcut |
|---------------------------------------------------------------------------------|----------|
| GBrowse, Opens local file in browser in upstream like GitHub/Lab for local file | :gbrowse |
