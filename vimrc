set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'rking/ag.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'rstacruz/sparkup'
Plugin 'epeli/slimux'
Plugin 'zh012/YouCompleteMe'
Plugin 'zh012/bufexplorer'

" aesthetic
Plugin 'itchyny/lightline.vim'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plugin 'altercation/vim-colors-solarized'
Plugin 'luochen1990/rainbow'

" development
Plugin 'scrooloose/syntastic'

" python
Plugin 'nvie/vim-flake8'

" Scala
Plugin 'derekwyatt/vim-scala'
" Plugin 'ensime/ensime-vim'
Plugin 'zh012/ensime-vim'

" Vue
Plugin 'posva/vim-vue'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

source ~/.vim/vimrcs/basic.vim
source ~/.vim/vimrcs/plugins.vim

set mouse=a
"set clipboard=unnamed
set showcmd
set nolist
colorscheme default
