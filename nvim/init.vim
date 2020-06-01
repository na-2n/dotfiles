set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set number wrap cursorline list relativenumber
set bg=light

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')
    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

    " syntax
    "call dein#add('dense-analysis/ale')
    call dein#add('tikhomirov/vim-glsl')
    call dein#add('jiangmiao/auto-pairs')
    call dein#add('MaxMEllon/vim-jsx-pretty')
    call dein#add('HerringtonDarkholme/yats.vim')
    call dein#add('othree/yajs.vim')
    call dein#add('cakebaker/scss-syntax.vim')

    " autocomplete
    call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'release' })

    " color schemes
    call dein#add('rakr/vim-one')

    " misc
    call dein#add('aurieh/discord.nvim')
    "call dein#add('preservim/nerdtree')

    call dein#end()
    call dein#save_state()
endif


" NERDTree
"let g:loaded_nerd_tree = 1

"let g:NERDTreeMinimalUI = 1
"let g:NERDTreeShowHidden=1
"let g:NERDTreeWinSize = 25

"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p
"autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:deoplete#enable_at_startup = 1

" ALE
"let g:ale_completion_tsserver_autoimport = 1
"let g:ale_fix_on_save = 1
"let g:ale_sign_column_always = 1
"let g:ale_fixers = {
"\   '*': ['remove_trailing_lines', 'trim_whitespace'],
"\   'javascript': ['eslint'],
"\}

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" Vim stuff
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

colorscheme one

nnoremap <Tab> <C-w><C-w>
filetype plugin indent on
syntax enable

hi Pmenu ctermfg=7
hi PmenuSbar ctermbg=251
