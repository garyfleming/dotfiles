#!/usr/bin/env zsh

#Install zshrc config and oh-my-zsh
ln -f ~/.dotfiles/.zshrc ~/.zshrc
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# SSH
ln -f ~/.dotfiles/ssh/sshconfig ~/.ssh/config

# GIT
ln -f ~/.dotfiles/gitconfig ~/.gitconfig

# Tools
mkdir -p ~/dev/tools/
ln -sf ~/.dotfiles/backup-scripts/ ~/dev/tools/

#Install apps via Brew
brew update
brew bundle --file=~/.dotfiles/software/main-brewfile
brew bundle --file=~/.dotfiles/software/cmd-brewfile

# Repos (TODO)
mkdir -p ~/dev/projects/
gh repo clone garyfleming/solitude-jekyll ~/dev/projects/solitude-jekyll

mkdir -p ~/dev/talks/
gh repo clone garyfleming/the-board-whisperer ~/dev/talks/the-board-whisperer
gh repo clone garyfleming/apis-for-decades ~/dev/talks/apis-for-decades
gh repo clone garyfleming/tdd-is-my-shame ~/dev/talks/tdd-is-my-shame
gh repo clone garyfleming/continuous-entropy ~/dev/talks/continuous-entropy
gh repo clone garyfleming/estimates ~/dev/talks/estimates
gh repo clone garyfleming/lets-begin ~/dev/talks/lets-begin


# Clone active repos
# TODO use 1pass-cli to get passwords
# TODO provision ssh-key for github and vkps. 1pass?
# TODO currently removed old clone script. Was way out of date.

# Ruby - Keep version up to date
rbenv install 3.2.1
rbenv global 3.2.1
sudo gem update --system
sudo gem install bundler
sudo gem install jekyll