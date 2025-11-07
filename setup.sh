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


#### Rubbish macOS stuff
sudo defaults write com.apple.LaunchServices LSQuarantine -bool NO
defaults write -g NSAutoFillHeuristicsControllerEnabled -bool false

#### Disable headless chrome
mkdir -p ~/Library/LaunchAgents ;
cat > ~/Library/LaunchAgents/local.setenv.chromeheadless.plist <<'PLIST'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>                <string>local.setenv.chromeheadless</string>
  <key>ProgramArguments</key>
  <array>
    <string>/bin/launchctl</string>
    <string>setenv</string>
    <string>CHROME_HEADLESS</string>
    <string>1</string>
  </array>
  <key>RunAtLoad</key>            <true/>
  <!-- KeepAlive not needed; this is a one-shot -->
  <key>StandardOutPath</key>      <string>/tmp/local.setenv.chromeheadless.out</string>
  <key>StandardErrorPath</key>    <string>/tmp/local.setenv.chromeheadless.err</string>
</dict>
</plist>
PLIST
