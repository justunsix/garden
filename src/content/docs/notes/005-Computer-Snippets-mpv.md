---
filetags: ":snippets:epubnote:mpv:video:"
id: 07f45cae-d59f-4fb7-b5c1-cce6c89636e8
title: mpv Snippets
---

``` shell

# Play internet video
mpv "https://www.youtube.com/watch?v=VPMyBOqCcsw"

# Upscaling video
# Edit `mpv.conf`
# Add the following lines / uncomment gpu use
# ~~ stands for mpv configuration directory (e.g. ~/.config/mpv)
profile=gpu-hq
glsl-shaders="~~/shaders/shader_whatever_name.glsl"
# Or run command line
mpv --glsl-shaders="~~/shaders/FSR.glsl" video.mp4

```
