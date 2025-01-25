#!/usr/bin/env bash

### symlinks
ls -s .fdignore ~/.fdignore
ln -s .gemrc ~/.gemrc
ln -s .hushlogin ~/.hushlogin
ln -s .irbrc ~/.irbrc
ln -s .tmux.conf ~/.tmux.conf
ln -s .zshrc.base ~/.zshrc.base

# create secrets dir
mkdir ~/.secrets
