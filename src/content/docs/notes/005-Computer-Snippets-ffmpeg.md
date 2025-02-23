---
filetags: ":ffmpeg:snippets:epubnote:"
id: 7dd8e1e7-2d9a-4a67-860f-250205d1286f
title: ffmpeg - video converter and tool Snippets
---

``` bash

# Combine MP4 files with ffmpeg, similar metadata
ffmpeg -f concat -i inputs.txt -c copy output.mp4
# from: https://superuser.com/questions/521113/join-mp4-files-in-linux
# The best way to do this currently is with the concat demuxer. First, create a file # called inputs.txt formatted like so:
# file 'input1.mp4'
# file 'input2.mp4'
# file 'input3.mp4'
# Make sure the input mp4s are in the directory of the input file and command
# for easier execution

# Convert video formats, convert from mp4 to avi
ffmpeg -i input.mp4 output.avi

# Extract audio of video to mp3
ffmpeg -i input.mp4 -q:a 0 -map a output.mp3
# -q:a 0 ensures the highest audio quality.
# -map a maps only the audio stream.
# See script below for batch conversions

# Compress video files, reduce file fize with slight reduction in quality
ffmpeg -i input.mp4 -vcodec libx264 -crf 23 output.mp4
# -vcodec libx264 specifies the H.264 codec for encoding.
# -crf 23 controls quality (lower values = better quality).

# Cut part of a video into another file
ffmpeg -i input.mp4 -ss 00:00:00 -t 00:00:10 -c copy output.mp4
# -ss start time of cut
# -t duration of cut

# Create Slideshow from Images
ffmpeg -framerate 0.5 -i img%03d.jpg -c:v libx264 -r 30 -pix_fmt yuv420p slideshow.mp4
# -framerate 0.5 sets a 2-second interval (1/0.5).
#  img%03d.jpg assumes images are named img001.jpg, img002.jpg, etc.

# Stream Video
ffmpeg -re -i input.mp4 -c:v libx264 -f flv http://localhost:8080/live
# Stream using http
# -re ensures the stream is read in real-time
# -f flv choose FLV format for streaming


# Add subtitles directly into a video
ffmpeg -i input.mp4 -vf subtitles=input.srt output.mp4
# subtitles=input.srt: Adds subtitles from the specified subtitle file (input.srt).

```

## Creating GIFs

``` bash

# Create a gif
ffmpeg -i input.mp4 -vf "fps=10,scale=320:-1" output.gif
# fps=10: Sets the frame rate of the GIF to 10 frames per second, reducing file size while keeping the animation smooth.
# scale=320:-1: Resizes the width of the GIF to 320 pixels while maintaining the aspect ratio
# (-1 calculates the height automatically based on the input video).

# Create a git at specified time for a duration
ffmpeg -i input.mp4 -vf "fps=10,scale=320:-1" -ss 00:00:10 -t 00:00:20 output.gif
# -ss start time
# -t duraction of gif

# Other option - convert video to gif
ffmpeg -i input.mp4 \
  -vf "fps=10,scale=400:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
  -loop 0 output.gif

# Other Options
ffmpeg -i input.mp4 -vf fps=20,scale=320 output.gif
ffmpeg -i input.mp4 -vf scale=320:-1 -r 10 output.gif
ffmpeg -i input.mp4 -vf fps=10,scale=400:-1 -r 10 output.gif

```

## Script to extract audio of mp4 videos in directory into mp3 files

``` shell

lc_convert_video_to_audio() {

  VIDEO_FILES_DIR="/path/to/videos"

  cd "$VIDEO_FILES_DIR" || exit

  # Check if ffmpeg is installed
  if ! command -v ffmpeg &>/dev/null; then
    echo "ffmpeg could not be found. Please install it first."
    exit 1
  fi

  echo "Going through mp4 files in the current directory to convert to audio mp3"
  for video in *.mp4; do
    # Check if there are any .mp4 files
    if [[ ! -e $video ]]; then
      echo "No .mp4 files found in the current directory."
      exit 0
    fi

    # Get the base name of the video file (without extension)
    base_name="${video%.mp4}"

    # Convert the video to mp3
    ffmpeg -i "$video" -q:a 0 -map a "${base_name}.mp3"

    echo "Converted $video to ${base_name}.mp3"
  done

  echo "All conversions are complete."
}

```

## See Also

### Sources

Sources of commands listed above

- [How can I reduce a video's size with
  ffmpeg?](https://unix.stackexchange.com/questions/28803/how-can-i-reduce-a-videos-size-with-ffmpeg)
- [The Usability of FFmpeg: A Versatile Tool for Multimedia
  Processing](https://www.aitude.com/the-usability-of-ffmpeg-a-versatile-tool-for-multimedia-processing/)
