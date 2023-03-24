set nocompatible

set directory=~/noasp_jobs/.vim/.swp//

" minpac:
set packpath^=~/noasp_jobs/.vim
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-rails')
call minpac#add('tpope/vim-bundler')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-repeat')
call minpac#add('scrooloose/nerdtree')
call minpac#add('vim-ruby/vim-ruby')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('wincent/Command-T')
call minpac#add('tpope/vim-dispatch')
call minpac#add('thoughtbot/vim-rspec')
call minpac#add('altercation/vim-colors-solarized')
call minpac#add('cespare/vim-toml')
call minpac#add('christoomey/vim-tmux-navigator')
call minpac#add('pangloss/vim-javascript')
call minpac#add('mxw/vim-jsx')
call minpac#add('elzr/vim-json')
call minpac#add('w0rp/ale')
call minpac#add('kaicataldo/material.vim')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('edkolev/tmuxline.vim')
call minpac#add('mattn/emmet-vim')
call minpac#add('posva/vim-vue')
" call minpac#add('junegunn/fzf.vim')
" call minpac#add('SirVer/ultisnips')

" minpac commands:
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

filetype plugin indent on

syntax enable
set t_Co=256
colorscheme material
set background=dark
"let g:solarized_termcolors=256
"let g:solarized_termtrans=0
set number
"colorscheme solarized
"highlight LineNr ctermfg=60 ctermbg=6
let g:airline_theme='base16color'
let g:Powerline_symbols = 'fancy'

set hlsearch

set list
set listchars=tab:▸\ ,trail:~,extends:>,precedes:<

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

"uncomment next two lines if annoying or perf issues:
"let g:ale_lint_on_save = 1
"let g:ale_lint_on_text_changed = 0
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '->'
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\}
nmap <silent> [w <Plug>(ale_previous_wrap)
nmap <silent> ]w <Plug>(ale_next_wrap)
nmap <leader>w :ALEFix<cr>
let g:ale_statusline_format = ['X %d', '? %d', '']
let g:ale_echo_msg_format = '%linter% says %s'
highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)

" Use noexpandtab for smarty files (ojs)
autocmd Filetype smarty setlocal noexpandtab
autocmd Filetype less setlocal noexpandtab
autocmd Filetype php setlocal noexpandtab

set wildmode=longest,list,full
set wildmenu
set path+=**
set wildignore+=*/node_modules/*,*/vendor/*

" FZF Mapping selecting mappings
" nmap <leader><tab> <plug>(fzf-maps-n)
" xmap <leader><tab> <plug>(fzf-maps-x)
" omap <leader><tab> <plug>(fzf-maps-o)

" FZF Insert mode completion
" imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
" imap <c-x><c-j> <plug>(fzf-complete-file-ag)
" imap <c-x><c-l> <plug>(fzf-complete-line)
" set rtp+=/usr/local/opt/fzf

set hidden

set showcmd

" clear current searchhl
nnoremap <silent> \\ :noh<return>

"nnoremap <BS> <C-^>

" split nav
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

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

