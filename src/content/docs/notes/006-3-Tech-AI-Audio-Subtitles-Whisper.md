---
filetags: ":artificial-intelligence:sound:subtitle:epubnote:"
id: 2ba9f6d2-10f2-4c27-b781-ee754d1423b4
title: Audio Subtitles and OpenAI Whisper
---

## Generating subtitles for a video

- If getting from YouTube or platforms support subtitles, try using
  [yt-dlp](../005-tech-yt-dlp) - [YouTube Downloader
  (yt-dlp)](id:cbdc0af2-a446-4534-a9da-286243b91f31) first like
  `yt-dlp --write-auto-sub --sub-lang en --skip-download "https://www.youtube.com/watch?v=videoid" --output subtitles.txt`

### Using OpenAI Whisper to Create Subtitles from a Video

Follow instructions from [OpenAI Whisper -
GitHub](https://github.com/openai/whisper)

Example to create English subtitles from an existing mp4 video (example
assumes python, ffmpeg, and rust tools are installed):

``` shell

mkdir subtitles
cd subtitles

python -m virtualenv ./venv
source ./venv/bin/activate

pip install -U openai-whisper

# Create audio from existing video
ffmpeg -i input_video.mp4 -q:a 0 -map a audio.wav

# Create subtitle file with audio using a model
# See Whisper documentation on which model to use and with languages
whisper audio.wav --model small --language English --output_format srt
## audio.srt file will be created

# Alternative commands using uv instead of ones above
## Set up virtual environment
uv init; uv venv
## Add package
uv add openai-whisper
## Run whisper
uv run whisper <arguments>

```

## See Also

- [Yt-dlp Snippets](../005-computer-snippets-youtube-yt-dlp) - [yt-dlp
  Snippets](id:4cc04c35-2c98-4bcf-84ef-e51148ca8e3c)
- [Video Editing](../700-arts-comms-media-video-editing) - [Video
  Editing](id:9146341a-5d8b-43f5-a5fb-b416535ec754)
