---
filetags: ":snippets:epubnote:video2x:upscale:machine-learning:"
id: 44f6c7e6-c406-4076-8b68-75fde4b6eee3
title: Video2X Snippets
---

``` shell

# Use App image
v2x="./Video2X-x86_64.AppImage"
# See help and options
Video2X-x86_64.AppImage --help

# Upscale video with realesr-animevideov3 model
# Model works well for most anime and live action videos at reasonable processing times
"$v2x" -i input.mp4 -o output.mp4 -p realesrgan -s 4 --realesrgan-model realesr-animevideov3

# Upscale a film by 4x using RealESRGAN with custom encoder options, likely long processing times
"$v2x" -i input-10.mp4 \
  -o output_realesrgan.mp4 \
  -p realesrgan \
  -s 2 \
  --realesrgan-model realesrgan-plus
## Further options
#  -c libx264rgb \
#  -e crf=17 -e preset=slow -e tune=film
#  -c libx264 \
#  -e crf=18 \
#  -e preset=slow
# -p realesrgan: selects the Real ESRGAN engine
# --realesrgan-model realesrgan-plus: model optimized for real-world footage
# -s 2: 2× upscale (e.g., 854×480 → ~1708×960 then padded to 1080p)
# -c, -e: encoding with H.264, high quality
# -e tune=film

```

## See Also

### Resource

- [GitHub - k4yt3x/video2x: A machine learning-based video super
  resolution and frame interpolation framework. Est. Hack the Valley II,
  2018](https://github.com/k4yt3x/video2x)
