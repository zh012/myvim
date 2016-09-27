## Install myvim

    git clone https://github.com/zh012/myvim.git ~/.vim
    ln -sf ~/.vim/vimrc ~/.vimrc


### Install Vundle

    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim


### Install vim with python 3 support

    brew update
    brew install vim --with-python3

Don't do this usually.


### Install Ag for search

    brew install the_silver_searcher


### Disable the `Mission Control` keys in mac

    System Preferences -> Mission Control -> Keyboard and Mouse Shortcuts
    System Preferences -> Keyboard -> Shortcuts -> Mission Control -> Mission Control

### Flip fn keys of F1 ~ F12 in mac

    System Preferences -> Keyboard -> Use all F1,F2,etc. keys as standard function keys


### profile a vim command

```
:profile start profile.log
:profile func *
:profile file *
" At this point do slow actions
:profile pause
```
