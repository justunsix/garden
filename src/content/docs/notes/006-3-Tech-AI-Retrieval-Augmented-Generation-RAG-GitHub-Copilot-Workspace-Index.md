---
filetags: ":ai:artificial-intelligence:rag:github:copilot:vscode:epubnote:"
id: 1ae880da-6df5-4bcb-9463-27955b9f1654
title: GitHub Copilot Workspace Index and Retrieval Augmented Generation
  (RAG)
---

Source: [Make chat an expert in your workspace - Visual Studio Code
Documentation](https://code.visualstudio.com/docs/copilot/reference/workspace-context)

GitHub copilot chat can use an index of the set of files you are working
with to provide answers.

## Search strategy

Once the index for the work space's files are created, these are
suggested strategies when searching for information:

- Determine information needed for answers like past chat history, file
  structure, current selections
- Search using:
  - Code search engine using index
  - Local semantic search based on meaning for question and keywords
  - File name and content search (grep)

  <!-- -->

  - Search on language details like function signatures, parameters,
    symbols, structure
- Narrow results if too large and include only most relevant content in
  context for prompt

## Workspace Chat in VS Code

Source: [Make chat an expert in your
workspace](https://code.visualstudio.com/docs/copilot/reference/workspace-context)

In VS Code chat prompts can use `#codebase` (chat tool) keyword to
provide prompt context and start/update indexes. It will adjust
automatically according to the size of the project and resources. The
`@workspace` (chat participant) keyword can also be used as a subject
matter expert on the the work space, but `#codebase` tool is recommended
because it allows the language model handling the prompt to execute the
tool multiple times and other tools if needed.

All files are indexed except ignored ones like `.gitignore` specified
files. File/code, structure like directory and language structure and
editor selection and open file is used in context.

### Workspace Context in Chat

Workspace context use depends on:

- Agent/plan - agentic codebase search and may have more targeted
  searches
- Ask - ask may determine intent requires codebase context and use it or
  explicitly use the `#codebase` tool
- Edit - similar to ask and after intent detection, relevant code
  snippets will be added in chat context

## See Also

- [Retrieval Augmented Generation
  (RAG)](/garden/notes/006-3-tech-ai-retrieval-augmented-generation-rag)
