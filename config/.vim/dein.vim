if &compatible
  set nocompatible
endif
set runtimepath+=~/.config/nvim/plugin/repos/github.com/Shougo/dein.vim

if dein#load_state({path to plugin base path directory})
  call dein#begin({path to plugin base path directory})

  " call dein#add({path to dein.vim directory})
  " call dein#add('Shougo/neocomplete.vim')
  " ...
  "
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
