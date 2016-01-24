#!/bin/bash

sudo apt-get install -y git vim kupfer aptitude \
  software-properties-common bash-completion apt-file \
  tmux gcc automake autoconf pulseaudio ncdu

git config core.email billiamthesecond@gmail.com
git config core.name Billiam

setxkbmap dvorak
echo 'setxkbmap dvorak' >> ~/.config/lxsession/LXDE/autostart
echo 'syndaemon -i 1 -d -t -K -R' >> ~/.config/lxsession/LXDE/autostart

sudo add-apt-repository ppa:brightbox/ruby-ng -y
sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y
sudo aptitude update
sudo aptitude install ruby2.3 ruby2.3-dev sublime-text-installer ruby-switch

ln -s /opt/sublime_text/sublime_text /usr/local/bin

[[ -d ~/dotfiles]] || git clone https://github.com/Billiam/dotfiles ~/dotfiles

$(dirname $0)/../../install