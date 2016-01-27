#!/bin/bash

sudo apt-get install -y vim kupfer aptitude \
  software-properties-common bash-completion apt-file \
  tmux gcc automake autoconf pulseaudio ncdu htop \
  tilda etckeeper keepass2

sudo add-apt-repository ppa:git-core/ppa -y
sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y
sudo add-apt-repository ppa:brightbox/ruby-ng -y
sudo add-apt-repository ppa:paolorotolo/copy -y

sudo aptitude update
sudo aptitude install git ruby2.3 ruby2.3-dev \
  sublime-text-installer ruby-switch copy

git config --global user.email billiamthesecond@gmail.com
git config --global user.name Billiam

# Enable git in etckeeper
sudo sed -e 's:^\(VCS\s*=.*bzr\):#\1:' -e 's:^#\(VCS\s*=.*git\):\1:' -i /etc/etckeeper/etckeeper.conf

sudo etckeeper init
sudo etckeeper commit "Initial commit"

setxkbmap dvorak

grep -q "en_US.UTF-8" /etc/environment || sudo sh -c "echo 'LC_ALL=en_US.UTF-8\nLANG=en_US.UTF-8' >> /etc/environment"

sudo gem install bundler pry foreman

sudo ln -s /opt/sublime_text/sublime_text /usr/local/bin

package=~/.config/sublime-text-3/Installed\ Packages/Package\ Control.sublime-package

[[ -f "$package" ]] || curl -o "$package" https://packagecontrol.io/Package%20Control.sublime-package

[[ -d ~/dotfiles ]] || git clone https://github.com/Billiam/dotfiles ~/dotfiles

$(dirname $0)/../../install
