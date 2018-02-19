" to normal mode
inoremap <silent> jj <ESC>
inoremap <silent> jf <ESC>

" Emacs keybind
inoremap <silent> <C-n> <Down>
inoremap <silent> <C-p> <Up>
inoremap <silent> <C-b> <Left>
inoremap <silent> <C-f> <Right>
inoremap <silent> <C-a> <Home>
inoremap <silent> <C-e> <End>
inoremap <silent> <C-d> <Del>

" Swap ; and : in nomal mode only
nnoremap ; :
nnoremap : ;

" New line in normal mode
noremap <CR> o<ESC>

" Tab
nnoremap T :<C-u>tabnew<CR>
nnoremap H gt
nnoremap L gT

nnoremap sn gt
nnoremap sp gT
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap st :<C-u>tabnew<CR>

nnoremap <silent> <C-L> :noh<C-L><CR>

" quick closing
nnoremap W :<C-u>wq<CR>
nnoremap D :<C-u>q<CR>

"change display mapping
nmap <Down> <C-w>j
nmap <Up> <C-w>k
nmap <Left> <C-w>h
nmap <Right> <C-w>l
