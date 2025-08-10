---
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
| [Granite](https://ollama.com/library/granite3.3) | Reasoning, Instruction |  |  |
| [Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) | General, Agentic | Chat, agentic |  |
| [Llama3](https://ollama.com/library/llama3) | General |  | [^7] |
| [Meditron](https://ollama.com/library/meditron) | Medical | Medical questions, diagnosis, information |  |
| [Medllama2](https://ollama.com/library/medllama2) | Medical | Medical questions, trained on open source medical data | [^8] |
| [Mistral](https://ollama.com/library/mistral) | General, Programming | 7B ok for low hardware | [^9] |
| [Moondream](https://ollama.com/library/moondream) | Vision | Small for edge devices |  |
| [Nemotron-mini](https://ollama.com/library/nemotron-mini) | Role-play, RAG, Function | 4b for low hardware | [^10] |
| [Phi3](https://ollama.com/library/phi3) | General, RAG | low hardware, context length |  |
| [phi-4](https://huggingface.co/microsoft/phi-4) | General | low hardware, reasoning |  |
| [Phi4-mini](https://ollama.com/library/phi4-mini) | General, RAG | low hardware, multilingual, context length |  |
| [Qwen3 series](https://github.com/QwenLM/Qwen3) | General | [Multiple models](https://huggingface.co/collections/Qwen/qwen3-67dd247413f0e2e4f653967f) depending on use |  |
| [Qwen-Image](https://huggingface.co/Qwen/Qwen-Image) | Image generation, editing | Good at text, especially Chinese |  |
| [StarCoder](https://ollama.com/library/starcoder) | Programming | Trained on 80+ languages, Small to large models | [^11] |
| [WizardCoder](https://ollama.com/library/wizardcoder) | Programming |  | [^12] |
| [Zephyr](https://ollama.com/library/zephyr) | Assistant | Trained version of Mistral and Mixtral as help assistant | [^13] |

multimodal means the model can do text and image

### Model and RAM Recommendations

| Model Size | RAM   |
|------------|-------|
| 7B         | 8 GB  |
| 13B        | 16 GB |
| 33B        | 32 GB |

From Ollama README Guidance [^14]

## Footnotes and Sources

## Older Models

| Model Name | Use Cases | Strengths | Notes |
|----|----|----|----|
| [Qwen2.5-Instruct](https://huggingface.co/Qwen/Qwen2.5-7B-Instruct-1M) | General | long context tasks due to 1 million token context window |  |
| [Qwen2.5](https://ollama.com/library/qwen2.5) | General | 3b for low hardware | [^15] |
| [Qwen2](https://ollama.com/library/qwen2) | General, Programming | Chat, Small to Large models | [^16] |

## See also

- [Deepseek R1 Locally, Open-Source Ai Tools, ollama, automation,
  RAG](../006-3-tech-ai-models-deepseek-local-open-source-ai-tools-automation-rag) -
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

[^9]: [Coding LLMs Copilot
    Alternatives](https://itsfoss.com/coding-llms-copilot-alternatives/)

[^10]: [I Ran 9 Popular LLMs on Raspberry Pi 5; Here's What I
    Found](https://itsfoss.com/llms-for-raspberry-pi/)

[^11]: [Tabby ML Windows
    Install](https://tabby.tabbyml.com/docs/quick-start/installation/windows/)

[^12]: [Coding LLMs Copilot
    Alternatives](https://itsfoss.com/coding-llms-copilot-alternatives/)

[^13]: [5 easy ways to run an LLM
    locally](https://www.infoworld.com/article/2338922/5-easy-ways-to-run-an-llm-locally.html)

[^14]: [Ollama README Guidance on models and
    RAM](https://github.com/ollama/ollama/blob/main/README.md)

[^15]: [I Ran 9 Popular LLMs on Raspberry Pi 5; Here's What I
    Found](https://itsfoss.com/llms-for-raspberry-pi/)

[^16]: [Tabby ML Windows
    Install](https://tabby.tabbyml.com/docs/quick-start/installation/windows/)
