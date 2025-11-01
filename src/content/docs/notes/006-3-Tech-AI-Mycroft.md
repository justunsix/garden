---
date: 2022
filetags: ":mycroft:artificial-intelligence:ai:epubnote:"
id: f8db3814-1116-4010-9e4a-ba5828dc4c34
title: Mycroft Artificial Intelligence (AI)
---

Original source: [Mycroft AI](https://mycroft.ai/) retrieved in 2020.
For successors, see [Open Voice OS](https://www.openvoiceos.md/) and
[NeonCore](https://github.com/NeonGeckoCom/NeonCore) which extends
Mycroft.

## About

- Mycroft is an open source voice assistant, modular and free as in
  freedom and free as in no cost.
  - It can be used on open hardware and software
  - Opt in privacy
  - Customizable
  - Multiplatform

### Details

[Feature overview](https://mycroft.ai/about-mycroft/)

- Answer factual questions: "What is the capital of France?"
- Assistant: tell you the date, time, weather, alarms, news
- Media player
- Home control

Mycroft uses [skills](https://market.mycroft.ai/skills) to do things.

## FAQ

### Run self-hosted?

Possible with replacing these 3 services offered by home.mycroft.ai.

- Backend services options:
  - [Selene](https://github.com/MycroftAI?utf8=%E2%9C%93&q=Selene)
  - [Personal Backend](https://github.com/MycroftAI/personal-backend) -
    developed by community
- Speech Recognition, Speech to Text (STT) options:
  - [Mozilla DeepSpeech](https://github.com/mozilla/DeepSpeech/releases)
  - [Kaldi](https://kaldi-asr.md/)
  - Mycroft AI believes these are not sufficient for mainstream use yet
- Speech-synthesis, Text to Speech (TTS) options:
  - Use the British Male Voice
  - Other realistic voices require Mycroft servers

Configure them in the [mycroft.conf
file](https://mycroft-ai.gitbook.io/docs/using-mycroft-ai/customizations/mycroft-conf)

### Wake Word Issues?

Workarounds include:

- Using custom wake words
- Check audio issues

### Response times?

- Depends on system resources, network, streaming STT, dialog, TTS cache
  for common generated phrases

### My own TTS voice?

- Possible, estimate weeks to months and is a significant amount of work

## Get Mycroft - Linux

[Install on
Linux](https://mycroft-ai.gitbook.io/docs/using-mycroft-ai/get-mycroft/linux)

### Prerequisites

- Linux
- Internet connection
- Terminal
- Microphone, speakers
- `git`

### System Requirements

- [Precise](https://github.com/MycroftAI/mycroft-precise#mycroft-precise)
  wake word engine uses TensoFlow:
  - On x86 Intel Processes, requires Advanced Vector Extensions (AVX)
    support. Check it is available with `grep avx /proc/cpuinfo` and
    will return output if install. If nothing, it is not installed
  - If AVX is not available, Mycroft can use PocketSphinx, a
    disadvantage is it is less precise

## Installation

### Using Git

``` bash
# Upgrade pip
pip install --upgrade pip
cd ~/
git clone https://github.com/MycroftAI/mycroft-core.git
cd mycroft-core
# Run script to install all dependencies and Mycroft
bash dev_setup.sh
```

The script will:

- Identify, install and configure dependencies. For Debian/Fedora, it
  will use apt, dnf respectively.

- Install and configure `virtualenv`, a Python tool for isolated
  environments to manage dependencies and security.

- My settings:

  - Use dev branch to troubleshoot skill issues
  - Do not build mimic (I will do it later)
  - Do not add Mycroft bin to PATH
  - Skills at: /opt/mycroft/skills

``` bash

# APT Output during install
We have detected that your computer has the libjack-jackd2-0 package installed.
Mycroft requires a conflicting package, and will likely uninstall this package.
On some systems, this can cause other programs to be marked for removal.
Please review the following package changes carefully.
Press enter to continue
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
build-essential is already the newest version (12.9ubuntu3).
pkg-config is already the newest version (0.29.2-1ubuntu3).
python3-setuptools is already the newest version (59.6.0-1.2).
python3-setuptools set to manually installed.
curl is already the newest version (7.81.0-1ubuntu1.4).
git is already the newest version (1:2.34.1-1ubuntu1.5).
git set to manually installed.
libssl-dev is already the newest version (3.0.2-0ubuntu1.6).
libssl-dev set to manually installed.
pulseaudio is already the newest version (1:15.99.1+dfsg1-1ubuntu2).
pulseaudio-utils is already the newest version (1:15.99.1+dfsg1-1ubuntu2).
pulseaudio-utils set to manually installed.
python3 is already the newest version (3.10.6-1~22.04).
python3-dev is already the newest version (3.10.6-1~22.04).
python3-dev set to manually installed.
The following additional packages will be installed:
  autotools-dev icu-devtools libasound2-dev libaudio2 libblkid-dev libfann2
  libglib2.0-dev-bin libjack-jackd2-dev libjpeg-turbo8-dev libjpeg8-dev libjq1
  libltdl-dev libmount-dev libonig5 libout123-0 libpcre16-3 libpcre2-dev
  libpcre2-posix3 libpcre3-dev libpcre32-3 libpcrecpp0v5 libportaudio2
  libportaudiocpp0 libselinux1-dev libsepol-dev libsigsegv2 libsyn123-0 m4
  swig4.0 uuid-dev
Suggested packages:
  autoconf-archive gnu-standards autoconf-doc gettext bison-doc libasound2-doc
  nas libfann-doc libgirepository1.0-dev libglib2.0-doc icu-doc libtool-doc
  gfortran | fortran95-compiler gcj-jdk m4-doc jackd oss-compat oss4-base
  portaudio19-doc byobu | screenie | iselect ncurses-term swig-doc
  swig-examples swig4.0-examples swig4.0-doc
The following NEW packages will be installed:
  autoconf automake autotools-dev bison flac icu-devtools jq libasound2-dev
  libaudio2 libblkid-dev libfann-dev libfann2 libffi-dev libglib2.0-dev
  libglib2.0-dev-bin libicu-dev libjack-jackd2-dev libjpeg-dev
  libjpeg-turbo8-dev libjpeg8-dev libjq1 libltdl-dev libmount-dev libonig5
  libout123-0 libpcre16-3 libpcre2-dev libpcre2-posix3 libpcre3-dev
  libpcre32-3 libpcrecpp0v5 libportaudio2 libportaudiocpp0 libselinux1-dev
  libsepol-dev libsigsegv2 libsyn123-0 libtool m4 mpg123 portaudio19-dev
  screen swig swig4.0 uuid-dev
```

### Running

`start-mycroft.sh` will start Mycroft services, using `virtualenv`
created by the install script.

e.g. =./start-mycroft.sh all=

`stop-mycroft.sh` will stop Mycroft services.

[Pair your device with
home.mycroft.ai](https://mycroft-ai.gitbook.io/docs/using-mycroft-ai/pairing-your-device)

[See GitHub Readme for further configuration
information](https://github.com/MycroftAI/mycroft-core)

`mycroft-cli-client` in bin folder will start a command interface
showing logs like DEBUG, skills, voice and text feedback from Mycroft.

### Keep Mycroft Updated

``` bash

cd ~/mycroft-core # or wherever you installed Mycroft
# Ensure Mycrofy is stopped
./stop-mycroft.sh
# Stash your configurations
git stash
# Pull the latest changes, likely the dev branch
git pull
# Restore your configurations
git stash pop
# Update your virtualenv
./update_dev.sh
# Restart mycroft
./start-mycroft.sh all

```

### Remove Mycroft

See [Removing Mycroft from
Linux](https://mycroft-ai.gitbook.io/docs/using-mycroft-ai/get-mycroft/linux#removing-mycroft-for-linux-from-your-system)
