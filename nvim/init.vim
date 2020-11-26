set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
set splitbelow splitright
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set number wrap cursorline list relativenumber
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

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')
    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

    " syntax
    call dein#add('tikhomirov/vim-glsl')
    call dein#add('MaxMEllon/vim-jsx-pretty')
    call dein#add('HerringtonDarkholme/yats.vim')
    call dein#add('othree/yajs.vim')
    call dein#add('cakebaker/scss-syntax.vim')
    call dein#add('jparise/vim-graphql')
    call dein#add('stephpy/vim-yaml')
    call dein#add('yaymukund/vim-haxe')
    call dein#add('jackguo380/vim-lsp-cxx-highlight')
    call dein#add('jsutlovic/vim-csharp')
    call dein#add('neovimhaskell/haskell-vim')

    " autocomplete
    call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'release' })
    "
    " color schemes
    call dein#add('rakr/vim-one')

    " misc
    call dein#add('vim-airline/vim-airline')
    call dein#add('jiangmiao/auto-pairs')

    call dein#end()
    call dein#save_state()
endif

" timewarrior
"autocmd VimEnter !timew start
"autocmd VimLeave !timew stop

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" one colorscheme
let g:one_allow_italics = 1

colorscheme one
filetype plugin indent on
syntax enable

call one#highlight('Normal', '', 'EEEEEE', 'none')
call one#highlight('SignColumn', '', 'EEEEEE', 'none')
call one#highlight('CursorLineNr', '', 'DEDEDE', 'none')
call one#highlight('CursorLine', '', 'DEDEDE','none')

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

