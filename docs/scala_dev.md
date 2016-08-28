
Scala + Sbt + Vim + Ensime
==========================

### install apps
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew update
brew install scala
brew install sbt
brew install vim
```

### sbt plugins
`~/.sbt/0.13/plugins/plugins.sbt`
```
# http://ensime.github.io/build_tools/sbt/
addSbtPlugin("org.ensime" % "sbt-ensime" % "1.0.0")
# https://github.com/sbt/sbt-fresh
addSbtPlugin("de.heikoseeberger" % "sbt-fresh" % "1.5.4")
```

### install ensime dependices
```
pip install websocket-client sexpdata
```

### add vim plugins
```
Plugin 'derekwyatt/vim-scala'
Plugin 'ensime/ensime-vim'
```



### workflow

```
mkdir myproj
cd myproj
sbt fresh
```

run command `:EnInstall` in vim

run command `ensimeConfig` in sbt console

### YouCompleteMe requests to use MacVim instead of console vim, and will need build
something locally
```
brew cask install macvim
brew install cmake
```

add alias to shell overwrite vim cmd
```
alias vim='mvim -v'
```

install youcompleteme
```
Plugin 'Valloric/YouCompleteMe'
```
in vim
```
:PluginInstall
```
install
```
~/.vim/bundle/YouCompleteMe
./intsall.py
```

Remember: YCM is a plugin with a compiled component. If you update YCM using Vundle and the ycm_core library APIs have changed (happens rarely), YCM will notify you to recompile it. You should then rerun the install process.
