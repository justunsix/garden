---
filetags: ":snippets:epubnote:pulseaudio:pactl:"
id: 43f11284-372d-42fe-aaaa-9f9dea5093b4
title: Pulseaudio-pactl Snippets
---

``` shell

# List available audio output devices (sinks)
pactl list short sinks

# List all audio output devices, for example sound players, browers
pactl list short sink-inputs

# Set sink for a given output id
pactl move-sink-input <sink-input-id> <sink-name>
pactl move-sink-input 203 bluez_output.id ## Switch firefox to use bluetooth sound

```
