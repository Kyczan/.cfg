#!/bin/bash

# path to dotfiles
DOTS=~/Projects/dotfiles

# install lot of apps
sudo pacman -S --needed --noconfirm curl gvim rofi i3blocks feh lxappearance pulseaudio playerctl compton acpi scrot numlockx vivaldi ranger w3m bat exa sysstat dunst youtube-dl nodejs xclip ruby

# install yay
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
sudo rm -rf yay

# create dir for screenshots
mkdir ~/Pictures/screenshots

# add gpg keys needed by spotify
gpg --recv-keys --keyserver hkp://pgp.mit.edu D9C4D26D0E604491
gpg --recv-keys 5CC908FDB71E12C2

# install AUR packages
yay -S i3-gaps i3lock-color-git system-san-francisco-font-git ttf-ms-fonts ttf-font-awesome-4 paper-gtk-theme-git paper-icon-theme-git imagemagick xss-lock-git code spotify vivaldi-widevine vivaldi-ffmpeg-codecs icons-in-terminal

# symlink i3
rm -rf ~/.config/i3
ln -s $DOTS/i3 ~/.config

# symlink i3
rm -rf ~/.config/ranger
ln -s $DOTS/ranger ~/.config

# symlink my bin
ln -s $DOTS/bin ~/

# symlink xres
ln -s $DOTS/.xres ~/

# symlink all files from dots/
ln -s $DOTS/dots/.* ~/

# symlink dunst
rm -rf ~/.config/dunst
ln -s $DOTS/dunst ~/.config

# install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# install CtrlP
git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim

# install NERDTree
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

# reload bash
source ~/.bash_profile
source ~/.bashrc

# install travis
gem install travis -v 1.8.9 --no-rdoc --no-ri

echo "Done-Press enter"
read
