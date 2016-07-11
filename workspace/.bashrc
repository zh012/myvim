# for brew
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"

# settings for virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/projects
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
source /usr/local/bin/virtualenvwrapper.sh

# tmux setting for virtualenv
if [ -n "$VIRTUAL_ENV" ]; then
    source "$VIRTUAL_ENV/bin/activate"
    if [ -f $HOME/.virtualenvspostactivate ]; then
        source $HOME/.virtualenvs/postactivate
    fi
fi

# ansible playbooks deployment
export GH_OAUTH_TOKEN=8f0c687e11f5a1a34db2d5e9726e11b6fc06cf7d

# React Native
export ANDROID_HOME=/usr/local/opt/android-sdk
alias aho='adb shell input keyevent 82'
