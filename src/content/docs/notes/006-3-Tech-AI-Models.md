---
date: 2026-03-27
filetags: ":artificial-intelligence:ai:models:epubnote:"
id: 65533479-7d6e-4726-92f8-fb66177a39c6
title: Artificial Intelligence (AI) Models
---

## Model and Use Cases

| Model Name | Use Cases | Strengths | Notes |
|----|----|----|----|
| [Codebooga](https://ollama.com/library/codebooga) | Programming | Python and JavaScript | [^1] |
| [CodeGeeX](https://ollama.com/library/codegeex4) | Programming | Cross language translation, plugins for many IDEs | [^2] |
| [Codeqwen](https://ollama.com/library/codeqwen) | Programming |  | [^3] |
| [Deepseek-R1](https://ollama.com/library/deepseek-r1) | General | Reasoning |  |
| [Dolphin-mistral](https://ollama.ai/library/dolphin-mistral) | General | Uncensored, use when other models refuse answers | [^4] |
| [DolphinMixtral](https://ollama.com/library/dolphin-mixtral) | Programming | Uncensored | [^5] |
| [Gemma2](https://ollama.com/library/gemma2) | General | 2B good for low hardware | [^6] |
| [Gemma3](https://ollama.com/library/gemma3) | General, RAG | low hardware/1 GPU, context length, multilingual, multimodal |  |
| [GPT-oss-20b](https://huggingface.co/openai/gpt-oss-20b) | General, Reasoning, Agentic | Configurable reasoning |  |
| [Granite](https://huggingface.co/ibm-granite) | General | FOSS, SLM, 4 series low to medium hardware, multi modal |  |
| [Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) | General, Agentic | Chat, agentic |  |
| [Llama3](https://ollama.com/library/llama3) | General |  | [^7] |
| [Meditron](https://ollama.com/library/meditron) | Medical | Medical questions, diagnosis, information |  |
| [Medllama2](https://ollama.com/library/medllama2) | Medical | Medical questions, trained on open source medical data | [^8] |
| [MedGemma Series](https://developers.google.com/health-ai-developer-foundations/medgemma) | Medical | Medical text and image comprehension | [^9] |
| MedImageInsight | Medical | medical image embeddings (radiology, pathology, etc.) | [^10] |
| MedImageParse | Medical | image segmentation | [^11] |
| CXRReportGen | Medical | chest X-ray report generation | [^12] |
| [Mistral](https://ollama.com/library/mistral) | General, Programming | 7B ok for low hardware | [^13] |
| [Moondream](https://ollama.com/library/moondream) | Vision | Small for edge devices |  |
| [Nemotron-mini](https://ollama.com/library/nemotron-mini) | Role-play, RAG, Function | 4b for low hardware | [^14] |
| [Phi3](https://ollama.com/library/phi3) | General, RAG | low hardware, context length |  |
| [phi-4](https://huggingface.co/microsoft/phi-4) | General | low hardware, reasoning |  |
| [Phi4-mini](https://ollama.com/library/phi4-mini) | General, RAG | low hardware, multilingual, context length |  |
| [Qwen3 series](https://github.com/QwenLM/Qwen3) | General | [Multiple models](https://huggingface.co/collections/Qwen/qwen3-67dd247413f0e2e4f653967f) depending on use |  |
| [Qwen-Image](https://huggingface.co/Qwen/Qwen-Image) | Image generation, editing | Good at text, especially Chinese |  |
| [StarCoder](https://ollama.com/library/starcoder) | Programming | Trained on 80+ languages, Small to large models | [^15] |
| [WizardCoder](https://ollama.com/library/wizardcoder) | Programming |  | [^16] |
| [Zephyr](https://ollama.com/library/zephyr) | Assistant | Trained version of Mistral and Mixtral as help assistant | [^17] |

multimodal means the model can do text and image

### Specific Models

| Model Name | Use Cases | Strengths |
|----|----|----|
| [SimulStreaming](https://github.com/ufal/SimulStreaming) (replace Whisper) | Speech to text, translation |  |
| [Voxtral-Mini-4B-Realtime-2602](https://huggingface.co/mistralai/Voxtral-Mini-4B-Realtime-2602) | Speech to text | low hardware |

### Footnotes and Sources

### Model and RAM Recommendations

| Model Size | RAM   |
|------------|-------|
| 7B         | 8 GB  |
| 13B        | 16 GB |
| 33B        | 32 GB |

From Ollama README Guidance [^18]

## Models for Programming, Computer Language Development and Use Cases

### Summary

Source: [Choosing the right model in GitHub Copilot - Microsoft Tech
Community](https://techcommunity.microsoft.com/blog/azuredevcommunityblog/choosing-the-right-model-in-github-copilot-a-practical-guide-for-developers/4491623)

#### General Development Tasks

New functions, creating tests/documentation, improving code

- GPT-4.1
- GPT-5-mini
- Claude Sonnet
- Big Pickle (OpenCode Zen)

#### Light Tasks

Quick explanations, JSON/YAML transformations, small refactors, regex
creation, short Q&A

- Claude Haiku 4.5
- MiMo V2 Omni (multi-modal)
- Nemotron 3 Super Free (text only)

#### Complex Debugging, Deep Reasoning

Analyzing code, debugging hard issues, architecture decisions,
multi-step reasoning, performance analysis

- GPT-5-MINI
- GPT-5.1
- GPT-5.2
- Claude Opus

#### Multi-step Agentic Development

Entire repository changes, migrations, creating features, multiple file
planning, automated workflows (plan \> run \> change)

- GPT-5.1-Codex-Max
- GPT-5.2-Codex
- MiMo V2 Pro

### Specific Use Cases

Source: [FY26—Advanced-GitHub-Copilot-Workshop/08-models-context/docs -
GitHub](https://github.com/haslam93/FY26---Advanced-GitHub-Copilot-Workshop/tree/main/08-models-context/docs)
with some personal notes

| Task | Recommended Model | Why |
|----|----|----|
| General completion, quick question | GPT-4o / GPT-4.1 | Free, general purpose |
| Refactoring a single file | Claude Haiku 4.5 (0.33×) | Fast, inexpensive for focused edits |
| Multi-file feature implementation | Claude Sonnet 4.6 (1×) | Follows instructions |
| Analyse 100k+ token codebase | Gemini 3.1 Pro (1×) | Large 1M context |
| Architecture design | Claude Opus 4.6 (3×) | Reasoning |
| Test generation | Claude Sonnet 4.6 (1×) | Reliable naming + Arrange/Act/Assert structure |
| SQL query generation | GPT-4o (0×) or Sonnet | Both handle SQL well; 0× for routine queries |
| Legacy code explanation | Claude Sonnet 4.6 (1×) | Superior contextual narrative explanation |
| Change, pull request summary | GPT-5 mini (0×) | Fast, accurate, free |
| Documentation | GPT-5 mini (0×) | Fast, accurate, free |

## Older Models

| Model Name | Use Cases | Strengths | Notes |
|----|----|----|----|
| [Qwen2.5-Instruct](https://huggingface.co/Qwen/Qwen2.5-7B-Instruct-1M) | General | long context tasks due to 1 million token context window |  |
| [Qwen2.5](https://ollama.com/library/qwen2.5) | General | 3b for low hardware | [^19] |
| [Qwen2](https://ollama.com/library/qwen2) | General, Programming | Chat, Small to Large models | [^20] |

## See also

- [Deepseek R1 Locally, Open-Source Ai Tools, ollama, automation,
  RAG](/garden/notes/006-3-tech-ai-models-deepseek-local-open-source-ai-tools-automation-rag) -
  [Deepseek R1 Locally, Open-Source Ai Tools, ollama, automation,
  RAG](id:4ca0b4b4-ef4e-4eeb-b4a6-7537215aca53)

### Resources

- [Ollama Models Library](https://ollama.com/library)

[^1]: [Coding LLMs Copilot
    Alternatives](https://itsfoss.com/coding-llms-copilot-alternatives/)

[^2]: [Coding LLMs Copilot
    Alternatives](https://itsfoss.com/coding-llms-copilot-alternatives/)

[^3]: [Local LLMs on Linux with
    Ollama](https://blog.machinezoo.com/Local_LLMs_on_Linux_with_Ollama)

[^4]: [Local LLMs on Linux with
    Ollama](https://blog.machinezoo.com/Local_LLMs_on_Linux_with_Ollama)

[^5]: [Coding LLMs Copilot
    Alternatives](https://itsfoss.com/coding-llms-copilot-alternatives/)

[^6]: [I Ran 9 Popular LLMs on Raspberry Pi 5; Here's What I
    Found](https://itsfoss.com/llms-for-raspberry-pi/)

[^7]: [Local LLMs on Linux with
    Ollama](https://blog.machinezoo.com/Local_LLMs_on_Linux_with_Ollama)

[^8]: [5 easy ways to run an LLM
    locally](https://www.infoworld.com/article/2338922/5-easy-ways-to-run-an-llm-locally.html)

[^9]: MedGemma supports image understanding across radiology, pathology,
    dermatology, and others. Available on [Google Vertex
    AI](https://console.cloud.google.com/vertex-ai) and [MedGemma -
    Ollama](https://ollama.com/search?q=medgemma)

[^10]: [Healthcare AI foundation models (classic) - Microsoft Foundry
    (classic) portal \| Microsoft
    Learn](https://learn.microsoft.com/en-us/azure/foundry-classic/how-to/healthcare-ai/healthcare-ai-models)

[^11]: [Healthcare AI foundation models (classic) - Microsoft Foundry
    (classic) portal \| Microsoft
    Learn](https://learn.microsoft.com/en-us/azure/foundry-classic/how-to/healthcare-ai/healthcare-ai-models)

[^12]: [Healthcare AI foundation models (classic) - Microsoft Foundry
    (classic) portal \| Microsoft
    Learn](https://learn.microsoft.com/en-us/azure/foundry-classic/how-to/healthcare-ai/healthcare-ai-models)

[^13]: [Coding LLMs Copilot
    Alternatives](https://itsfoss.com/coding-llms-copilot-alternatives/)

[^14]: [I Ran 9 Popular LLMs on Raspberry Pi 5; Here's What I
    Found](https://itsfoss.com/llms-for-raspberry-pi/)

[^15]: [Tabby ML Windows
    Install](https://tabby.tabbyml.com/docs/quick-start/installation/windows/)

[^16]: [Coding LLMs Copilot
    Alternatives](https://itsfoss.com/coding-llms-copilot-alternatives/)

[^17]: [5 easy ways to run an LLM
    locally](https://www.infoworld.com/article/2338922/5-easy-ways-to-run-an-llm-locally.html)

[^18]: [Ollama README Guidance on models and
    RAM](https://github.com/ollama/ollama/blob/main/README.md)

[^19]: [I Ran 9 Popular LLMs on Raspberry Pi 5; Here's What I
    Found](https://itsfoss.com/llms-for-raspberry-pi/)

[^20]: [Tabby ML Windows
    Install](https://tabby.tabbyml.com/docs/quick-start/installation/windows/)
