#!/usr/bin/env bash


#### Brew packages
brew bundle


#### oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "source $PWD/.zshrc.base" > ~/.zshrc


#### Symlinks
ln -sf .fdignore ~/.fdignore
ln -sf .gemrc ~/.gemrc
ln -sf .gitconfig ~/.gitconfig
ln -sf .hushlogin ~/.hushlogin
ln -sf .irbrc ~/.irbrc
ln -sf .tmux.conf ~/.tmux.conf


#### Home setup
mkdir -p ~/.secrets/rails_credentials
mkdir ~/.vimwiki


#### nvm
#mkdir -p ~/.nvm
#curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash


#### tpm (tmux plugin manager)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
