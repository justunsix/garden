---
filetags: ":vscode:tips:shortcuts:epubnote:"
id: f1eb524d-5642-4643-b031-73d629df8785
title: VS Code Shortcuts
---

## Commands

| Description             | Shortcut               |
|-------------------------|------------------------|
| Command Palette         | F1 or Ctrl + Shift + p |
| Toggle Zen Mode         | View, Toggle zen mode  |
| Split editor 1, 2       | Ctrl + 1, 2, etc.      |
| Tab, Change open editor | Ctrl + Tab             |
| Tab, Close              | Ctrl + w               |
| Markdown: Open Preview  | Ctrl + Shift + v       |

## Editing / Viewing

| Description                    | Shortcut           |
|--------------------------------|--------------------|
| Comment, Set                   | Ctrl + /           |
| Indent - line, selected region | Tab                |
| Indent - reduce indent         | Shift + Tab        |
| ord wrap, Toggle               | Alt + z            |
| Select - Box multi line        | Ctrl + Alt + Shift |
| Select - Multi line            | Ctrl + Alt         |

## Panels: Search, Chat, Extension

| Description                    | Shortcut             |
|--------------------------------|----------------------|
| Close primary left panel       | Ctrl + b             |
| Close secondary right panel    | Ctrl + Alt + b       |
| Extension, show panel          | Ctrl + Shift + x     |
| Open/Go to File Explorer       | Ctrl + Shift + e     |
| Problems/Quickfix, Toggle      | Ctrl + Shift + m     |
| Search, Clear file cache       | Clear editor history |
| Search, Find and Replace       | Ctrl + h             |
| Search, Find in current file   | Ctrl + f             |
| Search, Go to/search for files | Ctrl + p             |
| Search text in files           | Ctrl + Shift + F     |

## Jupyter Notebook

Similar to [Vim Shortcuts](/garden/notes/005-computer-shortcuts-vim) - [Vim
Shortcuts](id:bdb62bfe-56b7-4c13-a1e4-9f91cf4e0bb5)

| Description                                | Shortcut      |
|--------------------------------------------|---------------|
| Run current cell                           | Ctrl + Enter  |
| Run current cell and go to next            | Shift + Enter |
| Enter command mode from insert (edit) mode | Esc           |

### Command Mode

| Description                          | Shortcut      |
|--------------------------------------|---------------|
| Add cell above/below (command mode)  | a/b           |
| Delete code cell                     | dd            |
| Enter insert mode with cell selected | Enter         |
| Mode selected cell up or down        | Alt + arrows  |
| Select code cell above/below         | k/j or arrows |
| Switch cell type for Code            | y             |
| Switch cell type for Markdown        | m             |
| Undo last change                     | z             |

## Terminal

| Description | Shortcut |
|----|----|
| Go to Recent Directory | Ctrl + G (use Ctrl + Alt + G to send Ctrl + G to term) |
| Run Recent Command | Ctrl + Alt + G (like term Ctrl + R) |
| Open Detected Links | Ctrl + Shift + O |
| Send SIGINT | Ctrl + C, Ctrl + C (Second one used in case there is a selection activated) |
| Toggle Terminal | Ctrl + \` |

## Extensions

### PlantUML Extension

| Description | Shortcut |
|----|----|
| Diagram, Preview current diagram on side | PlantUML: Preview Current Diagram |
| Preview, see | Alt + d |

### GitHub Copilot Extension

| Description | Shortcut        |
|-------------|-----------------|
| Chat, Open  | Chat: Open Chat |

#### Chronicle (AI Chat Sessions Database)

Source: [Query session history with
chronicle](https://code.visualstudio.com/docs/agents/sessions/session-insights)

| Description | Shortcut |
|----|----|
| Index, Rebuild local index and sync to account | /chronicle:reindex |
| Report, Summarize recent sessions like files, repository | /chronicle:standup |
| Search sessions by keyword, file, PR or issue | /chronicle:search |
| Tips, Suggest ways to reduce token usage | /chronicle:cost-tips |
| Tips, Suggest ways to use Copilot more efficiently | /chronicle:tips |

## See Also

- [VS Code Tips](/garden/notes/005-tech-vs-code)
