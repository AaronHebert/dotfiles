#!/usr/bin/env bash

### symlinks
ln -sf .fdignore ~/.fdignore
ln -sf .gemrc ~/.gemrc
ln -sf .gitconfig ~/.gitconfig
ln -sf .hushlogin ~/.hushlogin
ln -sf .irbrc ~/.irbrc
ln -sf .tmux.conf ~/.tmux.conf
ln -sf .zshrc.base ~/.zshrc.base

mkdir -p ~/.secrets/rails_credentials
mkdir ~/.vimwiki

touch ~/.hushlogin
