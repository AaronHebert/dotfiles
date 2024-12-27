export PATH="/opt/homebrew/Cellar/git/2.37.0/bin:/Users/ahebert/work/infrastructure/bin:/opt/homebrew/opt/python@3.10/libexec/bin:$PATH"
fpath+=("$(brew --prefix)/share/zsh/site-functions")

### Basic Exports
export COMPOSE_DOCKER_CLI_BUILD=0
export DOCKER_BUILDKIT=0
export EDITOR="nvim"
export NVM_DIR="$HOME/.nvm"

### Telemetry
export HOMEBREW_NO_ANALYTICS=1
export APOLLO_TELEMETRY_DISABLED=true

[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

### Load Sensitive ENVs
if [ -f $HOME/.sensitive ]; then
  source $HOME/.sensitive_vars
fi

### ZSH
ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
eval "$(rbenv init - zsh)"

### Theme support
ZSH_THEME=""
autoload -U promptinit; promptinit
prompt pure

### Basic Functions & Helpers
# Start GPG agent for every shell
if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
    source ~/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
else
    eval $(gpg-agent --daemon &>/dev/null)
fi

### Ensures we run the bundler version as defined in Gemfile.lock
function bundle_v() {
  BUNDLEVERSION=$(tail -n -1 Gemfile.lock | tr -d '[:space:]')
  echo "---Running bundler with version ${BUNDLEVERSION} from Gemfile.lock---"
  bundler _"${BUNDLEVERSION}"_ "$@"
  echo "---Ran bundler with version ${BUNDLEVERSION}---"
}

# iTerm2 window/tab color commands
#   Requires iTerm2 >= Build 1.0.0.20110804
#   http://code.google.com/p/iterm2/wiki/ProprietaryEscapeCodes
tab-color() {
    echo -ne "\033]6;1;bg;red;brightness;$1\a"
    echo -ne "\033]6;1;bg;green;brightness;$2\a"
    echo -ne "\033]6;1;bg;blue;brightness;$3\a"
}
tab-reset() {
    echo -ne "\033]6;1;bg;*;default\a"
}

# Change the color of the tab when using SSH
# reset the color after the connection closes
color-ssh() {
  if [[ -n "$ITERM_SESSION_ID" ]]; then
    trap "tab-reset" INT EXIT
    if [[ "$*" =~ "production|ec2-.*compute-1" ]]; then
        tab-color 255 0 0
    else
        tab-color 0 255 0
    fi
  fi
  ssh $*
}

compdef _ssh color-ssh=ssh
alias ssh=color-ssh

### Basic Aliases
alias l="eza -abl --group-directories-first"
alias be="bundle_v exec"
alias dc="docker compose"
alias ds='docker stats $(docker ps --format={{.Names}})'
alias iclean="docker container prune && docker image prune"
alias idangle='docker rmi $(docker images -f "dangling=true" -q)'
alias lzd='lazydocker'
alias kc="kubectl"
alias startssh='eval `ssh-agent -s`'
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
alias vim="nvim"
