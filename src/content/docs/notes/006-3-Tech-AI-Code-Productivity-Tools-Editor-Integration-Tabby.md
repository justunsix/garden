---
filetags: ":artificial-intelligence:ai:tools:epubnote:"
id: 153091da-b5b7-4a32-bd62-c928923b2fcf
title: Tabby - Open source self hosted AI coding assistant
---

## About Tabby - Open source self hosted AI coding assistant

Source: <https://tabby.tabbyml.com/docs/welcome/>

- Runs locally, integration with editor
- Can choose models for different tasks
- Web server shoes stats, config,
  - Your repositories integration for LLM context for more personalized
    suggestions
  - Chat interface
  - Code browser: indexed files in tabby, ask tabby
- Strengths: Integration in IDEs like VS Code, Intellij, (n)vim,
  performance friendly

### Usage

- Set [authentication in configuration
  file](https://tabby.tabbyml.com/docs/extensions/configurations/) at
  `~/.tabby-client/agent/config.toml`
- To disable usage collection, set the
  TABBY<sub>DISABLEUSAGECOLLECTION</sub> environment variable by export
  TABBY<sub>DISABLEUSAGECOLLECTION</sub>=1.
- For Context Providers:
  - Can add local git using <file://> like
    [file://C:\Users\user\Code\repo2](file://C:\Users\user\Code\repo2)

## See Also

### Resources

- [Tabby - Documentation](https://tabby.tabbyml.com/docs/welcome/)
