if (empty($TMUX))
    if (has("nvim"))
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif

    if (has("termguicolors"))
        set termguicolors
    endif
endif

set splitbelow splitright
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set number wrap list relativenumber
set cursorline
set bg=dark
set updatetime=300
set shortmess+=c
set signcolumn=yes
set mouse=

call plug#begin('~/.config/nvim/plugged')

" syntax
Plug 'cakebaker/scss-syntax.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'jparise/vim-graphql'
Plug 'jsutlovic/vim-csharp'
Plug 'jxnblk/vim-mdx-js'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'neovimhaskell/haskell-vim'
Plug 'othree/yajs.vim'
Plug 'posva/vim-vue'
Plug 'stephpy/vim-yaml'
Plug 'tikhomirov/vim-glsl'
Plug 'yaymukund/vim-haxe'
Plug 'rust-lang/rust.vim'
Plug 'udalov/kotlin-vim'

" util
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'OmniSharp/omnisharp-vim'
Plug 'sgur/vim-editorconfig'

" style
Plug 'rakr/vim-one'
"Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'

call plug#end()

" Airline
"let g:airline#extensions#tabline#enabled = 1

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" one colorscheme
let g:one_allow_italics = 1

" lightline
let lightline = {
    \  'colorscheme': 'one'
    \ }
" transparency
hi Normal guibg=NONE

" keymap
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

nnoremap <Tab> <C-w><C-w>

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

"colorscheme evening
colorscheme one
filetype plugin indent on
syntax enable

autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif

"call one#highlight('Normal', '', 'EEEEEE', 'none')
"call one#highlight('SignColumn', '', 'EEEEEE', 'none')
"call one#highlight('CursorLineNr', '', 'DEDEDE', 'bold')
"call one#highlight('CursorLine', '', 'DEDEDE','none')


" CoC
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <c-space> coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

"function! s:show_documentation()
"    if (index(['vim','help'], &filetype) >= 0)
"        execute 'h '.expand('<cword>')
"    elseif (coc#rpc#ready())
"        call CocActionAsync('doHover')
"    else
"        execute '!' . &keywordprg . " " . expand('<cword>')
"    endif
"endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

