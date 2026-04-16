---
filetags: ":snippets:epubnote:kokoro-tts:ai:artificial-intelligence:"
id: 6a1e840b-917a-404e-9e3e-f5983c5e0b4c
title: Kokoro TTS Snippets
---

Source: [nazdridoy/kokoro-tts: A CLI text-to-speech tool using the
Kokoro model, supporting multiple languages, voices (with blending), and
various input formats including EPUB books and PDF documents ·
GitHub](https://github.com/nazdridoy/kokoro-tts?tab=readme-ov-file)

``` shell

# Install using uv (recommended) and download model files
uv tool install kokoro-tts
# Download voice data (bin format is preferred)
wget https://github.com/nazdridoy/kokoro-tts/releases/download/v1.0.0/voices-v1.0.bin
# Download the model
wget https://github.com/nazdridoy/kokoro-tts/releases/download/v1.0.0/kokoro-v1.0.onnx

# Help
kokoro-tts --help
# Help, List available voices
kokoro-tts --help-voices
# Help, List supported languages
kokoro-tts --help-languages

# Do Text to Speech for input file to output
kokoro-tts <input_text_file> [<output_audio_file>] [options]
kokoro-tts input.txt output.wav --speed 1.2 --lang en-us --voice af_sarah

# Read from standard input (stdin)
echo "Hello World" | kokoro-tts - --stream
cat input.txt | kokoro-tts - output.wav

# Use voice blending (60-40 mix)
kokoro-tts input.txt output.wav --voice "af_sarah:60,am_adam:40"

# Stream audio directly
kokoro-tts input.txt --stream --speed 0.8

# Merge existing chunks
kokoro-tts --merge-chunks --split-output ./chunks/ --format wav

# Process EPUB with detailed debug output
kokoro-tts input.epub --split-output ./chunks/ --debug

# Process PDF and split into chapters
kokoro-tts input.pdf --split-output ./chunks/ --format mp3

```
