# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# https://github.com/robbyrussell/oh-my-zsh/wiki/themes
ZSH_THEME="amuse"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
plugins=(git sbt tmux brew brew-cask history pip web-search aws sublime nvm)

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

export JAVA_HOME="`/usr/libexec/java_home`"

# settings for virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/projects
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
source /usr/local/bin/virtualenvwrapper.sh

# tmux setting for virtualenv
#if [ -n "$VIRTUAL_ENV" ]; then
#    source "$VIRTUAL_ENV/bin/activate"
#    if [ -f $HOME/.virtualenvspostactivate ]; then
#        source $HOME/.virtualenvs/postactivate
#    fi
#fi

# init docker env
#eval "$(boot2docker shellinit 2> /dev/null)"

# android path
#export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools
# export PATH=$PATH:$HOME/bin

# spark related
export SPARK_HOME=~/workspace/spark/current

alias spark=$SPARK_HOME/bin/spark-shell
pyspark() {
    (
        if [[ $(readlink $SPARK_HOME) == "spark-2"* ]]; then
            # export PYSPARK_DRIVER_PYTHON=ipython
            export PYSPARK_DRIVER_PYTHON=jupyter
            export PYSPARK_DRIVER_PYTHON_OPTS="notebook --NotebookApp.port=9999"
            unset IPYTHON
        else
            export IPYTHON=1
            unset PYSPARK_DRIVER_PYTHON
        fi
        workon pyspark
        cd ~/workspace/spark/notebook
        $SPARK_HOME/bin/pyspark
    )
}

# workaround for tmux issue with slimux
# https://github.com/epeli/slimux/issues/61
export EVENT_NOKQUEUE=1
export EVENT_NOPOLL=1

# use MacVim instead of vim
alias vim='mvim -v'
alias https='http --default-scheme=https'

# react native
export ANT_HOME=/usr/local/opt/ant
export MAVEN_HOME=/usr/local/opt/maven
export GRADLE_HOME=/usr/local/opt/gradle
export ANDROID_HOME=/usr/local/opt/android-sdk

# nvm
# brew install nvm
# nvm install node
sourc e$(brew --prefix nvm)/nvm.sh
