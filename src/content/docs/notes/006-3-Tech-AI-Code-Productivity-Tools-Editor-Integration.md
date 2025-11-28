---
filetags: ":artificial-intelligence:ai:tools:epubnote:"
id: c64ff73a-080d-483f-90db-243c87ab0a6e
title: AI Code Editor Integration
---

## Local LLMs in Neovim: gen.nvim

Sources:

- [Local LLMs in Neovim: gen.nvim -
  YouTube](https://www.youtube.com/watch?v=FIZt7MinpMY) by David Kunz
- [GitHub - David-Kunz/gen.nvim: Neovim plugin to generate text using
  LLMs with customizable
  prompts](https://github.com/David-Kunz/gen.nvim?tab=readme-ov-file)
- [Demo of AI Assisted Coding in Neovim -
  YouTube](https://youtu.be/6MPhlqYIpJ4?list=PLfDYHelvG44BNGMqjVizsKFpJRsrmqfsJ&t=724)
  (12.04 mark with Code Rewriting and Chat)

Summary: Integrate Mistral.ai 7B model, install it locally and use with
Ollama, and how to use with Neovim extension gen.nvim created by David
Kunz

- Mistral model: Comes in text and instruct, use instruct
- Install and run Ollama
- gen.nvim will invoke Ollama from Neovim
  - Call using `:Gen`
  - Example prompts like:
    - Correct grammar and spelling
    - Summarize text
    - Make concise
    - Make list
    - Make table for markdown
    - Ask question
    - Code
      - Review code
      - Change code
  - Create new prompts as needed
    - User input as variables
    - Can replace text or not with generated output

### Usage

| Description               | Shortcut                                  |
|---------------------------|-------------------------------------------|
| Start                     | :Gen                                      |
| Chat, Follow up in window | :Gen chat                                 |
| Response, replace text    | C-Enter                                   |
| Select model              | require('gen').select<sub>model</sub>() : |

``` shell

# Run without desktop app
ollama serve
## Default model setting for gen.nvim
ollama run mistral

## Run nvim and use :Gen

```

## See Also

- [AI Code Editor Integration -
  Tabby](/garden/notes/006-3-tech-ai-code-productivity-tools-editor-integration-tabby) -
  [Tabby - Open source self hosted AI coding
  assistant](id:153091da-b5b7-4a32-bd62-c928923b2fcf)
