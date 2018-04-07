# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="eastwood"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Disable NOMATCH errors
setopt NO_NOMATCH

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git cp rake rvm ruby ssh-agent sudo virtualenvwrapper)
plugins=(git cp rvm ssh-agent sudo)

# User configuration

export PATH="$HOME/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/local/bin:$HOME/.local/bin"

# Add cargo
export PATH="$HOME/.cargo/bin:$PATH"

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
export EDITOR='nvim' GIT_EDITOR='nvim'
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export CCACHE_DIR=$HOME/.ccache

export PATH="$PATH:$HOME/bin/sbt/bin" # Scala Build Tool
export PATH="$PATH:$JAVA_HOME/bin"

export NVM_DIR="/home/slau/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

bindkey '^[Od' backward-word
bindkey '^[Oc' forward-word

alias grip='grep -rI'
alias gco='git checkout'
alias gf='git fetch origin -tp'

alias kcon='kubectl config current-context'
alias kconu='kubectl config use-context'
alias kexec='kubectl exec -ti'
alias kg='kubectl get'
alias kd='kubectl describe'
alias klogs='kubectl logs'

khosts() {
  kubectl get nodes -o json | jq -r '.items[].status.addresses[] | select(.type == "ExternalIP") | .address'
}

knodessh() {
  for host in $(khosts); do
    echo $host
    ssh admin@$host -i ~/.ssh/k8s_euwest_rsa $*
    echo
  done
}

export TERM=xterm-256color

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source "$HOME/.kube/completion"
source "$HOME/.kops.env"
source "$HOME/.local/bin/aws_zsh_completer.sh"
source "$HOME/.kops_completion"
source "$HOME/.helm_completion"

PATH="/home/slau/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/slau/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/slau/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/slau/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/slau/perl5"; export PERL_MM_OPT;
