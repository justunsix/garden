---
filetags: ":adafruit:hardware:adabox:ababox19:epubnote:"
id: bf48d6ad-9df3-4a44-bcfc-a59c68569e4e
title: Adabox 19 Macropad
---

## Keyboard / Macropad use cases

- Macros with key executions
- Shortcuts
- Midi notes for music, midi trigger
- Gamepad, joystick
- Colour keys and colour feedback
- Rotary encoder (rotate or push), also used for reset on push down with
  reset button
- OLED: stats, keys, computer performance

## Components

- Raspberry Pi RP 2040, 8 mb flash memory. 264k RAM
- Stemma Qt for plugin boards
- USB C power/input
- Speaker
- MX compatible switches
- Keycaps for MX switches

## Ideas for Macropad / AutoHotKey / Operating System Key Remappings

Context switching for applications

- Teams:
  - Mute/unmute
- Games / Applications
  - Send special key commands
- VS Code:
  - Open to dos
- No context / Operating System: App shortcuts
  - Open Firefox and search on text in clipboard
- Media player
  - Next, previous
  - Advance/go back 10 sec, 1 min, 10 mins
  - Volume control
- Reminders?

## Macropad Library

[Overview from 2021-08-06 CircuitPython
Day](https://www.youtube.com/watch?v=NgykgLEKB3k), left off at
<https://youtu.be/NgykgLEKB3k?t=3103>

- Library written to abstract all hardware of macropad to a library
  (keys, sounds, rotator)
- [DisplayIO](https://youtu.be/NgykgLEKB3k?t=1006) for key press display
  on OLED
- [Fidget mode](https://youtu.be/NgykgLEKB3k?t=1317), temporarily
  disable HID keys sending data
- [Board printing and creation](https://youtu.be/NgykgLEKB3k?t=1810) -
  digi key, os park (sp?)
- [Key matrix, pins, or shift
  register](https://learn.adafruit.com/key-pad-matrix-scanning-in-circuitpython)
  for each key are used to detech which keys are pressed
  - Keys could be used to control other hardware (e.g. servos)
  - Keys are
    "[debounced](https://learn.adafruit.com/key-pad-matrix-scanning-in-circuitpython/advanced-features)"
    to allow switches to settle down after presses.
  - The RP2040 uses a one key per pin
  - [Key matrix code demo](https://youtu.be/NgykgLEKB3k?t=4361)
  - [Change `py` files to load on
    run](https://circuitpython.readthedocs.io/en/latest/shared-bindings/supervisor/index.html#supervisor.set_next_code_file)

## Learning with RP2040

Pros:

- Uses CircuitPython
- Like other microcontrollers
- Can load all libraries without memory issues

Cons:

- Pins will be different than other controllers

See Macropad library examples for more code:

- Display and key presses
- Can send mouse clicks (like HID devices)
- Send common keys in keyboards include volume up/down, next
- Send collection of keys/sentences, for example can be used with text
  expander

## See Also

### Resources

- [My guide on
  Macropad](https://github.com/justunsix/adabox019-macropad-conf)
- [Learn Adafruit019](https://learn.adafruit.com/adabox019)
  - Assembly
  - RP2040 overview and code libraries
  - Arduino
  - Projects:
    - [Macropad hotkeys](https://learn.adafruit.com/macropad-hotkeys)
