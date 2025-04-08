#!/usr/bin/env bash

##### Symlinks
ln -sf .fdignore ~/.fdignore
ln -sf .gemrc ~/.gemrc
ln -sf .gitconfig ~/.gitconfig
ln -sf .hushlogin ~/.hushlogin
ln -sf .irbrc ~/.irbrc
ln -sf .tmux.conf ~/.tmux.conf
ln -sf .zshrc.base ~/.zshrc.base

##### Home path setup
mkdir -p ~/.secrets/rails_credentials
mkdir ~/.vimwiki
touch ~/.hushlogin

##### Installs not handled by brew
### NVM
mkdir -p ~/.nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash

