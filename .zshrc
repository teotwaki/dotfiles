_fix_cursor() {
  echo -ne '\e[5 q'
}

precmd_functions+=(_fix_cursor)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Completion stuff

autoload -Uz compinit

fpath+=~/.zfunc
compinit

autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws

# Exports

export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME="$HOME/.virtualenvs"
export PROJECT_HOME="$HOME/src"

# Plugins / OMZ

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git virtualenv virtualenvwrapper ssh-agent)

source $ZSH/oh-my-zsh.sh

# Tools

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi

# Aliases

alias v="nvim"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

if [[ -n $SSH_CONNECTION ]]; then
  # We are on an SSH connection
  alias sso="aws sso login --no-browser"
else
  # We are local, so presumably with a GUI
  alias sso="aws sso login"
fi

# Paths

export GOPATH="$HOME/go"
export PATH="$PATH:$HOME/.local/bin:$HOME/.yarn/bin:$GOPATH/bin"

export GIT_EDITOR=nvim

# Shell

setopt HIST_IGNORE_SPACE
