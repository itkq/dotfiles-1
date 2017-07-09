set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'

" General {{{
  NeoBundle 'Shougo/vimfiler'
  NeoBundle 'Yggdroot/indentLine'
  NeoBundle 'houtsnip/vim-emacscommandline'
  NeoBundle 'tpope/vim-repeat'
  NeoBundle 'Shougo/vimshell'
  NeoBundle 'bitc/vim-bad-whitespace'

  NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
      \ 'windows' : 'make -f make_mingw32.mak',
      \ 'cygwin' : 'make -f make_cygwin.mak',
      \ 'mac' : 'make -f make_mac.mak',
      \ 'unix' : 'make -f make_unix.mak',
    \ },
    \ }
" }}}

" Edit {{{
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'terryma/vim-expand-region'
  " NeoBundle 'smartchr'
  NeoBundle 'junegunn/vim-easy-align'
  NeoBundle 'cohama/lexima.vim'
  NeoBundle 'vim-scripts/vim-auto-save'
" }}}

" Search {{{
  NeoBundle 'grep.vim'
  NeoBundle 'fuenor/qfixgrep'
  NeoBundle 'Lokaltog/vim-easymotion'
" }}}

" Unite {{{
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'Shougo/neomru.vim'
  NeoBundle 'Shougo/unite-outline'
" }}}

" Completion {{{
  NeoBundle 'mattn/emmet-vim'
  NeoBundle 'ekalinin/Dockerfile.vim'
  NeoBundle 'Shougo/neocomplete'
  NeoBundle 'Shougo/neosnippet'
  NeoBundle 'Shougo/neosnippet-snippets'
" }}}

" ColorScheme {{{
  NeoBundle 'tomasr/molokai'
  NeoBundle 'w0ng/vim-hybrid'
  " NeoBundle 'vim-scripts/Lucius'
  " NeoBundle 'sickill/vim-monokai'
  " NeoBundle 'w0ng/vim-hybrid'
  " NeoBundle 'chriskempson/vim-tomorrow-theme'
  " NeoBundle 'morhetz/gruvbox'
  " NeoBundle 'altercation/vim-colors-solarized'

  " powerline
  NeoBundle 'itchyny/lightline.vim'
  " transparent background of line number
  NeoBundle 'miyakogi/seiya.vim'
" }}}

" Git {{{
  " Git grep
  NeoBundle 'lambdalisue/unite-grep-vcs'
  NeoBundle 'thinca/vim-qfreplace'
  NeoBundle 'airblade/vim-gitgutter'
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'gregsexton/gitv'
  NeoBundle 'AndrewRadev/gapply.vim'
  NeoBundle 'kmnk/vim-unite-giti'
  NeoBundle 'cohama/agit.vim'
" }}}

" Programming {{{
  NeoBundle 'thinca/vim-quickrun'
  NeoBundle 'tyru/caw.vim.git'
  " NeoBundle 'scrooloose/syntastic'
  NeoBundle "jceb/vim-hier"
  NeoBundle "osyo-manga/shabadou.vim"
  NeoBundle "osyo-manga/vim-watchdogs"
  NeoBundle 'tpope/vim-rails'
  NeoBundle 'vimtaku/hl_matchit.vim.git'
  NeoBundle 'tpope/vim-endwise.git'
  NeoBundle 'AndrewRadev/switch.vim'
  NeoBundleLazy 'kana/vim-smartchr'

  " Go
  NeoBundle 'fatih/vim-go'
  NeoBundle 'dgryski/vim-godef'
  NeoBundle 'vim-jp/vim-go-extra'
  NeoBundle 'google/vim-ft-go'

  " taglist
  NeoBundle 'vim-scripts/taglist.vim'
  NeoBundle 'szw/vim-tags'

  " Dash
  NeoBundle 'rizzatti/dash.vim'

  " tex
  NeoBundle 'lervag/vimtex'

  " REPL
  NeoBundle 'ujihisa/repl.vim'
" }}}

" Syntax {{{
  NeoBundle 'vim-scripts/AnsiEsc.vim'
  NeoBundle 'slim-template/vim-slim'
  NeoBundle 'toyamarinyon/vim-swift'
  NeoBundle 'majutsushi/tagbar'
  NeoBundle 'itkq/fluentd-vim'
" }}}

" markdown {{{
  NeoBundle 'plasticboy/vim-markdown'
  NeoBundle 'kannokanno/previm'
  NeoBundle 'tyru/open-browser.vim'
" }}}

NeoBundleCheck

filetype plugin indent on
