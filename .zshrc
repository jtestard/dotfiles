# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/julestestard/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker docker-compose ruby brew kubectl)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# GOENV disabled
eval "$(goenv init -)"
# export PATH="~/.goenv/shims:$PATH"
export PATH="$GOROOT/bin:$PATH"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/tools:$PATH"
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i
echo "after autoload"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/julestestard/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/julestestard/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/julestestard/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/julestestard/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(pyenv init -)"
echo "after pyenv"

alias swagger="docker run --rm -it -e GOPATH=$HOME/go:/go -v $HOME:$HOME -w $(pwd) quay.io/goswagger/swagger"
export PATH=/usr/local/Cellar/ruby/2.7.0/bin:$PATH
export PATH=/usr/local/lib/ruby/gems/2.7.0/gems/sass-3.7.4/bin:$PATH
export PATH=/Users/julestestard/scripts:$PATH
export PATH=$HOME/lib:$PATH
alias npm-exec='PATH=$(npm bin):$PATH'
alias prettier='npm-exec prettier'
alias see-branches="git branch --sort=-committerdate"
alias workstation='gcloud beta compute ssh --zone "us-central1-a" "jules-2004" --project "esoteric-fx-261813"'
alias coturn-station='ssh -i "~/.ssh/pems/jtestard.pem" ubuntu@ec2-18-232-184-103.compute-1.amazonaws.com'
alias nodeIps="kubectl get nodes -o jsonpath='{ $.items[*].status.addresses[?(@.type==\"ExternalIP\")].address }'"
alias cpu_requested="kubectl get pods --all-namespaces -o jsonpath='{range .items[*]}{\"name: \"}{.metadata.name}{\"\n\tcpu requests:\"}{.spec.containers[*].resources.requests.cpu}{"\n"}'"
alias core-logs="kubectl -n cores logs -f"

source "/Users/julestestard/go/src/github.com/emscripten-piepacker/emsdk/emsdk_env.sh"
