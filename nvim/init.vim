set runtimepath+=/home/yui/.cache/dein/repos/github.com/Shougo/dein.vim

if (empty($TMUX))
    if (has("nvim"))
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif

    if (has("termguicolors"))
        set termguicolors
    endif
endif

if dein#load_state('/home/yui/.cache/dein')
    call dein#begin('/home/yui/.cache/dein')
    call dein#add('/home/yui/.cache/dein/repos/github.com/Shougo/dein.vim')

    " syntax
    call dein#add('tikhomirov/vim-glsl')
    call dein#add('MaxMEllon/vim-jsx-pretty')
    call dein#add('HerringtonDarkholme/yats.vim')
    call dein#add('othree/yajs.vim')
    call dein#add('cakebaker/scss-syntax.vim')
    call dein#add('yaymukund/vim-haxe')
    call dein#add('jparise/vim-graphql')
    call dein#add('stephpy/vim-yaml')
    call dein#add('jxnblk/vim-mdx-js')
    call dein#add('posva/vim-vue')
    call dein#add('neovimhaskell/haskell-vim')

    " autocomplete
    call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'release' })

    " color schemes
    call dein#add('rakr/vim-one')

    " misc
    "call dein#add('airblade/vim-gitgutter')
    call dein#add('vim-airline/vim-airline')
    call dein#add('jiangmiao/auto-pairs')
    call dein#add('sgur/vim-editorconfig')
    "call dein#add('aurieh/discord.nvim')

    call dein#end()
    call dein#save_state()
endif

" Airline
"let g:airline#extensions#tabline#enabled = 1

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" one colorscheme
let g:one_allow_italics = 1

set splitbelow splitright
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set number wrap cursorline list relativenumber
set bg=light
set updatetime=300
set shortmess+=c
set signcolumn=yes

" keymap
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

nnoremap <Tab> <C-w><C-w>

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" CoC

"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

colorscheme one
filetype plugin indent on
syntax enable

autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif

call one#highlight('Normal', '', 'EEEEEE', 'none')
call one#highlight('SignColumn', '', 'EEEEEE', 'none')
call one#highlight('CursorLineNr', '', 'DEDEDE', 'bold')
call one#highlight('CursorLine', '', 'DEDEDE','none')

