if &compatible
 set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')

 call dein#load_toml('~/.vim/dein.toml', {'lazy' : 0})
 call dein#load_toml('~/.vim/deinlazy.toml', {'lazy' : 1})

 call dein#end()
 call dein#save_state()
endif

" if dein#check_install()
"   call dein#install()
" endif

filetype plugin indent on
syntax enable

set background=dark
set ambiwidth=double
set autoindent
set autoread
set backspace=indent,eol,start
set cindent
set cursorline
set cmdheight=1
set clipboard+=unnamed
set display=lastline
set encoding=utf-8
set expandtab
set hidden
set history=256
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set matchtime=1
set nobackup
set notitle
set noswapfile
set number
set pumheight=10
set re=1
set ruler
set shiftwidth=2
set showcmd
set showmatch
set showmode
set smartcase
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=0
set tabstop=2
set ttyfast
set vb t_vb=

setf text
let g:is_posix = 1

imap <C-j> <ESC>
inoremap <silent> jj <ESC>
inoremap <silent> jf <ESC>
inoremap <silent> <C-n> <Down>
inoremap <silent> <C-p> <Up>
inoremap <silent> <C-b> <Left>
inoremap <silent> <C-f> <Right>
inoremap <silent> <C-a> <Home>
inoremap <silent> <C-e> <End>
inoremap <silent> <C-d> <Del>
nnoremap ; :
nnoremap : ;
nnoremap <silent> <C-L> :noh<C-L><CR>
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap W :<C-u>wq<CR>
nnoremap D :<C-u>q<CR>

hi LineNr ctermfg=241
hi CursorLineNr ctermfg=166
hi MatchParen term=reverse cterm=bold ctermfg=brown ctermbg=darkcyan
hi Comment ctermfg=245
hi Normal ctermbg=None
hi clear CursorLine

autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead Gemfile.shared set filetype=ruby
autocmd BufNewFile,BufRead *.cap set filetype=ruby
autocmd BufNewFile,BufRead *.schema set filetype=ruby
autocmd BufNewFile,BufRead *.god set filetype=ruby
autocmd BufNewFile,BufRead *file set filetype=ruby
autocmd BufNewFile,BufRead Makefile set filetype=make
autocmd BufNewFile,BufRead Dockerfile set filetype=dockerfile
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead .itamae set filetype=yaml
autocmd BufNewFile,BufRead *.tex set filetype=tex
autocmd BufNewFile,BufRead *.yml.sample set filetype=yaml
autocmd BufNewFile,BufRead *.jelly set filetype=xml
autocmd BufNewFile,BufRead *.nas set filetype=asm
autocmd BufNewFile,BufRead *.img Vinarise
autocmd BufNewFile,BufRead *.applescript setl filetype=applescript
autocmd BufNewFile,BufRead default.conf setl filetype=apache
autocmd BufNewFile,BufRead rewrite.conf setl filetype=apache
autocmd BufNewFile,BufRead proxy.conf setl filetype=apache
autocmd BufNewFile,BufRead unicorn.conf setl filetype=ruby
autocmd BufNewFile,BufRead *.conf setl filetype=conf
autocmd BufNewFile,BufRead *.pp setl filetype=puppet
autocmd BufNewFile,BufRead xmobarrc setl filetype=haskell
autocmd BufNewFile,BufRead *.ex setl filetype=elixir
autocmd BufNewFile,BufRead *.c setl filetype=c tabstop=4 shiftwidth=4 noexpandtab
autocmd BufNewFile,BufRead Makefile setl filetype=make tabstop=4 shiftwidth=4 noexpandtab
autocmd BufNewFile,BufRead *.scpt.erb set filetype=applescript
autocmd BufNewFile,BufRead .md2key set filetype=yaml
autocmd BufNewFile,BufRead *.al set filetype=ruby
autocmd BufNewFile,BufRead insns.def set filetype=cruby
autocmd BufNewFile,BufRead *.iam set filetype=ruby
autocmd BufNewFile,BufRead *.elb set filetype=ruby
autocmd BufNewFile,BufRead *.route set filetype=ruby
autocmd BufNewFile,BufRead *.group set filetype=ruby
autocmd BufNewFile,BufRead *.go setl filetype=go tabstop=4 shiftwidth=4 noexpandtab
autocmd BufNewFile,BufRead Jenkinsfile setl filetype=groovy tabstop=4 shiftwidth=4 noexpandtab
autocmd BufNewFile,BufRead *.jsonnet setl nocindent autoindent
autocmd BufNewFile,BufRead *.mtail set filetype=mtail
