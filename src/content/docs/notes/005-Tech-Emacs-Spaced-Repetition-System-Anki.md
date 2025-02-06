---
description: How to use Emacs to create and manage cards for Anki
filetags: ":anki:srs:emacs:learning:epubnote:"
id: 343b3f91-0b53-450e-a8a9-4286bd619535
title: Emacs Spaced Repetition System with Anki
---

## From Article Above: Power up Anki with Emacs, Org mode, anki-editor and more

### Org-mode as Editor to Anki

- Notes are org entries with property `ANKI_NOTE_TYPE`
- Headings under the entry is a `field` in Anki
- Tags can be synchronized with Anki
- The Emacs package anki-editor using the property value `ANKI_NOTE_ID`
  to synchronize org entries and the corresponding notes in Anki
- To style cards correctly in Anki exported from org mode, in Anki, use
  css like [GitHub - gongzhitaao/orgcss: Simple and clean CSS for
  Org-exported HTML](https://github.com/gongzhitaao.mdcss) and paste the
  css into the Anki app to style all cards

### Set up Anki for Emacs

- Use my Emacs dotfiles to get set up in Emacs
- Open Anki
  - [Install anki-connect per
    instructions](https://git.foosoft.net/alex/anki-connect)
- Restart Anki
- anki-connect should now be running
- Use `anki-editor-insert-note` to create a new card. Prefer the "3. All
  Purpose Card" note type
- For my examples, see [Anki Master Deck for
  Learning](370-Education-Learning-Anki-Master-Deck.md) - [Anki Master
  Deck for Learning](id:0f365634-db06-451f-a0ca-3699615538a1)
- For better formatting inside Anki, do:
  - Select a deck –\> Browse –\> Cards (top right) –\> Styling
  - Paste in contents of
    [https://gongzhitaao.org/orgcss/org.css](https://gongzhitaao.md.mdcss.md.css)

## See Also

- [Anki Master Deck for
  Learning](370-Education-Learning-Anki-Master-Deck.md) - [Anki Master
  Deck for Learning](id:0f365634-db06-451f-a0ca-3699615538a1)

### Resources

- [Power up Anki with Emacs, Org mode, anki-editor and
  more](https://yiufung.net/post/anki.md/) - how to use Emacs package
  anki-editor to create and manage cards and export them to Anki for use
- [GitHub - louietan/anki-editor: Emacs minor mode for making Anki cards
  with Org](https://github.com/louietan/anki-editor)
