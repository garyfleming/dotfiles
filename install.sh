#!/usr/bin/env zsh

#Install zshrc config and oh-my-zsh
ln -f ~/.dotfiles/.zshrc ~/.zshrc
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# SSH
ln -f ~/.dotfiles/ssh/sshconfig ~/.ssh/config

# Tools
mkdir -p ~/dev/tools/
ln -sf ~/.dotfiles/backup-scripts/ ~/dev/tools/

#Install apps via Brew
brew update
brew bundle --file=~/.dotfiles/software/main-brewfile
brew bundle --file=~/.dotfiles/software/cmd-brewfile


# Clone active repos
# TODO use 1pass-cli to get passwords
# TODO provision ssh-key for github and vkps. 1pass?
# TODO currently removed old clone script. Was way out of date.

# Ruby
# TODO ensure ruby is installed and up-to-date
sudo gem install bundler
sudo gem install jekyll
sudo gem install video_transcoding
