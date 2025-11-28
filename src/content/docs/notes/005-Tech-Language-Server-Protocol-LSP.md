---
filetags: ":lsp:epubnote:"
id: d76a507a-1401-4cef-a7c9-0c63d0ef5f15
title: Language Server Protocol (LSP)
---

## The Five W's of LSP

Source: [LSP Explained (in 5 Minutes) -
YouTube](https://www.youtube.com/watch?v=LaS32vctfOY)

- Who: LSP created by Microsoft with RedHat
- When: Open source in 2016
- What: Language Server Protocol (LSP) is protocol used between an
  editor and a language server that provides features like auto
  complete, go to, definition, syntax highlight, mark warnings and
  errors, and refactoring
- Where: Occurs in editor, language server communicates with a client
  (the editor)
  - When an editor changes file or makes request, it sends information
    to the LSP for processing
- Why: Before LSP, editors or languages would have to custom build
  detection that LSP do today. LSP can be reused across editors

## How TypeScript is Integrated in your Editor

Source: [How TypeScript is integrated in your editor by Maria
Solano](https://gitnation.com/contents/how-typescript-is-integrated-in-your-editor)

Example code with a code action as a light bulb icon

``` javascript

function printGreeting() {
    const greeting = "Hola amigos!"; // 💡 light bulb icon from VS Code
    console.log(greeting); // manually call code action trigger <ctrl-.>
}

```

The💡light bulb means a code action is available

- Where are the code actions coming from?

  - Code actions are tied to diagnostics - something you can do to
    potentially fix errors
  - Refactors are different can be suggestions to improve code, does not
    mean code itself has a problem

- How are items added to the list that gets displayed when using code
  actions?

- How are code actions uniform across editors?

- Example code actions: refactor, fix

### Trigger

- Example triggers
  - Cursor is in a spot where a code fix or refactoring can be applied
    like the `const greeting` above
    - Activating code action:
      - Editor records position, content type (can work with embedded
        code like HTML in TS)
      - Editors will use extension that can handle the code action
        request
        - Code action integration could be a language server, linter,
          other code action providers integrated with the editor
        - Editor will present list of actions based on the providers
  - Manually triggers like using a key binding

### TSServer: The TypeScript Language Server

- Server is a node executable - encapsulates the TS compiler and
  language services and exposes them through JSON protocol

- For example protocol has set of commands TSServer supports like send
  `CompletionsRequest` and get a `CompletionsResponse` back.

- All editors can follow same protocol to provide similar editing
  experience

- TSServer does not do compilation. It is different from TSC which does
  transpilation of TS to JS. TSC does show transpilation errors, but
  only in context for transpilation, not code actions like refactoring.

### Editor and TSServer Integration

- Example: VS Code extension translates the code actions request to the
  TSServer protocol
  - Client is VS Code
  - Server is TSServer, which sends responses
    - `session.ts` on server side keeps track of session, keeps track of
      TS project and can discover project information
    - Example session handler `getApplicableRefactor`
      - Can get user preferences like formatting
      - `inlineVariable.ts` refactor
        - Does bunch of checks to ensure refactor is valid, gets
          references, checks value for replacement, if errors send
          refactor is not possible here
        - Response only includes possible refactors, not complete logic.
          Editor will get confirmation from user on whether to refactor,
          let TSServer know, and then TSServer sends all the changes
          needed
        - 2 stages:
          - Editor get: List of code actions
          - Editor do: Perform code action
            - List of edits

Example refactor using inline variable:

``` javascript

function printGreeting() {
    console.log("Hola amigos!"); // manually call code action trigger <ctrl-.>
}

```

### Bugs

Example: after a refactor, the edits could be off by 1 line

- In example, likely issue is language server since editor is just doing
  editors from the server
  - Check if bug occurs in another editor
  - Recommend file a bug with server program

Example: code actions have duplicates

- Likely an editor bug since editor is responsible for the list

Debugging:

- Can turn on TSServer logs to check request/response

### History - Has it always been like this?

- Previously TSServer's predecessor ran within the editor Visual Studio
- Later, server was moved to its own `node` process, improving IDE
  performance
  - Since it used JSON, transition to multiple processes was smooth

1.  Protocol translation

    - Protocol allows same server to communicate with anyone/software
    - TSServer was an inspiration for Language Server Protocol (LSP),
      allow reuse in multiple tools

### Why not just use LSP?

- Existing implementations may not gain many benefits
- Complex language have extension on top of LSP to provide a better
  editing experience through overrriding LSP implementations
  - Example "move to file" in TypeScript refactor asks user for input
    - LSP does not have protocol needing user input

## LSP Problems, Open Source Contributions

Source: [POV: LSP kind of sucks sometimes \| NeovimConf 2024 -
YouTube](https://www.youtube.com/watch?v=JjWNw7aOAYU)

- Maria's background: software engineer, previous Microsoft work on VS
  Code, TypeScript Visual Studio
  - Neovim core contributor: Treesitter query editor, snippet engine,
    LSP completion, Treesitter-powered hover and others

### What is Language Service Protocol (LSP)

LSP defines the protocol used between an editor/IDE and a language
server that provider language features like auto complete, go to
definition, find all references, and others.

### LSP Challenges

- It can be ambiguous
  - Example, found when dealing with snippets
  - Protocol can be vague, hard to know right behaviour from the editor
    or language server
  - Should implementations extend beyond specification? and provide more
    other functionality?
- Open collaboration on LSP?
  - Proposal on changes to protocol can be difficult
- LSP driven by VS Code
  - meta model is generated from vscode-languageserve-node
  - Implementation changes can take a long time
    - Example: change cursor position on code actions snippet workspace
      edits
- LSP can limit what editor/server can do
  - LSP implementation itself is large amount of work
  - LSP spec won't be enough for IDEs where more powerful language
    services are expected like:
    - AI suggestions
    - Advanced rename - previews, suggestions, additional strings
    - Extending it will always be required
  - Handling things outside of specification is a lot of work - like
    message types, handlers

### Considerations for LSP Challenges

- Be aware of its limitations
- Advantage is it allows all editors to have similar code editing
  features

### What can you do?

- When LSP server behaviour is odd, look up implementation and review
  the specification
- Check where issue (if it's an issue) is happening, contribute fix
- Do not spread hacks around issues with servers, follow the standard
