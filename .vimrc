" ~/.vimrc

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" https://github.com/tpope/vim-sensible
Plugin 'tpope/vim-sensible'

" https://github.com/preservim/nerdtree
" https://github.com/Xuyuanp/nerdtree-git-plugin
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

runtime! plugin/sensible.vim

set encoding=utf-8 fileencodings=
syntax on

set number
set cc=80

autocmd Filetype make setlocal noexpandtab

set list listchars=tab:»·,trail:·


" per .git vim configs
" just git config vim.settings "expandtab sw=4 sts=4" in a git repository
" change syntax settings for this repository
let git_settings = system("git config --get vim.settings")
if strlen(git_settings)
    exe "set" git_settings
endif


command! -nargs=1 Archi execute 'silent !git add -A && git commit -m ' . shellescape('archi-' . <args>) . ' && git tag -ma ' . shellescape('archi-' . <args>) . ' && git push --follow-tags'

" ##############################################################################
"                                   NERDTree
" ##############################################################################

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" ##############################################################################

set wrap
set textwidth=79
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set autoindent
set smartindent
set number

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

set mouse=a

" ##############################################################################
"                               Remaps
" ##############################################################################

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> <CR>{<CR>} <Esc>O

inoremap fori for(int i = 0; i <  ; i++)<CR>{<CR>}<Esc>O
inoremap forj for(int j = 0; j <  ; j++)<CR>{<CR>}<Esc>O
inoremap fork for(int k = 0; k <  ; k++)<CR>{<CR>}<Esc>O

inoremap :wq <Esc>:wq<Enter>

nnoremap :W :wq<Enter>:wq<Enter>exit<Enter>

nnoremap x :w<Enter> :! clear && gcc *.c -fsanitize=address -Wextra -g && echo "-------------------------------------------------------------------" && ./a.out && rm a.out <Enter>

nnoremap ~ :tabnew ~/.vimrc<Enter>
inoremap <A-> <C-n>




" ##############################################################################
"                                  At launch
" ##############################################################################

if filereadable("main.c") && expand('%:t:r') != "main.c"
    :let wid = win_getid()
    :vs main.c
    :below term
    :call win_gotoid(wid)
    :wincmd H
else
    :let wid = win_getid()
    :vs "temp.vim"
    :let temp = win_getid()
    :below term
    :call win_gotoid(wid)
    :wincmd H
    :call win_gotoid(temp)
    :q
endif
