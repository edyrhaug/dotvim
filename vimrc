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
colorscheme material
"highlight LineNr ctermfg=60 ctermbg=6
highlight Pmenu ctermbg=234 guibg=#365663
highlight Normal guibg=#0d1a2c

" Custom material diff highlight colors:
highlight diffChange ctermbg=234 gui=none guifg=none guibg=#343E4A
highlight diffAdd ctermbg=2 ctermfg=0 gui=none guifg=#263238 guibg=#c3e88d
highlight diffDelete ctermbg=1 ctermfg=0 gui=none guifg=#FF8A80 guibg=#263238
highlight diffText ctermbg=220 ctermfg=0 gui=none guifg=#263238 guibg=#fae284

highlight Visual guibg=#546E7A guifg=none

nmap du :diffupdate<CR>

set hlsearch
nnoremap <silent> \\ :noh<return> \| :pc<return>

nmap <C-l> <C-w>l
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
set splitbelow
set splitright

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

" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction
" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction
" Highlight currently open buffer in NERDTree
autocmd BufRead * call SyncTree()

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
