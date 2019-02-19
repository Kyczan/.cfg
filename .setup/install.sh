#!/bin/bash

# install lot of apps
sudo pacman -S --needed --noconfirm curl gvim rofi i3blocks feh lxappearance pulseaudio playerctl compton acpi scrot numlockx vivaldi bat exa sysstat dunst youtube-dl nodejs xclip ruby libqalculate perl-anyevent perl-anyevent-i3 surf

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

# clone bare repo and pull dotfiles
git clone --bare git@github.com:Kyczan/.cfg.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no

# install pathogen for vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# install CtrlP for vim
git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim

# install NERDTree for vim
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

# reload bash
source ~/.bash_profile
source ~/.bashrc

# install travis
gem install travis -v 1.8.9 --no-rdoc --no-ri

echo "Done-Press enter"
read
