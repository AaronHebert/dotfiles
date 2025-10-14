#!/usr/bin/env bash


#### Install Brew
+/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


#### Brew packages
brew bundle


#### oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "source $PWD/.zshrc.base" > ~/.zshrc


#### Symlinks
ln -sf .fdignore ~/.fdignore
ln -sf $PWD/.gemrc ~/.gemrc
ln -sf $PWD/.hushlogin ~/.hushlogin
ln -sf $PWD/.irbrc ~/.irbrc
ln -sf $PWD/.tmux.conf ~/.tmux.conf
ln -sf $PWD/config/nvim ~/.config/nvim
ln -sf $PWD/config/ghostty ~/.config/ghostty

#### Home setup
mkdir -p ~/.secrets/rails_credentials
mkdir -p ~/.vimwiki
mkdir -p ~/.ssh

#### nvm
#mkdir -p ~/.nvm
#curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash


#### tpm (tmux plugin manager) - in tmux, prefix + I to install
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


#### Rubbish
sudo defaults write com.apple.LaunchServices LSQuarantine -bool NO
