" Override color settings

autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight SignColumn ctermbg=None
autocmd ColorScheme * highlight LineNr ctermbg=none
autocmd ColorScheme * highlight CursorLine ctermbg=234 guifg=234
" hi CursorLine guifg=#E19972

if has('unix')
  autocmd MyAutoCmd ColorScheme * hi SpecialKey ctermfg=darkmagenta ctermbg=none
else
  autocmd MyAutoCmd ColorScheme * hi SpecialKey ctermfg=darkmagenta
endif

" highlighting zenkaku space
autocmd MyAutoCmd BufRead,BufNew * match Error /　/
