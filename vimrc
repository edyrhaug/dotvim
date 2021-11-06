set nocompatible

set directory=~/.vim/.swp//

" minpac:
packadd cfilter
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-rhubarb')
call minpac#add('tpope/vim-rails')
call minpac#add('tpope/vim-bundler')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-fireplace')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-abolish')
call minpac#add('scrooloose/nerdtree')
call minpac#add('vim-ruby/vim-ruby')
call minpac#add('tpope/vim-unimpaired')
" call minpac#add('wincent/Command-T') "fzf ftw
call minpac#add('tpope/vim-dispatch')
call minpac#add('thoughtbot/vim-rspec')
call minpac#add('altercation/vim-colors-solarized')
call minpac#add('cespare/vim-toml')
call minpac#add('christoomey/vim-tmux-navigator')
call minpac#add('pangloss/vim-javascript')
call minpac#add('MaxMEllon/vim-jsx-pretty')
" call minpac#add('kchmck/vim-coffee-script')
" call minpac#add('mtscout6/vim-cjsx')
" call minpac#add('mxw/vim-jsx') "deprecated , replaced by vim-jsx-pretty
call minpac#add('posva/vim-vue')
call minpac#add('leafgarland/typescript-vim')
call minpac#add('Quramy/tsuquyomi')
call minpac#add('elzr/vim-json')
" call minpac#add('dense-analysis/ale')
call minpac#add('neoclide/coc.nvim', {'branch': 'release'})
call minpac#add('ackyshake/Spacegray.vim')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('edkolev/tmuxline.vim')
call minpac#add('mattn/emmet-vim')
call minpac#add('junegunn/fzf', { 'do': { -> fzf#install() } })
call minpac#add('junegunn/fzf.vim')
call minpac#add('tomtom/tcomment_vim')
call minpac#add('chrisbra/Colorizer')
" call minpac#add('prabirshrestha/vim-lsp')
" call minpac#add('mattn/vim-lsp-settings')
" call minpac#add('prabirshrestha/asyncomplete.vim')
" call minpac#add('prabirshrestha/asyncomplete-lsp.vim')
" call minpac#add('SirVer/ultisnips')

" minpac commands:
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

command! Greview :Git! diff --staged

filetype plugin indent on

syntax enable
set t_Co=256
colorscheme spacegray
let g:spacegray_low_contrast = 1
set background=dark
let g:spacegray_termcolors=256
"let g:solarized_termtrans=0
set number
"colorscheme solarized
" highlight LineNr ctermfg=6 ctermbg=60
" highlight SignColumn ctermbg=DarkGreen
highlight Pmenu ctermbg=234 guibg=234

let g:airline_theme='base16color'
let g:Powerline_symbols = 'fancy'

set hlsearch

set list
set listchars=tab:▸\ ,trail:~,extends:>,precedes:<

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set sidescroll=1
set mouse=a
set cmdheight=2

let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0


"navigate pop-up menu with Ctrl j/k
inoremap <expr> <c-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <c-k> pumvisible() ? "\<C-P>" : "\<C-k>"

"Coc, you're a Coc, you're a Coc!
"--------------------------------
set updatetime=300
set shortmess+=c
set signcolumn=number

"Tab completion:
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>o  <Plug>(coc-format-selected)
nmap <leader>o  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"--------------------------------
"/end of Coc


"uncomment next two lines if annoying or perf issues:
"let g:ale_lint_on_save = 1
"let g:ale_lint_on_text_changed = 0
" let g:ale_sign_error = '●'
" let g:ale_sign_warning = '▪︎'
" let g:ale_fixers = {
" \   'javascript': ['eslint'],
" \   'ruby': ['rubocop'],
" \}

" "COMMENTED OUT TO TRY LSP RUST WORKFLOW
" "(TODO: Make autocmd or similar to have both depending on filetype maybe?)
" nmap <silent> [w <Plug>(ale_previous_wrap)
" nmap <silent> ]w <Plug>(ale_next_wrap)
" nmap <leader>w :ALEFix<cr>
" nmap <Leader>gd :ALEGoToDefinition<cr>
" nmap <Leader>gr :ALEFindReferences<cr>
" nmap <Leader>gh :ALEHover<cr>

"COMMENTED OUT TO DO RUBY AGAIN
" nmap <silent> [w :LspPreviousDiagnostic<cr>
" nmap <silent> ]w :LspNextDiagnostic<cr>
" nmap <leader>w :LspDocumentDiagnostics<cr>
" nmap <Leader>gd :LspDefinition<cr>
" nmap <Leader>gr :LspReferences<cr>
" nmap <Leader>gh :LspHover<cr>

" let g:ale_statusline_format = ['X %d', '? %d', '']
" let g:ale_echo_msg_format = '%linter% says %s'
" highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
" highlight clear ALEWarningSign " otherwise uses error bg color (typically red)

" Use noexpandtab for smarty files (ojs)
autocmd Filetype smarty setlocal noexpandtab
autocmd Filetype less setlocal noexpandtab
autocmd Filetype php setlocal noexpandtab

set wildmode=longest,list,full
set wildmenu
set path+=**
set wildignore+=*/node_modules/*,*/vendor/*

" FZF git grep wrapper
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

" FZF Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

nnoremap <leader>f :Files<cr>
nnoremap <leader>F :GFiles<cr>
nnoremap <leader>r :Rg<cr>
nnoremap <leader>R :GGrep<cr>

"COMMENTED OUT TO TRY LSP VANILLA BEHAVIOUR
" " FZF Insert mode completion
" imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
" imap <c-x><c-j> <plug>(fzf-complete-file-ag)
" imap <c-x><c-l> <plug>(fzf-complete-line)
" set rtp+=/usr/local/opt/fzf
"
" " Code completion using ALE (testing...)
" let g:ale_completion_enabled = 1
" set completeopt+=noinsert

set hidden

set showcmd

" clear current searchhl
nnoremap <silent> \\ :noh<return> \| :pc<return>

"nnoremap <BS> <C-^>

" split nav
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" " RSpec.vim mappings
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>

" NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:rspec_command = "Dispatch rspec {spec}"

autocmd BufNewFile,BufRead *spec.js let b:dispatch = 'npm test %'

command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

