# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/jerry.zhang/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="myamuse"
#ZSH_THEME="simple"

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
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker history aws brew web-search)

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# settings for virtualenvwrapper
#export WORKON_HOME=$HOME/.virtualenvs
#export PROJECT_HOME=$HOME/projects
#export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
#source /usr/local/bin/virtualenvwrapper.sh

# anaconda
PATH_WITHOUT_CONDA=$PATH
PATH_WITH_CONDA="/Users/jerry.zhang/anaconda3/bin:$PATH"
export PATH=$PATH_WITHOUT_CONDA

function condaenv() {
    if [[ "$1" == "off" ]]; then
        export PATH=$PATH_WITHOUT_CONDA
    else
        export PATH=$PATH_WITH_CONDA
    fi
}

# switch kubernetes cluster
function kubenv() {
    if [[ -f ~/.kube-$1 ]]; then
        cd
        rm .kube || true
        ln -nsf ./.kube-$1 .kube
        cd -
    else
        echo "env $1 does not exist"
    fi
}

function sshconfig() {
    if [[ -f ~/.ssh/config.$1 ]]; then
        cd ~/.ssh
        ln -nsf ./config.$1 config
        cd -
    else
        echo "config $1 does not exist"
    fi
}

export PATH="/usr/local/sbin:$PATH"

# hero mysql client
alias mylocal="mysql --defaults-file=$HOME/.my.hero-local.cnf -D johnny5_development"
alias mystg="mysql --defaults-file=$HOME/.my.hero-stg.cnf -D hero_stg"
alias myint="mysql --defaults-file=$HOME/.my.hero-int.cnf -D hero_int"
alias myprac="mysql --defaults-file=$HOME/.my.hero-int.cnf -D hero_practice"
alias myprod="mysql --defaults-file=$HOME/.my.hero-prod.cnf -D hero_prod"

# android
export ANDROID_SDK_ROOT=/usr/local/share/android-sdk

eval "$(rbenv init -)"
alias nb="docker run -d --name notebook -p 8888:8888 -v $HOME/side/notebook:/home/jovyan jupyter/datascience-notebook && sleep 3 && docker logs notebook"

alias mitm="docker run --rm --name mitm -it -v $HOME/.mitmproxy:/home/mitmproxy/.mitmproxy -p 7070:8080 mitmproxy/mitmproxy mitmproxy -s /home/mitmproxy/.mitmproxy/adaptor.py"
