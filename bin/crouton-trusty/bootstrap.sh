#!/bin/bash

sudo apt-get install -y git vim kupfer aptitude \
  software-properties-common bash-completion apt-file \
  tmux gcc automake autoconf pulseaudio ncdu htop \
  tilda

git config --global user.email billiamthesecond@gmail.com
git config --global user.name Billiam

setxkbmap dvorak

grep -q "en_US.UTF-8" /etc/environment || sudo sh -c "echo 'LC_ALL=en_US.UTF-8\nLANG=en_US.UTF-8' >> /etc/environment"

sudo add-apt-repository ppa:brightbox/ruby-ng -y
sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y
sudo aptitude update
sudo aptitude install ruby2.3 ruby2.3-dev sublime-text-installer ruby-switch
sudo gem install bundler pry foreman

sudo ln -s /opt/sublime_text/sublime_text /usr/local/bin

package=~/.config/sublime-text-3/Installed\ Packages/Package\ Control.sublime-package

[[ -f "$package" ]] || curl -o "$package" https://packagecontrol.io/Package%20Control.sublime-package

[[ -d ~/dotfiles ]] || git clone https://github.com/Billiam/dotfiles ~/dotfiles

$(dirname $0)/../../install
