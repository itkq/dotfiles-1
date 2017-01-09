" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

 " Required:
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" General {{{
  " ファイルツリー表示
  NeoBundle 'Shougo/vimfiler'

  " インデント表示
  NeoBundle 'Yggdroot/indentLine'

  " コマンドラインでemacsキーバインド
  NeoBundle 'houtsnip/vim-emacscommandline'

  " コマンド繰り返し
  NeoBundle 'tpope/vim-repeat'

  " Vim Shell
  NeoBundle 'Shougo/vimshell'

  " ホワイトスペース
  NeoBundle 'bitc/vim-bad-whitespace'

  " 非同期用処理
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
  " 日本語整形
  " NeoBundle 'fuenor/JpFormat.vim'

  " 括弧などで囲む
  NeoBundle 'tpope/vim-surround'

  " 範囲拡大
  NeoBundle 'terryma/vim-expand-region'

  " イコールの前後を整形
  " NeoBundle 'smartchr'

  " align
  NeoBundle 'junegunn/vim-easy-align'

  " 括弧補完
  NeoBundle 'cohama/lexima.vim'

  " メモ
  " NeoBundle 'fuenor/qfixhowm'

  " 自動保存
  NeoBundle 'vim-scripts/vim-auto-save'
" }}}

" Search {{{
  " grep強化
  NeoBundle 'grep.vim'
  " grep
  NeoBundle 'fuenor/qfixgrep'
  " 移動
  NeoBundle 'Lokaltog/vim-easymotion'
" }}}

" Unite {{{
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'Shougo/neomru.vim'
  NeoBundle 'Shougo/unite-outline'
" }}}

" Completion {{{
  " HTML
  NeoBundle 'mattn/emmet-vim'
  " Dockerfile
  NeoBundle 'ekalinin/Dockerfile.vim'

  " 補完
  NeoBundle 'Shougo/neocomplete'

  " スニペット
  NeoBundle 'Shougo/neosnippet'
  NeoBundle 'Shougo/neosnippet-snippets'

  " submodule
  " NeoBundle 'kana/vim-submode'
" }}}

" ColorScheme {{{
  NeoBundle 'tomasr/molokai'
  " NeoBundle 'vim-scripts/Lucius'
  " NeoBundle 'sickill/vim-monokai'
  " NeoBundle 'w0ng/vim-hybrid'
  " NeoBundle 'chriskempson/vim-tomorrow-theme'
  " NeoBundle 'morhetz/gruvbox'
  " NeoBundle 'altercation/vim-colors-solarized'
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
  " コード評価
  NeoBundle 'thinca/vim-quickrun'
  " コメントアウト
  NeoBundle 'tyru/caw.vim.git'

  " シンタックスチェック
  " NeoBundle 'scrooloose/syntastic'
  NeoBundle "jceb/vim-hier"
  NeoBundle "osyo-manga/shabadou.vim"
  NeoBundle "osyo-manga/vim-watchdogs"

  " Rails
  NeoBundle 'tpope/vim-rails'

  " if end など飛ぶ
  NeoBundle 'vimtaku/hl_matchit.vim.git'

  " end補完
  NeoBundle 'tpope/vim-endwise.git'

  " ifやtrueをスイッチ
  NeoBundle 'AndrewRadev/switch.vim'

  " 入力補助
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
  " log file
  NeoBundle 'vim-scripts/AnsiEsc.vim'

  " slim
  NeoBundle 'slim-template/vim-slim'

  " swift
  NeoBundle 'toyamarinyon/vim-swift'

  NeoBundle 'majutsushi/tagbar'
" }}}

  " powerline
  NeoBundle 'itchyny/lightline.vim'

" markdown {{{
  NeoBundle 'plasticboy/vim-markdown'
  NeoBundle 'kannokanno/previm'
  NeoBundle 'tyru/open-browser.vim'
" }}}

set rtp^=$GOPATH/src/github.com/nsf/gocode/vim

call neobundle#end()
filetype plugin indent on

NeoBundleCheck
