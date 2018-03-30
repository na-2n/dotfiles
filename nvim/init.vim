set runtimepath+=/home/yui/.vim/bundle/repos/github.com/Shougo/dein.vim
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set number
set wrap

if dein#load_state('~/.vim/bundle/')
    call dein#begin('~/.vim/bundle/')

    call dein#add('~/.vim/bundle/repos/github.com/Shougo/dein.vim')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/neosnippet')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('mhartington/nvim-typescript')
    call dein#add('HerringtonDarkholme/yats.vim')
    call dein#add('wakatime/vim-wakatime')
    call dein#add('fatih/vim-go')
    call dein#add('zchee/deoplete-jedi')
    call dein#add('chr4/nginx.vim')
    call dein#add('othree/yajs.vim')
    call dein#add('udalov/kotlin-vim')
    call dein#add('mxw/vim-jsx')
    call dein#add('w0rp/ale')
    call dein#add('rust-lang/rust.vim')
    call dein#add('sebastianmarkow/deoplete-rust')
    call dein#add('yuwui/vim-colors-paramount')
    call dein#add('hdima/python-syntax')
    call dein#add('tweekmonster/deoplete-clang2')
    call dein#add('slashmili/alchemist.vim')

    call dein#end()
    call dein#save_state()
endif

let g:deoplete#enable_at_startup = 1
let g:neosnippet#enable_completed_snippet = 1
let g:deoplete#sources = {}
let g:deoplete#sources.typescript = ['typescript']
let g:deoplete#sources#rust#racer_binary='/home/yui/.cargo/bin/racer'
let python_highlight_all = 1
let g:deoplete#sources#jedi#python_path='/usr/bin/python3.6'
let g:ale_linters = { 'cpp': ['cppcheck', 'cpplint', 'g++'] }

colorscheme paramount
set background=dark
filetype plugin indent on
syntax enable
