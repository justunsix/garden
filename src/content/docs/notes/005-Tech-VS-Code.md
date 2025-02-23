---
filetags: ":vs-code:vscode:ide:tool:epubnote:"
id: b91168f4-673f-4580-a248-ae4b85aa3439
title: "VS Code: Tips"
---

See VS Code's `settings.json` for other tips and options

## Extensions

``` shell

# Update all extensions
code --update-extensions

```

## Copy Paste with or without formatting

Visual Studio Code added a new setting:

``` json
// Controls whether syntax highlighting should be copied into the clipboard.
"editor.copyWithSyntaxHighlighting": true,
```

[See VS Code
settings](https://code.visualstudio.com/docs/getstarted/settings#_default-settings)

If you set that to false, then the Copy command will copy without
formatting and you can use the Copy With Syntax Highlighting command
when needed.

## Accessibility

If using VS Code with a screen reader or Windows Text to Speech. After
turning it on you will get sounds coming on text detection. You can turn
it off by turning off the screen reader detection on the bottom toolbar.

## Command Palette Useful Commands

- Toggle between Light/Dark Themes
- Commit all - git commit all in a repository
- Terminal: Run Recent Command (only supported Terminal integration
  shells)
- Terminal: Go to Recent Directory (only supported Terminal integration
  shells)
- Copy With Syntax Highlighting (see [Copy Paste with or without
  formatting](#copy-paste-with-or-without-formatting))

## Completions

- [Inline Suggestion
  Toolbar](https://code.visualstudio.com/updates/v1_75#_redesigned-inline-suggestions-toolbar):
  can be enabled to accept with `tab` and accept words with
  `Ctrl + right arrow` similar to fish shell acceptance

## Copy Paste

- Use setting `editor.copyWithSyntaxHighlighting` to control whether
  copy paste should include rich formatting like syntax highlighting.
  Default is `true`.

## Development

- Navigate Headers in Markdown, variables, functions - Use command
  `Go To Symbol` or Ctrl+P + @

## Markdown

- If `Format Document` is not working such as for tables, use command
  `Format Document with` and select Markdown all in One of appropriate
  formatter.

- [Drag and drop links, images, files into Markdown
  files](https://code.visualstudio.com/updates/v1_67#_markdown-drop-into-editor-to-create-link).
  VS Code will detect the proper content to insert into the Markdown
  file. Hold `Shift` while dragging the file over a Markdown editor to
  drop it into the editor and create a link to it.

- VS Code supports running [Find All References in Markdown files for
  headers](https://code.visualstudio.com/updates/v1_67#_markdown-find-all-references-to-headers).
  Right click on a Markdown header and find all places where the header
  is used.

- [Find all the references to a given Markdown file in the current
  workspace](https://code.visualstudio.com/updates/v1_67#_markdown-find-all-references-to-files).
  Again this includes links across files.

- o find references to the current Markdown file, use the Markdown: Find
  File References command.

- To find references to a Markdown file in the Explorer, right-click on
  it and run Find File References command.

- Run Find All References on the file part of a link to a Markdown file,
  such as [text](A-Main-Note.md).

- Support [finding all places where a given URL is
  used](https://code.visualstudio.com/updates/v1_67#_markdown-find-all-references-to-urls)
  in the current workspace.

- [Markdown: Rename
  headers](https://code.visualstudio.com/updates/v1_67#_markdown-rename-headers) -
  place your cursor on a header and then press F2 to start a rename.
  Enter the new text for the header and then press Enter to accept. This
  will both update the current header as well as updating all known
  links to it in the current workspace.

- [Markdown: rename reference
  links](https://code.visualstudio.com/updates/v1_67#_markdown-rename-reference-links)
  also supported.

- [Markdown: Rename
  files](https://code.visualstudio.com/updates/v1_67#_markdown-rename-reference-links) -
  use F2 on file paths in Markdown links to both rename the file on disk
  as well as updating all Markdown references to it:

- [Validation of
  links](https://code.visualstudio.com/updates/v1_72#_markdown-link-validation)
  is supported using setting `"markdown.validate.enabled": true.`

- Extract to link references use `Extact to link definition` command.

## Profiles

- [Profiles in Visual Studio
  Code](https://code.visualstudio.com/docs/editor/profiles) (introduced
  in [VS Code
  Profiles](https://code.visualstudio.com/updates/v1_75#_profiles)) can
  set extensions, settings, shortcuts, UI state, tasks, and user
  snippets. They can be:
- Customized
- Set in settings (gear), like for workspaces, folders
- Shared with others

## Terminal

- Terminal supports quick fixes suggestions on mis typed commands
- [Task actions in the terminal
  dropdown](https://code.visualstudio.com/updates/v1_74#_task-actions-in-the-terminal-dropdown):
  manage tasks with `run task` and `configure tasks`.
- [Terminal Accessibility
  Mode](https://code.visualstudio.com/updates/v1_75#_terminal-accessibility-mode):
  allow screen readers to navigate through terminal buffer via keyboard

## Useful Configuration

- The Command Center has been polished and is now ready to be tried.
  Enable it via `window.commandCenter` setting. The Command Center
  replaces the normal title bar and lets you quickly search for files in
  your project. Click the main section to display the Quick Open
  dropdown with your recent files and a search box.
- Toggle Autosave on files to ensure they are regularly saved

## Search

- [Include and exclude folders from
  Search](https://code.visualstudio.com/updates/v1_73#_include-and-exclude-folders-from-search) -
  When right-clicking a folder in the Search view's tree view of
  results, there are now two new options in the context menu.

## Proxy Settings

Http: Proxy (not synced): <http://1.1.1.1:3128> or set in VS Code JSON
settings

``` json

"http.proxy": "http://1.1.1.1:3128",
"http.proxyAuthorization": null,
"http.proxyStrictSSL": false,

```

## See Also

- [VS Code Shortcuts](../005-computer-shortcuts-vs-code) - [VS Code
  Shortcuts](id:f1eb524d-5642-4643-b031-73d629df8785)
- [VS Code - Local App Settings](../005-tech-vs-code-local-settings) -
  [VS Code - Local App
  Settings](id:59a60588-a161-4243-8696-1e361454067a)

Tips are taken from reading tutorials and reading [monthly
updates](https://code.visualstudio.com/updates).
