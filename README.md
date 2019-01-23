# dotfiles <!-- omit in toc -->

My Arch configuration files

![My desktop](./scrots/desktop.png)

## TOC <!-- omit in toc -->

- [installation](#installation)
  - [core](#core)
  - [from sources](#from-sources)
  - [AUR](#aur)
- [i3](#i3)
  - [shortcuts](#shortcuts)
- [i3 blocks](#i3-blocks)
  - [battery](#battery)
  - [cpu](#cpu)
  - [date](#date)
  - [keyindicator](#keyindicator)
  - [memory](#memory)
  - [network](#network)
  - [packages](#packages)
  - [time](#time)
  - [title](#title)
  - [volume](#volume)
  - [weather](#weather)
- [dots](#dots)
  - [.aliases](#aliases)
  - [.bash_profile](#bash_profile)
  - [.bashrc](#bashrc)
  - [.vimrc](#vimrc)
  - [.xintrc](#xintrc)
  - [.Xresources](#xresources)
- [dunst](#dunst)
- [ranger](#ranger)

## installation

To get i3 looking like in pictures you have to install some programs. `install.sh` installs below applications and does some configuration. But use it on your own risk.

### core

- `acpi` (for getting battery info)
- `compton` (for nice transitions)
- `dunst` for display notifications
- `exa` for colored `ls` output
- `feh` (for setting wallpaper; put wallpaper to `~/Pictures/wallpaper.jpg`)
- `i3blocks` (for bar with custom informations)
- `lxappearance` (for changing system font and theme; change font in `~/.gtkrc-2.0` and in `~/.config/gtk-3.0/settings.ini`)
- `nodejs`
- `numlockx` (for turning on numlock on start)
- `playerctl` (for audio control)
- `pulseaudio` (for audio control)
- `ranger` `w3m` (console based file manager)
- `rofi` (for searching and launching apps)
- `ruby` (for travis CLI `gem install travis -v 1.8.9 --no-rdoc --no-ri`)
- `scrot` (for making screenshots; also create directory `~/Pictures/screenshots`)
- `sysstat` (to get CPU load)
- `vivaldi` (To use Netflix install from AUR `vivaldi-widevine` and `vivaldi-ffmpeg-codecs`)
- `xclip` (to manage clipboard)
- `youtube-dl` best [YT downloader](https://github.com/rg3/youtube-dl/)

### from sources

- `st` (simple terminal - [installation instructions](https://github.com/Kyczan/st))
- `yay` ([installation instructions](https://computingforgeeks.com/yay-best-aur-helper-for-arch-linux-manjaro/); for installing AUR packages)

### AUR

- `code` (AUR; nice editor for programmers)
- `i3-gaps` fork of `i3` (AUR) ([installation instructions](https://github.com/Airblader/i3))
- `i3lock-color-git` (AUR) (for locking screen)
- `icons-in-terminal` (AUR) (nice glyphicons to use in st terminal)
- `imagemagick` (AUR; for converting images to set them as lock screen)
- `paper-gtk-theme-git`, `paper-icon-theme-git` (AUR; Paper System Theme - nice theme)
- `spotify` (AUR), before installing add following gpg keys:

```sh
gpg --recv-keys --keyserver hkp://pgp.mit.edu D9C4D26D0E604491
gpg --recv-keys 5CC908FDB71E12C2
```

- `system-san-francisco-font-git`, `ttf-ms-fonts` (AUR; system font)
- `ttf-font-awesome-4` (AUR; font with nice icons - use v4 - v5 breaks compatibility)
- `xss-lock-git` (AUR; for locking screen after suspend. To suspend after closing lid, go to `/etc/systemd/logind.conf`, uncomment `HandleLidSwitch=suspend`)

## i3

It is worth to make symlink from repo to i3 config folder (assuming that i3 config is in `~/.config/i3`):

```sh
rm -rf ~/.config/i3
ln -s $DOTS/i3 ~/.config
```

### shortcuts

- `super` - win key
- `h|j|k|l` - directions (left, down, up, right)
- `super + 0...9` - jump to specify workspace
- `super + tab` - move to next workspace
- `super + shift + tab` - move to prev workspace
- `super + shift + 0...9` - move active window to desired workspace
- `super + r` - enter resize mode (allows to resize windows by directions keys)
- `super + shift + c` - reload i3 configuration file
- `super + shift + r` - restart i3 inplace, reloads profile files
- `super + p` - open modal window that allows to lock, restart, shutdown, reboot system or restarts i3

  ![power](./scrots/power.png)

- `super + enter` - open terminal
- `super + d` - open list of apps

  ![rofi](./scrots/rofi.png)

- `super + q` - kill active window
- `super + h|j|k|l` - change focus to next window
- `super + shift + h|j|k|l` - move focused window
- `super + v` - split vertically
- `super + shift + v` - split horizontally
- `super + f` - enter fullscreen mode for the focused container
- `super + s|w|e` - change container layout (stacked, tabbed, toggle split)
- `super + shift + space` - toggle tiling / floating view
- `super + space` - change focus between tiling / floating windows
- `super + a` - focus parent container
- `super + shift + a` - focus child container
- `super + u` - check and run updates
- `super + n` - run network applet
- `super + i` - search for icons. Selected icon is copied to clipboard

  ![usb](./scrots/icons.png)

- `super + m` - mount / unmount usb drive

  ![usb](./scrots/usb.png)

- `super + PrintScreen` - make screenshot and save to `~/Pictures/screenshots/`

## i3 blocks

![My blocks](./scrots/blocks.png)

Block definitions are located in `./i3/i3blocks/blocks`

### battery

Shows actual state of battery. Changes color accordingly to battery level. Also notifies (via dunst) when is fully charged or when battery level is low.

### cpu

Shows cpu load for every core. When clicked - shows notification with ten most consuming processes.

![cpu](./scrots/cpu.png)

### date

Shows actual date. When clicked - shows calendar.

![calendar](./scrots/calendar.png)

### keyindicator

Shows info if numlock, capslock or scrolllock is enabled.

### memory

Shows memory load. When clicked - shows notification with ten most memory consuming programs.

![memory](./scrots/memory.png)

### network

Designed for wifi. Shows signal strength. When clicked - runs network manager applet.

### packages

Runs every 5 minutes. If detects any apps updates, shows small icon with number of updates. When clicked - runs terminal with update command.

### time

Shows actual time

### title

Shows title of actual focused window, Displays it in the center of the status bar.

### volume

Shows volume level. Right click mutes. Scrolling on it increases/decreases volume. Also there is possiblity to control volume from keyboard using dedicated multimedia buttons.

### weather

First make account on [openweathermap.org](https://openweathermap.org) and obtain API key. Then rename `weather.cfg.example` to `weather.cfg` and update this file with your API key.

This block shows actual temperature in desired location with small icon about weather conditions. After left click it shows detailed notification.

![weather](./scrots/weather.png)

## dots

Dots are files that reside in your home directory and their filenames start from `.` (dot).

Symlink all files from `dots/` to `~/`

```sh
ln -s $DOTS/dots/.* ~/
```

Then reload `.Xresources`:

```sh
source ~/.Xresources
```

### .aliases

Contains useful shortcuts.

### .bash_profile

Runs once on logon.

### .bashrc

Runs every time when bash starts (new terminal window is spawn). Loads aliases and creates custom prompt line:

![prompt](./scrots/prompt.png)

### .vimrc

Config file for Vim.

Install below addons:

- [dracula theme](https://draculatheme.com/vim/)
- [pathogen](https://github.com/tpope/vim-pathogen) for plugins management.
- [CtrlP](https://github.com/kien/ctrlp.vim) (for fuzzy search)
- [NERDTree](https://github.com/scrooloose/nerdtree) (for file tree)

### .xintrc

Runs when X session starts. Loads theme from `.Xresources` and opens i3.

### .Xresources

Defines theme for system. Loads params from `.xres` folder.

To get to work `.xres` create symlink:

```sh
ln -s $DOTS/.xres ~/
```

## dunst

Create symlink:

```sh
rm -rf ~/.config/dunst
ln -s $DOTS/dunst ~/.config
```

## ranger

Create symlink:

```sh
rm -rf ~/.config/ranger
ln -s $DOTS/ranger ~/.config
```
