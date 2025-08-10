---
filetags: ":artificial-intelligence:ai:speech:microsoft:azure:ai900:epubnote:"
id: 25041740-3fbb-4df4-9637-a23ee364ac68
title: AI Speech and in Azure
---

Source: My personal notes and comments from course series [Introduction
to AI in
Azure](https://learn.microsoft.com/en-us/training/paths/introduction-to-ai-on-azure/),
[Get started with speech in Azure - Training \| Microsoft
Learn](https://learn.microsoft.com/en-us/training/modules/recognize-synthesize-speech/)

## Introduction

AI speech can help with management system with voice, get answers with
spoken questions to computers, and creating captions fo audio/video.

Two capabilities are required for those functions:

- Speech recognition - the ability to detect and interpret spoken input
- Speech synthesis - the ability to generate spoken output

## Speech recognition and synthesis

Speech recognition takes spoken words and converts to data to be
processed like transcribing into text. Speech patterns are analyzed in
audio to determine patterns mapped to words. Software uses multiple
models to do the work including:

> - An acoustic model that converts the audio signal into phonemes
>   (representations of specific sounds).
> - A language model that maps phonemes to words, usually using a
>   statistical algorithm that predicts the most probable sequence of
>   words based on the phonemes.

Speech synthesis vocalizes data like converting text to speech and
requires information on:

- Text to be spoken
- Voice to be used to vocalize speech

The system typically tokenizes the text and assigns phonetic sounds to
each word. The phonetic transcription is broken in prosodic units such
as phrases or sentences to create phonemes. Phonemes are converted to
audio format and settings like voice, rate, pitch and volume can be set.

## Get started with speech on Azure

Azure AI Speech has different capabilities

### Translate

- For example, English → French

Speech could be:

- Recognition - identification of speech
  - Call Transcription for example in meetings
- Synthesis
  - Creating speech
  - Create from recording like from your voice
  - Avatar + Speech

### Speech to text (STT)

The API can perform real time or batch transcription of audio into text
from microphone or audio file. The model used is optimized for
conversation and dictation. Custom models can be used for acoustics,
language, and pronunciation.

Batch transcription runs asynchronously and are schedule on best effort
basis.

### Text to Speech (TTS)

API can convert text input to audible speech through computer speaker or
written to audio file. The voice can be selected and there is ability to
personalize the speech synthesis.

Service have pre-defined voices and support of languages and regional
pronunciation. Neural voices that use neural networks can make a more
natural sounding voice with intonation.

### Azure AI Speech

Azure AI speech can be used with the Studio interface, CLI, REST APIs,
and SDKs.

A Speech Azure resource is needed or Azure AI services resource.

## See Also

- [Text to Speech (TTS) and Speech to Text
  (STT)](../004-data-processing-tech-data-science-text-to-speech-tts-speech-to-text-stt) -
  [Text to Speech (TTS) and Speech to Text
  (STT)](id:f7d86fd7-47ba-49c0-bb56-b5e7e4ee3341)
- [Introduction to AI in Microsoft Azure
  AI-900](../006-3-tech-ai-artificial-intelligence-microsoft-azure-ai900) -
  [Introduction to AI in Microsoft Azure
  AI-900](id:dd87d682-2c98-4272-acb2-eafa6ebabf78)
