#!/bin/sh

echo "Setup Running..."

# Install Oh My ZSH
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# dotfiles for home path
declare -a home_sym_links=(".gem.rc" ".hushlogin" ".irbrc" ".vimrc" ".zshrc")

# Symlink dotfiles from project to home path
for i in "${home_sym_links[@]}"
do
  rm $HOME/$i
  ln -s $i $HOME/$i
done

# Directory for sensitive vars, key, etc. This will be sourced by .zshrc
mkdir -p $HOME/.sensitive
touch $HOME/.sensitive/.sensitive_vars

brew update

brew tap homebrew/bundle
brew bundle --file ./Brewfile

# Install vim-plug
mkdir -p $HOME/.vim/autoload
cp ./vim/autoload/plug.vim $HOME/.vim/autoload/

# Install font(s)
cp ./fonts/. $HOME/Library/Fonts/

echo "Setup Complete!"
