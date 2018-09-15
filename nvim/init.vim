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
    "call dein#add('wakatime/vim-wakatime')
    call dein#add('fatih/vim-go')
    call dein#add('zchee/deoplete-jedi')
    call dein#add('chr4/nginx.vim')
    call dein#add('othree/yajs.vim')
    call dein#add('udalov/kotlin-vim')
    call dein#add('mxw/vim-jsx')
    call dein#add('w0rp/ale')
    call dein#add('rust-lang/rust.vim')
    "call dein#add('racer-rust/vim-racer')
    call dein#add('yuwui/vim-colors-paramount')
    call dein#add('hdima/python-syntax')
    call dein#add('zchee/deoplete-clang')
    call dein#add('Shougo/neoinclude.vim')

    call dein#add('slashmili/alchemist.vim')
    call dein#add('aurieh/discord.nvim')
    call dein#add('vim-ruby/vim-ruby')
    call dein#add('OrangeT/vim-csharp')
    call dein#add('SpaceVim/vim-swig')
    call dein#add('exu/pgsql.vim')
    "call dein#add('monkoose/deoplete-d')
    call dein#add('autozimu/LanguageClient-neovim', { 'build': 'bash install.sh' })
    call dein#add('rhysd/vim-crystal')
    call dein#add('kana/vim-filetype-haskell')
    call dein#add('peterhoeg/vim-qml')

    call dein#end()
    call dein#save_state()
endif

let g:deoplete#enable_at_startup = 1
"let g:deoplete#sources#rust#racer_binary='/home/yui/.cargo/bin/racer'
"let g:deoplete#sources#rust#rust_source_path='/home/yui/rust/src'
let python_highlight_all = 1
let g:deoplete#sources#jedi#python_path='/usr/bin/python3.6'
let g:ale_linters = { 'cpp': ['cppcheck', 'cpplint', 'g++'], 'python': ['flake8'], 'typescript': ['tslint'] }
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang/6.0.1/include/'
"let g:deoplete#sources#d#dcd_server_autostart = 1
"let g:deoplete#sources#d#std_path = '/usr/include/d/'
let g:LanguageClient_serverCommands = { 'crystal': ['scry'] }

autocmd FileType crystal setlocal tabstop=2 shiftwidth=2
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2
autocmd FileType eruby setlocal tabstop=2 shiftwidth=2

colorscheme paramount
set background=dark
filetype plugin indent on
syntax enable
