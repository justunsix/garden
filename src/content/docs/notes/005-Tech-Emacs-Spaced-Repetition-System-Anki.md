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

Source: [GitHub - anki-editor/anki-editor: Emacs minor mode for making
Anki cards with Org Mode](https://github.com/anki-editor/anki-editor)
forked from original package at [GitHub -
louietan/anki-editor](https://github.com/louietan/anki-editor)

- Use instructions on anki-editor README, for Emacs configuration use
  [my dotfiles](https://github.com/justunsix/dotfiles) to get set up in
  Emacs

- Open Anki

  - [Install anki-connect per
    instructions](https://git.foosoft.net/alex/anki-connect). High level
    steps as follows:
    - Open Anki
    - Go to Tools \> Add Ons \> Get Add-ons
    - Input 2055492159 in the box labeled `Code` and press `OK`
    - Restart Anki

- anki-connect should now be running after the restart

- Keep Anki running for Emacs to talk to anki-connect

- Use `anki-editor-insert-note` to create a new card. Can use basic card
  type or my "3. All Purpose Card" note type

  - For my examples, see [Anki Master Deck for
    Learning](../370-education-learning-anki-master-deck) - [Anki Master
    Deck for Learning](id:0f365634-db06-451f-a0ca-3699615538a1)

- After making changes to existing notes or creating new ones, push
  changes to anki with `anki-editor-push-notes`

- For better formatting inside Anki, do:

  - Select a deck –\> Browse –\> Cards (top right) –\> Styling
  - Paste in contents of
    [https://gongzhitaao.org/orgcss/org.css](https://gongzhitaao.md.mdcss.md.css)

## See Also

- [Anki Master Deck for
  Learning](../370-education-learning-anki-master-deck) - [Anki Master
  Deck for Learning](id:0f365634-db06-451f-a0ca-3699615538a1)

### Resources

- [Power up Anki with Emacs, Org mode, anki-editor and
  more](https://yiufung.net/post/anki.org/) - how to use Emacs package
  anki-editor to create and manage cards and export them to Anki for use
