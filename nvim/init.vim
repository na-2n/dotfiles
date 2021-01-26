set splitbelow splitright
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set number wrap cursorline list relativenumber
set cursorline
set bg=light
set updatetime=300
set shortmess+=c
set signcolumn=yes

if (empty($TMUX))
    if (has("nvim"))
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif

    if (has("termguicolors"))
        set termguicolors
    endif
endif
   
call plug#begin('~/.config/nvim/plugged')

Plug 'tikhomirov/vim-glsl'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'othree/yajs.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'jparise/vim-graphql'
Plug 'yaymukund/vim-haxe'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'jsutlovic/vim-csharp'
Plug 'neovimhaskell/haskell-vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'OmniSharp/omnisharp-vim'
Plug 'sgur/vim-editorconfig'

Plug 'rakr/vim-one'

Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'

call plug#end()

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" one colorscheme
let g:one_allow_italics = 1

colorscheme one
filetype plugin indent on
syntax enable

" Vim stuff
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

nnoremap <Tab> <C-w><C-w>

" CoC
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-reference)

nmap <leader>rn  <Plug>(coc-rename)

xmap <leader>f   <Plug>(coc-format-selected)
nmap <leader>f   <Plug>(coc-format-selected)

nnoremap <silent> K :call <SID>show_documentation()<CR>

autocmd CursorHold * silent call CocActionAsync('highlight')

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

