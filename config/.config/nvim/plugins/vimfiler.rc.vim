let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_edit_action = 'tabopen'
let g:vimfiler_enable_auto_cd = 1
let g:vimfiler_as_default_explorer = 1
nnoremap <silent> <Leader>e :<C-U>VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit<CR>
nnoremap <silent> <Leader>E :<C-U>VimFiler<CR>

call vimfiler#custom#profile('default', 'context', {
     \ 'safe' : 0,
     \ 'auto_expand' : 1,
     \ 'parent' : 0,
     \ })
"default explore -> vimfiler
let g:vimfiler_as_default_explorer = 1
"buffer directory
nnoremap <silent> fe :<C-u>VimFilerBufferDir -quit<CR>
" Nerdtree like
nnoremap <C-e> :<C-u>VimFilerBufferDir -split -winwidth=120 -toggle -no-quit<CR>
"key mapping
autocmd MyAutoCmd FileType vimfiler call s:vimfiler_my_settings()
function! s:vimfiler_my_settings()
  nnoremap <silent><buffer><expr> s vimfiler#do_switch_action('vsplit')
  nnoremap <silent><buffer><expr> v vimfiler#do_switch_action('split')
  nnoremap <silent><buffer><expr> t vimfiler#do_action('tabopen')
endfunction

" Textmate icons
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = ' '
let g:vimfiler_marked_file_icon = '*'
