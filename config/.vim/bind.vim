" to Normal Mode
inoremap <silent> jj <ESC>
inoremap <silent> jf <ESC>
imap <C-j> <ESC>

" 挿入モード emacs風移動
inoremap <silent> <C-n> <Down>
inoremap <silent> <C-p> <Up>
inoremap <silent> <C-b> <Left>
inoremap <silent> <C-f> <Right>
inoremap <silent> <C-a> <Home>
inoremap <silent> <C-e> <End>
inoremap <silent> <C-d> <Del>

" ノーマルモード時だけ ; と : を入れ替える
nnoremap ; :
nnoremap : ;

" ノーマルモードでエンターキー改行
noremap <CR> o<ESC>


" 行末までヤンク
nnoremap Y y$

" タブ操作
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>

""" タブ移動
" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

" map <silent> [Tag]c :tablast <bar> tabnew<CR>
" " tc 新しいタブを一番右に作る
" map <silent> [Tag]x :tabclose<CR>
" " tx タブを閉じる
" map <silent> [Tag]n :tabnext<CR>
" " tn 次のタブ
" map <silent> [Tag]p :tabprevious<CR>
" " tp 前のタブ

nnoremap <silent> <C-L> :noh<C-L><CR>

" vimshell
nnoremap <Space>vs :VimShell<Enter>


" nnoremap <Space>h ^
" nnoremap <Space>l $
" nnoremap H ^
" nnoremap L $


" vimgrep
nmap <C-G> :Vimgrep /\<<C-R><C-W>\>/ %
autocmd QuickFixCmdPost *grep* cwindow

" quick
nnoremap W :<C-u>wq<CR>
nnoremap D :<C-u>q<CR>

" sudo
cabbr w!! w !sudo tee > /dev/null %
