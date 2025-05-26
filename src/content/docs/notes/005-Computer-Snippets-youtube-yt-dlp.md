---
description: yt-dlp / youtube-dl Video downloader commands
filetags: ":yt-dlp:snippets:epubnote:"
id: 4cc04c35-2c98-4bcf-84ef-e51148ca8e3c
title: yt-dlp Snippets
---

``` bash
# General usage
yt-dlp [OPTIONS] [--] URL [URL...]

# Help
yt-dlp -h

# Self update
yt-dlp -U

# Start with autonumber at 5 for file index of downloaded files
yt-dlp --autonumber-start 5 URL

# List formats for a URL, Check URL is downloadable
yt-dlp -F URL

# Download only a specific section, numbers are in seconds
# https://www.reddit.com/r/youtubedl/wiki/howdoidownloadpartsofavideo/
yt-dlp --download-sections "*93-111" --force-keyframes-at-cuts

# Download with format = format
yt-dlp -f format URL

# Download with :
# --external-downloader aria2c
# --external-downloader-args '-c -j 3 -x 16 -s 16 -k 1M'
#   -c continue downloading partially downloaded file
#   -j max concurrent downloads
#   -x max concurrent downloads per server
#   -s download a file using this number of connections
#   -k minimum split size for downloads
# aria2 will get around website throttle transfer speeds
# --verbose
# log to see issues
# -N 3
# number of fragments to download at once also (--concurrent-fragments)
# --cookies-from-browser:/home/user1/.var/app/org.mozilla.firefox...::none
# Use cookies from Firefox in local profile directory and no container
# -o output-filename
# -a todownload.txt
# files to download in file, one per line
# --download-archive archive.txt
# id of files yt-dlp has downloaded, one per line
# By default, yt-dlp uses best video format available
yt-dlp --external-downloader aria2c \
       --external-downloader-args aria2c:'-c -j 16 -x 16 -s 16 -k 1M' \
       --verbose -U \
       -N 10 \
       --cookies-from-browser 'firefox:/home/user1/.var/app/org.mozilla.firefox/.mozilla/firefox/222333.default-release/::none' \
       -a todownload.txt \
       --download-archive archive.txt \

       # Like above but with authentication for extractors
       # https://github.com/yt-dlp/yt-dlp#authentication-with-netrc-file
       # where the .netrc file is in the current directory command is being run
       # with format machine <extractor> login <username> password <password>
       # ex. machine youtube login johnsmith password 3422
       # aria2c -j set to 3 to prevent login issues with multiple concurrent downloads
       yt-dlp --external-downloader aria2c \
           --external-downloader-args aria2c:'-c -j 16 -x 16 -s 16 -k 1M' \
           --verbose -U \
           -N 10 \
           --cookies-from-browser 'firefox:/home/user1/.var/app/org.mozilla.firefox/.mozilla/firefox/222333.default-release/::none' \
           -a todownload.txt \
           --download-archive archive.txt \
           --netrc --netrc-location .

# Using youtube-dl for a playlist usually:
yt-dlp --ignore-errors --continue --no-overwrites --download-archive progress.txt *usual options* *URL*
# Allow for the download to continue even after interruption
# If you are archiving, add the usual `--write-xxx` and `--embed-xxx` options you may have

# Audio only download, download as mp3
yt-dlp -x --audio-format mp3 -f bestaudio URL

# Transcript / Subtitle only download
yt-dlp --write-auto-sub --sub-lang en --skip-download "https://www.youtube.com/watch?v=TKjYtfRDASE" --output subtitles.txt

# Download a YouTube playlist with the videos best video and the best audio.
yt-dlp -f 'bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4]' "https://www.youtube.com/playlist?list=PLZVnnAt5_5lao0Cdr9sTtL2EQbhKIcxLm" -o '%(channel)s-%(playlist)s-%(title)s.%(ext)s'

# Download the best mp4 video available of a single video in a playlist
yt-dlp -f 'bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4]' "https://youtu.be/snRtyrJUlFA?list=PLZVnnAt5_5lao0Cdr9sTtL2EQbhKIcxLm" -o '%(channel)s-%(playlist)s-%(title)s.%(ext)s' --no-playlist

# Download playlist with at best 1080p resolution
yt-dlp -S "res:1080" "https:/youtu.be/playlist/3232"

# Download file with at best 720p resolution
# Output to file with title and id
yt-dlp -S "res:720" "https://file" -o '%(title)s.%(ext)s'
# or just id
yt-dlp -S "res:720" "https://file" -o '%(id)s.%(ext)s'

```

## Configuration

The system-wide configuration file is `/etc/yt-dlp.conf` and the
user-specific configuration file is `~/.config/yt-dlp/config`. The
syntax is simply one command-line option per line. Example
configuration:

``` bash

# Using Aria 2
--external-downloader aria2c

# See Example above
--external-downloader-args aria2c:'-c -j 4 -x 16 -s 16 -k 1M'

# Verbose logging
--verbose

# Auto update yt-dlp
-U

# number of fragments to download at once also (--concurrent-fragments)
-N 4

# Use existing cookies
--cookies-from-browser 'firefox:/home/user1/.var/app/org.mozilla.firefox/.mozilla/firefox/35353.default/::none'

# Download URL list
-a '/path/to/todownload.txt'

# List of downloaded file IDs
--download-archive '/path/to/archive.txt'

# User name and password file
--netr

--netrc-location 'path/to/netrc'

# Output format and directory
-o '/path/to/folder/%(autonumber)s-%(title)s [%(id)s] [%(webpage_url_domain)s].%(ext)s'

# -------------- Other Examples ----------------
# --ignore-errors
# --no-playlist

# Prefer 1080p or lower resolutions
# -f bestvideo[ext=mp4][width<2000][height<=1200]+bestaudio[ext=m4a]/bestvideo[ext=webm][width<2000][height<=1200]+bestaudio[ext=webm]/bestvideo[width<2000][height<=1200]+bestaudio/best[width<2000][height<=1200]/best

```

## Sample netrc file

``` shell

machine sitename.com login usr password pass
machine domainname login usr passwod pass

```

## youtube-dl

``` bash

# Standard Download with best video and audio format, restrict filenames to standard ASCII characters, merge to mp4 format, output to filename
youtube-dl -f "bestvideo+bestaudio/best" --restrict-filenames --merge-output-format mp4 --add-metadata -o "<filename>"

# Download best format available but no better than 720p
youtube-dl -f "bestvideo[height<=720]+bestaudio/best[height<=720]" --restrict-filenames --merge-output-format mp4 --add-metadata -o "<filename>" 

# Example with 720

youtube-dl https://vk.com/video-1234_4567 -f "bestvideo[height<=720]+bestaudio/best[height<=720]" --restrict-filenames --merge-output-format mp4 --add-metadata -o "testoutput.mp4" 
```

## See Also

### Resources

- [yt-dlp on GitHub](https://github.com/yt-dlp/yt-dlp)
