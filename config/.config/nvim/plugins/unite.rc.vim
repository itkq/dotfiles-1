" start with insert mode
let g:unite_enable_start_insert = 1

" case-insensitive
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

if executable('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
  let g:unite_source_grep_recursive_opt=''
elseif executable('ack')
  let g:unite_source_grep_command='ack'
  let g:unite_source_grep_default_opts='--no-heading --no-color -C4'
  let g:unite_source_grep_recursive_opt=''
endif

nmap <space> [unite]
nnoremap [unite] <nop>
let g:unite_data_directory = '~/.unite'

nnoremap <silent> [unite]l :<C-u>Unite outline<CR>

" File searching using <space>f
nnoremap <silent> [unite]f :<C-u>Unite -no-split -buffer-name=files -profile-name=buffer -auto-preview file_rec/async:!<cr>

" File search under directory
nnoremap <silent> [unite]o :<C-u>UniteWithBufferDir -buffer-name=files file -auto-preview<cr>

" Tab
nnoremap <silent> [unite]t :<C-u>Unite tab<cr>

" Everything using <space>a
nnoremap <silent> [unite]a :<C-u>Unite -no-split -buffer-name=files buffer file_mru bookmark file:<cr>

" Grepping using <space>gn
nnoremap <silent> [unite]gn :<C-u>Unite -no-quit -buffer-name=search grep:.<cr>

" Yank history using <space>y
let g:unite_source_history_yank_enable = 1
nnoremap <silent> [unite]y :<C-u>Unite -no-split -buffer-name=yank history/yank:<cr>

" Buffer switching using <space>s
nnoremap <silent> [unite]s :<C-u>Unite -no-split -buffer-name=buffers -auto-preview buffer:<cr>

" Buffer and recent using <space>r
nnoremap <silent> [unite]r :<C-u>Unite -no-split -buffer-name=mru buffer file_mru:<cr>

" Bookmark using <space>b
nnoremap <silent> [unite]b :<C-u>Unite -no-split -buffer-name=bookmark bookmark:<cr>

" Add bookmark using <space>x
nnoremap <silent> [unite]x :<C-u>UniteBookmarkAdd<cr>

" Everything using <space>a
nnoremap <silent> [unite]a :<C-u>Unite -no-split -buffer-name=files buffer file_mru bookmark file:<cr>


" giti
nnoremap <silent> [unite]gs :<C-u>Unite giti/status -no-start-insert -buffer-name=giti/status<cr>
nnoremap <silent> [unite]gb :<C-u>Unite giti/branch -buffer-name=giti/branch<cr>
nnoremap <silent> [unite]gl :<C-u>Unite giti/log -buffer-name=giti/log<cr>

augroup MyUniteCmd
  autocmd!
  autocmd FileType unite call <SID>unite_my_settings_new()
augroup END
function! s:unite_my_settings_new()
  let profile_name = substitute(unite#get_current_unite().profile_name, '[-/]', '_', 'g')
  if !empty(profile_name) && has_key(s:unite_hooks, profile_name)
    call s:unite_hooks[profile_name]()
  endif
endfunction

let s:unite_hooks = {}
function! s:unite_hooks.giti_status()
  " nnoremap <silent><buffer><expr>gM unite#do_action('ammend')
  " nnoremap <silent><buffer><expr>gm unite#do_action('commit')
  nnoremap <silent><buffer><expr>ga unite#do_action('stage')
  nnoremap <silent><buffer><expr>gc unite#do_action('checkout')
  nnoremap <silent><buffer><expr>gd unite#do_action('diff')
  nnoremap <silent><buffer><expr>gu unite#do_action('unstage')
endfunction

function! s:unite_hooks.source_giti_branch()
  nnoremap <silent><buffer><expr>d unite#do_action('delete')
  nnoremap <silent><buffer><expr>D unite#do_action('delete_force')
endfunction

function! s:unite_hooks.source_giti_branch_all()
  call s:unite_hooks.source_giti_branch()
endfunction

function! s:unite_hooks.source_giti_log()
  nnoremap <silent><buffer><expr>gd unite#do_action('diff')
  nnoremap <silent><buffer><expr>d unite#do_action('diff')
endfunction




" Help using <space>h
" nnoremap <silent> [unite]h :<C-u>Unite -no-split -buffer-name=help help:<cr>

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  let b:SuperTabDisabled=1
  imap <buffer> <C-j>     <Plug>(unite_select_next_line)
  imap <buffer> <C-k>     <Plug>(unite_select_previous_line)

  " Double tapping <Esc> closes unite
  nmap <silent> <buffer> <Esc><Esc> <Plug>(unite_exit)
  imap <silent> <buffer> <Esc><Esc> <Plug>(unite_exit)
endfunction

" grep on cursor word
" nnoremap <silent> [unite]gc :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" mapping on unite
" autocmd FileType unite call s:unite_my_settings()
" function! s:unite_my_settings()"{{{
"   " C-j : open vertical split
"   nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
"   inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
"   " C-l : open hori zontal s plit
"   nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
"   inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" endfunction"}}}
  " " C-o : open here
  " nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  " inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')

nnoremap sT :<C-u>Unite tab<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>
