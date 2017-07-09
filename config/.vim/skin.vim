filetype plugin indent on     " required!
filetype indent on

set notitle       " 起動時に非表示
set number        " 行番号表示
set showmatch     " 対応する括弧を表示
set showcmd       " コマンドをステータス行に表示
set laststatus=2  " 常にステータス行を表示

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" コマンド実行中は再描画しない
set lazyredraw
" 高速ターミナル接続を行う
set ttyfast

syntax on
colorscheme molokai
set background=dark

" hybrid
" let g:hybrid_custom_term_colors = 1
" let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
" colorscheme hybrid

" hi LineNr ctermbg=233 ctermfg=239
hi LineNr ctermfg=241
" hi CursorLineNr ctermbg=233 ctermfg=166
hi CursorLineNr ctermfg=166
hi MatchParen term=reverse cterm=bold ctermfg=brown ctermbg=darkcyan
hi Comment ctermfg=245
set cursorline    " 現在行ハイライト
hi clear CursorLine


set ambiwidth=double
highlight Normal ctermbg=None
