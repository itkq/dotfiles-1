set hidden        " 編集中でも他のファイルを開く
set autoread      " 外部的に書き換えたら自動読み込み
set nobackup      " バックアップ無効
set noswapfile    " スワップファイル無効
set encoding=utf-8
set laststatus=1

"検索時にインクリメンタルサーチを行う
set incsearch
set showmode
"コマンドラインの履歴の保存数
set history=256
"インデント
set autoindent
set smartindent
set smarttab
"タブ幅
set tabstop=2
"タブを空白に置き換える
set expandtab
set softtabstop=2
set shiftwidth=2
set backspace=indent,eol,start

"Cインデント
set cindent
"ルーラーを表示
set ruler
set ignorecase

" コマンドウィンドウの高さ
set cmdheight=1
set showcmd

" case-insentive when searching only lower case
set smartcase

set display=lastline
set pumheight=10
set showmatch
set matchtime=1

" beep
set vb t_vb=

" clipboard
if !has('nvim')
  set clipboard=unnamed,autoselect
endif

au BufNewFile,BufRead *.c    set expandtab tabstop=4 shiftwidth=4 softtabstop=4
au BufNewFile,BufRead *.cpp  set expandtab tabstop=4 shiftwidth=4 softtabstop=4
au BufNewFile,BufRead *.h    set expandtab tabstop=4 shiftwidth=4 softtabstop=4
au BufNewFile,BufRead *.php  set expandtab tabstop=4 shiftwidth=4 softtabstop=4
au BufNewFile,BufRead *.js   set expandtab tabstop=2 shiftwidth=2 softtabstop=2


" コメント行後の自動整形をやめる
setlocal formatoptions-=r
setlocal formatoptions-=o

" 自動インデントやめる
set noautoindent

set tags=tags

function! s:remove_dust()
  if &ft =~ 'markdown'
    return
  endif
  let cursor = getpos(".")
  " 保存時に行末の空白を除去する
  %s/\s\+$//ge
  " 保存時にtabを2スペースに変換する
  " %s/\t/  /ge
  call setpos(".", cursor)
  unlet cursor
endfunction
autocmd BufWritePre * call <SID>remove_dust()
