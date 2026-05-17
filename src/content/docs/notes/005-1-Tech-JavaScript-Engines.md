---
filetags: ":javascript:language:epubnote:"
id: d3650aa8-72cd-405f-9a35-eda7e0609f1d
title: JavaScript Engines
---

Source: [What are JavaScript Engines? - DEV
Community](https://dev.to/jenlooper/what-are-javascript-engines-3mjl),
[JavaScript engine -
Wikipedia](https://en.wikipedia.org/wiki/JavaScript_engine)

## What are JavaScript Engines

- JavaScript engine is like a virtual machine (VM)
  - Virtual machine is software the emulates a computer system
    - System virtual machine:
      - Examples: Parallels on Mac to run Windows, VirtualBox to run
        operating systems on Windows, Mac, Linux
    - Process virtual machine: runs one program/process
      - Examples: Wine that runs Windows applications on a Linux
        computer, but does not provide all functionality of a Windows
        operating system
- JavaScript (JS) engine is a kind of process virtual machine to
  interpret and execute JavaScript code
  - In summary, the JavaScript engine takes JavaScript code written by a
    developer and converts it to optimized code that can be run fast and
    interpreted by a browser or inside an application
- Each JavaScript engine implements a version of ECMAScript. JavaScript
  is a dialect of ECMAScript. ECMAScript engine is another name for the
  implementations.
  - Each engine is design to work with a different web browser (examples
    like regular or headless Chrome, Firefox) or runtime like Node.js
  - Example engines:
    - WebKit's JavaScriptCore which has 6 building blocks that analyze,
      interpret, optimize, and garbage collect JavaScript code
    - Google's V8 engine

## How do Engines Work

- Different engines do code processing differently
- Example: JavaScriptCore
  - Lexical analysis: source is broken into tokens or strings
  - Tokens are analyzed by parser for syntax and built into a syntax
    tree
  - 4 Just in Time (JIT) processes start: "JavaScript engine takes your
    source code, breaks it up into strings (a.k.a. lexes it), takes
    those strings and converts them into bytecode that a compiler can
    understand, and then executes it."
- The machine code made in the compilation process allows to engine to
  expose data types, operators, objects, and functions to the browser or
  runtime (example Node.js, Deno, Electron)

## Runtimes and Engines

- Popular runtimes work on top of JavaScript engines and extend the
  engine's power
  - Examples: Node.js, Deno, Bun
    - Node.js and Deno embed V8
    - Bun embeds JavaScriptCore
- Runtimes are built to solve challenges with JavaScript's single thread
  architecture and look to improve performance of the engines that it
  uses
  - For example, Node prioritizes asynchronous, threadless execution of
    routines

| Browser, Runtime, Other | JavaScript Engine |
|-------------------------|-------------------|
| Mozilla                 | Spidermonkey      |
| GNOME Shell extensions  | Spidermonkey      |
| Chrome                  | V8                |
| IE                      | Chakra            |
| Safari                  | JavaScriptCore    |
| Node.js                 | V8                |
| Deno                    | V8                |
| Bun                     | JavaScriptCore    |
| Edge                    | Blink and V8      |

## How to apply Knowledge of Engines

- Goal of JavaScript engines creating the most fast execution in the
  shortest time
- Developers need to be aware of:
  - Differences in browsers and code performance
  - Limits and possibilities given engines and devices and effects on
    user experience
