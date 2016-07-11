#!/usr/bin/env bash

# Path to the bash it configuration
export BASH_IT="/Users/jzhang/.bash_it"

# Lock and Load a custom theme file
function prompt_command() {
  if [ -n "$CONDA_DEFAULT_ENV" ]; then
    PS1="${yellow}($CONDA_DEFAULT_ENV) ${reset_color}${orange}${reset_color}${green}\w${purple}\[\$(scm_prompt_info)\]${reset_color}\n$ "
  else
    PS1="${green}\w${purple}\[\$(scm_prompt_info)\]${reset_color}\n$ "
  fi
}
SCM_THEME_PROMPT_DIRTY=" ✗"
SCM_THEME_PROMPT_CLEAN=" ✓"
SCM_THEME_PROMPT_PREFIX="("
SCM_THEME_PROMPT_SUFFIX=")"
PROMPT_COMMAND=prompt_command;
# location /.bash_it/themes/
#export BASH_IT_THEME='simple'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# Load Bash It
source $BASH_IT/bash_it.sh

#source $HOME/.scirc
export PATH="$HOME/anaconda3/bin:$PATH"
export DYLD_FALLBACK_LIBRARY_PATH=$HOME/anaconda3/lib/:$DYLD_FALLBACK_LIBRARY_PATH

#command for jupyter
jup() {
    JPY_PID=$(pgrep -f jupyter-notebook)
    JPY_PORTS=$(pgrep -f jupyter-notebook | xargs | xargs -n 1 -I pid bash -c "lsof -i4TCP -sTCP:LISTEN -n -P | grep pid | cut -d':' -f2 | cut -d' ' -f1")
    OPEN_IN_BROWSER=$(echo $* | grep -e "--browser" -q)
    echo $OPEN_IN_BROWSER
    if [ "$1" = 'kill' ]; then
        if [ -z $JPY_PID ]; then
            echo "jupyter is not running"
        else
            kill -9 $JPY_PID
        fi
    elif [ "$1" = 'ports' ]; then
        echo $JPY_PORTS
    else
        if [ -z $JPY_PID ]; then
            if [ ! -z "$1" ]; then
                source activate $1
            fi
            jupyter notebook --no-browser >/dev/null 2>&1 &
        fi

        if echo $* | grep -e "--browser" -q; then
            open http://localhost:$(lsof -i4TCP -sTCP:LISTEN -n -P | grep `pgrep -f jupyter` | cut -d':' -f2 | cut -d' ' -f1)
        else
            open -a /Applications/JupyterFluid.app/
        fi
    fi
}
