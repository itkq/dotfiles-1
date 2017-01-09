" indentline {{{
  let g:indentLine_color_term = 237
  let g:indentLine_color_gui = '#3c444d'
  let g:indentLine_char = '¦'
" }}}

" 自分用 snippet ファイルの場所 (任意のパス)
let g:neosnippet#snippets_directory = '~/dotfiles/snippets/'

" markdown {{{
  au BufRead,BufNewFile *.md set filetype=markdown
" }}}

" vim.filer {{{
  if neobundle#is_installed('vimfiler')
    " Enable file operation commands.
    let g:vimfiler_safe_mode_by_default = 0
    let g:vimfiler_edit_action = 'tabopen'
    let g:vimfiler_enable_auto_cd = 1
    let g:vimfiler_as_default_explorer = 1
    nnoremap <silent> <Leader>e :<C-U>VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit<CR>
    nnoremap <silent> <Leader>E :<C-U>VimFiler<CR>
  endif
" }}}

" lightline {{{
  let g:lightline = {
        \ 'mode_map': { 'c': 'NORMAL' },
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'LightLineModified',
        \   'readonly': 'LightLineReadonly',
        \   'fugitive': 'LightLineFugitive',
        \   'filename': 'LightLineFilename',
        \   'fileformat': 'LightLineFileformat',
        \   'filetype': 'LightLineFiletype',
        \   'fileencoding': 'LightLineFileencoding',
        \   'mode': 'LightLineMode',
        \ },
        \ }

  function! LightLineModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
  endfunction

  function! LightLineReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
  endfunction

  function! LightLineFilename()
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
          \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
          \  &ft == 'unite' ? unite#get_status_string() :
          \  &ft == 'vimshell' ? vimshell#get_status_string() :
          \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
          \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
  endfunction

  function! LightLineFugitive()
    if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
      let _ = fugitive#head()
      return strlen(_) ? '⭠ '._ : ''
    endif
    return ''
  endfunction

  function! LightLineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
  endfunction

  function! LightLineFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
  endfunction

  function! LightLineFileencoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
  endfunction

  function! LightLineMode()
    return winwidth(0) > 60 ? lightline#mode() : ''
  endfunction
" " }}}

" Easymotion {{{
  " let g:EasyMotion_leader_key = ';'
  " let g:EasyMotion_do_mapping = 0

  nmap <Space>s <Plug>(easymotion-s2)
  " nmap s <Plug>(easymotion-s2)
  " xmap s <Plug>(easymotion-s2)
  " omap z <Plug>(easymotion-s2)

  " nmap s <Plug>(easymotion-s2)
  " map <Space> <Plug>(easymotion-s2)

  " Turn on case sensitive feature
  let g:EasyMotion_smartcase = 1

  " `JK` Motions: Extend line motions
  map <Leader>j <Plug>(easymotion-j)
  map <Leader>k <Plug>(easymotion-k)

  " keep cursor column with `JK` motions
  " let g:EasyMotion_startofline = 0

  " let g:EasyMotion_keys = ';hklyuiopnm,qwertasdgzxcvbjf'

  " Show target key with upper case to improve readability
  " let g:EasyMotion_use_upper = 1
  " Jump to first match with enter & space
  " let g:EasyMotion_enter_jump_first = 1
  " let g:EasyMotion_space_jump_first = 1
" }}}

"<CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() :
  "\<CR>"
endfunction

" switch.vim {{{
  nnoremap <Space>c  :<C-u>Switch<CR>
" }}}

" caw.vim {{{
  nmap <C-c>  <Plug>(caw:i:toggle)
  vmap <C-c>  <Plug>(caw:i:toggle)
" }}}

""" neocomplete {{{
  " Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

  " Define dictionary.
  let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
          \ }

  " Define keyword.
  if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  " Plugin key-mappings.
  inoremap <expr><C-g>     neocomplete#undo_completion()
  inoremap <expr><C-l>     neocomplete#complete_common_string()

  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
  endfunction
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplete#close_popup()

  " inoremap <expr><C-e>  neocomplete#cancel_popup()
  " Close popup by <Space>.
  "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

  " For cursor moving in insert mode(Not recommended)
  "inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
  "inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
  "inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
  "inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
  " Or set this.
  "let g:neocomplete#enable_cursor_hold_i = 1
  " Or set this.
  "let g:neocomplete#enable_insert_char_pre = 1

  " AutoComplPop like behavior.
  "let g:neocomplete#enable_auto_select = 1

  " Shell like behavior(not recommended).
  "set completeopt+=longest
  "let g:neocomplete#enable_auto_select = 1
  "let g:neocomplete#disable_auto_complete = 1
  "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
  au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
  set completeopt=menuone,menu,longest

  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

  " Enable heavy omni completion.
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
  "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

  " For perlomni.vim setting.
  " https://github.com/c9s/perlomni.vim
  let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
""" }}}

""" neosunippets {{{
  " Plugin key-mappings.
  imap <C-K>     <Plug>(neosnippet_expand_or_jump)
  smap <C-K>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-K>     <Plug>(neosnippet_expand_target)

  " SuperTab like snippets behavior.
  "imap <expr><TAB>
  " \ pumvisible() ? "\<C-n>" :
  " \ neosnippet#expandable_or_jumpable() ?
  " \    "\<TAB>" : "\<Plug>(neosnippet_expand_or_jump)"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

  " For conceal markers.
  if has('conceal')
    set conceallevel=2 concealcursor=niv
  endif
""" }}}

" smartchr {{{
    " inoremap <buffer> <expr> = smartchr#loop(' = ', ' == ', '=')
    " inoremap <buffer> <expr> <S-=> smartchr#loop(' + ', '+')
    " inoremap <buffer> <expr> - smartchr#loop(' - ', '-')
    " inoremap <buffer> <expr> , smartchr#loop(', ', ',')
" }}}

" expand-region {{{
    vmap v <Plug>(expand_region_expand)
    vmap <C-v> <Plug>(expand_region_shrink)
" }}}

NeoBundleLazy 'lambdalisue/unite-grep-vcs', {
    \ 'autoload': {
    \    'unite_sources': ['grep/git', 'grep/hg'],
    \}}

" Gitv {{{
  function! s:gitv_get_current_hash()
    return matchstr(getline('.'), '\[\zs.\{7\}\ze\]$')
  endfunction

  autocmd FileType git setlocal nofoldenable foldlevel=0
  function! s:toggle_git_folding()
    if &filetype ==# 'git'
      setlocal foldenable!
    endif
  endfunction

  autocmd FileType gitv call s:my_gitv_settings()
  function! s:my_gitv_settings()
    setlocal iskeyword+=/,-,.
    nnoremap <silent><buffer> C :<C-u>Git checkout <C-r><C-w><CR>
    nnoremap <silent><buffer> t :<C-u>windo call <SID>toggle_git_folding()<CR>1<C-w>w
  endfunction

  nnoremap <buffer> <Space>rb :<C-u>Git rebase <C-r>=GitvGetCurrentHash()<CR><Space>
  nnoremap <buffer> <Space>R :<C-u>Git revert <C-r>=GitvGetCurrentHash()<CR><CR>
  nnoremap <buffer> <Space>h :<C-u>Git cherry-pick <C-r>=GitvGetCurrentHash()<CR><CR>
  nnoremap <buffer> <Space>rh :<C-u>Git reset --hard <C-r>=GitvGetCurrentHash()<CR>
" }}}


" fugitive {{{
  nnoremap <silent>gca :Gcommit --amend<CR>
  nnoremap <silent>gb :Gblame<CR>
  nnoremap <silent>gB :Gbrowse<CR>
  nnoremap <silent>gco :Gcommit<CR>
" }}}
"
" Quickrun
let g:quickrun_config = {
\   "_" : {
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 40,
\       'outputter' : 'error',
\   }
\}
let g:quickrun_config["latexmk"] = {
            \ 'command'   : 'latexmk',
            \ 'outputter/error/error' : 'quickfix',
            \ 'exec'      : '%c',
            \ }
autocmd BufWritePost *.tex :QuickRun latexmk

let g:quickrun_config["gobuild"] = {
            \ 'command'   : 'go',
            \ 'cmdopt'    : '-o /dev/null ./...',
            \ 'exec'      : '%c build %o',
            \ 'errorformat': '%f:%l: %m,%-G%.%#',
            \ 'outputter/error/success' : 'buffer',
            \ 'outputter/error/error'   : 'quickfix',
            \ 'outputter/buffer/split'  : ':rightbelow 8sp',
            \ 'outputter/buffer/close_on_empty' : 1,
            \ }
autocmd BufWritePost *.go :QuickRun gobuild


" for golang {{{
  " set path+=$GOPATH/src/**
  " let g:gofmt_command = 'goimports'
  " au BufWritePre *.go Fmt
  " au BufNewFile,BufRead *.go set sw=4 noexpandtab ts=4 completeopt=menu,preview
  " au FileType go compiler go
" }}}


" VimFilerTree {{{
command! VimFilerTree call VimFilerTree(<f-args>)
function! VimFilerTree(...)
  let l:h = expand(a:0 > 0 ? a:1 : '%:p:h')
  let l:path = isdirectory(l:h) ? l:h : ''
  exec ':VimFiler -buffer-name=explorer -split -simple -winwidth=45 -toggle -no-quit ' . l:path
  wincmd t
  setl winfixwidth
endfunction

autocmd! FileType vimfiler call g:my_vimfiler_settings()
function! g:my_vimfiler_settings()
  nmap     <buffer><expr><CR> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
  nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<CR>
  nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<CR>
endfunction

let my_action = {'is_selectable' : 1}
function! my_action.func(candidates)
    wincmd p
    exec 'split '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_split', my_action)

let my_action = {'is_selectable' : 1}
function! my_action.func(candidates)
    wincmd p
    exec 'vsplit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_vsplit', my_action)
" }}}

" Dash {{{{
  nmap <silent> <Leader>d <Plug>DashSearch
" }}}}

" vim-bad-whitespace {{{
  autocmd FileType unite call s:unite_settings()
  function! s:unite_settings()
    " Not showing the trailing space as red if has vim-trailing-color installed
    autocmd InsertLeave <buffer> match ExtraWhitespace //
    autocmd InsertEnter <buffer> match ExtraWhitespace //
    autocmd BufWinEnter <buffer> match ExtraWhitespace //
    " Other Customizations
  endfunction
  let g:extra_whitespace_ignored_filetypes = ['unite']
" }}}

" filetype plugin on
" let tex_flavor = 'latex'
" set grepprg=grep\ -nH\ $*
" set shellslash
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf= 'docker run --rm -v $(pwd):/var/texlive texlive2015 latexmk'
let g:Tex_ViewRule_pdf = 'open -ga /Applications/Skim.app'
let g:tex_conceal=''
" let g:Tex_FormatDependency_pdf = 'dvi,pdf'

" vim-auto-save {{{
  " let g:auto_save = 1
  " let g:auto_save_in_insert_mode = 0
" }}}


" Watchdog
" 書き込み後にシンタックスチェックを行う
let g:watchdogs_check_BufWritePost_enable = 1
let s:config = {
\   "watchdogs_checker/_" : {
\       "hook/u_nya_/enable" : 1,
\       "hook/inu/enable" : 0,
\       "hook/unite_quickfix/enable" : 0,
\       "hook/echo/enable" : 0,
\       "hook/back_buffer/enable" : 0,
\       "hook/close_unite_quickfix/enable" : 0,
\       "hook/close_buffer/enable_exit" : 0,
\       "hook/close_quickfix/enable_exit" : 1,
\       "hook/redraw_unite_quickfix/enable_exit" : 0,
\       "hook/close_unite_quickfix/enable_exit" : 1,
\   },
\   "haskell/watchdogs_checker" : {
\       "type" : "watchdogs_checker/hlint",
\   },
\
\   "watchdogs_checker/msvc" : {
\       "hook/msvc_compiler/enable" : 1,
\       "hook/msvc_compiler/target" : "c:/program files/microsoft visual studio 10.0",
\       "hook/output_encode/encoding" : "sjis",
\       "cmdopt" : "/Zs ",
\   },
\
\   "watchdogs_checker/g++" : {
\       "cmdopt" : "-std=gnu++0x -Wall",
\   },
\
\   "watchdogs_checker/clang++" : {
\       "cmdopt" : "-std=c++14 -g3 -Wall",
\   },
\
\   "watchdogs_checker/ruby" : {
\       "cmdopt" : "-cw",
\   },
\
\   "python/watchdogs_checker" : {
\       "type" : "watchdogs_checker/pyflakes",
\   },
\
\   "watchdogs_checker/pyflakes" : {
\       "command" : "c:/python27/scripts/pyflakes",
\   },
\
\}

" call extend(g:quickrun_config, s:config)
unlet s:config

" watchdogs.vim の設定を追加
call watchdogs#setup(g:quickrun_config)

" lexima.vim
" let g:lexima_no_default_rules = 1
" call lexima#set_default_rules()
"
" function! s:set_lexima(rule)
"     call lexima#add_rule(a:rule)
"     let ignore_rule = a:rule
"     let ignore_rule.syntax = ["String", "Comment"]
"     let ignore_rule.input = ignore_rule.char
"     call lexima#add_rule(ignore_rule)
" endfunction
"
"
" call s:set_lexima({'at': '\%#',     'char': '[',    'input': '[]<Left>'})
" call s:set_lexima({'at': '\%#]',    'char': '[',    'input': '['})
" call s:set_lexima({'at': '\[\%#\]', 'char': ']',    'input': '<Right>'})
" call s:set_lexima({'at': '\[\%#\]', 'char': '[',    'input': '[]<Left>'})
" call s:set_lexima({'at': '\[\%#\]', 'char': '<BS>', 'input': '<BS><Del>'})
"
"
" for [begin, end] in [['(', ')'], ['{', '}']]
"     let bracket = begin.end
"     call s:set_lexima({'at': '\%#',     'char': begin, 'input': bracket.'<Left>'})
"     call s:set_lexima({'at': '\%#'.end, 'char': begin, 'input': begin})
"
"     call s:set_lexima({'at': begin.'\%#'.end, 'char': end,   'input': '<Right>'})
"     call s:set_lexima({'at': begin.'\%#'.end, 'char': begin, 'input': bracket.'<Left>'})
"     call s:set_lexima({'at': begin.'\%#'.end, 'char': '<BS>', 'input': '<BS><Del>'})
" endfor
