" to Normal Mode
inoremap <silent> jj <ESC>
inoremap <silent> jf <ESC>
imap <C-j> <ESC>

" Emacs-like in editing
inoremap <silent> <C-n> <Down>
inoremap <silent> <C-p> <Up>
inoremap <silent> <C-b> <Left>
inoremap <silent> <C-f> <Right>
inoremap <silent> <C-a> <Home>
inoremap <silent> <C-e> <End>
inoremap <silent> <C-d> <Del>

" Swap ; and : only when nomal mode
nnoremap ; :
nnoremap : ;

noremap <CR> o<ESC>

" Tab
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
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

nnoremap <silent> <C-L> :noh<C-L><CR>

" quick closing
nnoremap W :<C-u>wq<CR>
nnoremap D :<C-u>q<CR>

"change display mapping
nmap <Down> <C-w>j
nmap <Up> <C-w>k
nmap <Left> <C-w>h
nmap <Right> <C-w>l
"hide hlsearch
nnoremap <silent><Esc><Esc> :<C-u>nohlsearch<CR>

"vertical size adjust '<' '>'
nnoremap <silent>< <C-w><
nnoremap <silent>> <C-w>>
"horizonal size adjust '+' '-'
noremap <silent>+ <C-w>+
noremap <silent>- <C-w>-
" Y => y$
nnoremap Y y$

" vimdiff => :Diff
command! -nargs=1 -complete=file Diff vertical diffsplit <args>

" terminal mode
if has('nvim')
  tnoremap <silent> <ESC> <C-\><C-n>
endif

