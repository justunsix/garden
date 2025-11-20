---
filetags: ":yt-dlp:youtube:downloader:epubnote:"
id: cbdc0af2-a446-4534-a9da-286243b91f31
title: YouTube Downloader (yt-dlp)
---

youtube-dl fork with additional features and fixes

## About

Downloads videos from command line. Some features:

- YouTube:
  - Can block sponsor sections of videos
  - Feeds, stories, mixes, channels, albums
  - Can download all videos in a channel
- Format sorting can default to higher resolutions and better codecs
- Cookies from browsers, allows agreeing to certain checks like age
- External support for:
  - Aria2c external download app, works with DASH (mpd) and HLS (m3u8)
    formats
  - Plugins
  - ffmpeg as downloader and merging formats, can change is
    `--compat-options no-direct-merge`
- Portable configuration from home and root directories
- Videos:
  - Download sections of videos based on timestamps
  - Split into chapters
  - Subtitle extraction, embedding, and/or separate files
  - Multiple paths and output templates
  - Metadata
  - Thumbnail embedding
- Certificates
- Sanitize filenames

Other features:

- Use `--compat-options filename` to change file naming formats

### GUI Supports

Can use:

- tartube
- youtube-dl-gui

## See Also

- [Yt-dlp Snippets](../005-computer-snippets-youtube-yt-dlp) - [yt-dlp
  Snippets](id:4cc04c35-2c98-4bcf-84ef-e51148ca8e3c)

### Resources

- [yt-dlp](https://github.com/yt-dlp/yt-dlp)
- [youtube-dl on ArchWiki](https://wiki.archlinux.org/title/Youtube-dl)
