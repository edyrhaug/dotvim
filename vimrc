call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible

filetype plugin indent on

set t_Co=256
color molokai
syntax on
set number

set hlsearch

set expandtab
set shiftwidth=2
set softtabstop=2

set hidden

command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction
