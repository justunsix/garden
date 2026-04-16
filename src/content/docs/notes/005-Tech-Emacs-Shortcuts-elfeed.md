---
filetags: ":emacs:shortcuts:elfeed:epubnote:"
id: 54b690fd-eac4-4934-8a30-97388d72e99f
title: Emacs Shortcuts for elfeed
---

| Description                                   | Shortcut                   |
|-----------------------------------------------|----------------------------|
| Hook up elfeed to read elfeed.org on run      | elfeed-org                 |
| Open all feeds with default filter            | elfeed                     |
| Update all feed                               | elfeed-update              |
| View elfeed log, useful for connection issues | elfeed-goodies/toggle-logs |

## Examples Filters

All items up to 3 weeks ago, remove items tagged with news: @3-weeks-ago
-news

Unread items from 6 weeks ago: @6-weeks-ago +unread

Items tagged with youtube: @6-weeks-ago youtube

## evil-collection-elfeed

| Description                               | Shortcut                     |
|-------------------------------------------|------------------------------|
| Feeds, update all                         | g R or elfeed-search-fetch   |
| Feed, post, visit link                    | g o                          |
| Feed, post, copy link                     | g c                          |
| Feed, post, next, previous item           | gk, gj, or double\[ double\] |
| Feed, post, open                          | Enter                        |
| Feed, post, open in browser               | Enter                        |
| Filter, clear                             | c                            |
| Filter, Set like @3-week-ago feed name    | S                            |
| Filter, Live filter                       | s                            |
| Mark, read / unread, works with selection | u / U                        |
| Quit, buffer                              | q or elfeed-kill-buffer      |

## elfeed-tube

| Description                                   | Shortcut              |
|-----------------------------------------------|-----------------------|
| Video, view (any video, can be outside feeds) | elfeed-tube-fetch     |
| Find feed from channel, playlist, other       | elfeed-tube-add-feeds |
| Video, chapters                               | M-x imenu             |

For `elfeed-tube-add-feeds`, you can also manually inspect the HTML page
for the video/list and find the text like
`https://www.youtube.com/feeds/videos.xml?channel_id=UC9H0HzpKf5JlazkADWnW1Jw`
which was taken from [bashbunni YouTube channel page
source](https://www.youtube.com/@bashbunni/videos)
