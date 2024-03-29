set runtimepath=~/noasp_jobs/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/noasp_jobs/.vim/after
call pathogen#infect('~/noasp_jobs/.vim/bundle')

set nocompatible

set directory=~/noasp_jobs/.vim/.swp//

filetype plugin indent on

syntax enable
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=0
set number
colorscheme solarized
"highlight LineNr ctermfg=60 ctermbg=6

set hlsearch

set list
set listchars=tab:▸\ ,trail:~,extends:>,precedes:<

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Use noexpandtab for smarty files (ojs)
autocmd Filetype smarty setlocal noexpandtab

set wildmode=longest,list,full
set wildmenu

set hidden

set showcmd

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:rspec_command = "Dispatch rspec {spec}"

command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction
