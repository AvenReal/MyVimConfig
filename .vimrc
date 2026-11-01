set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" https://github.com/jiangmiao/auto-pairs
Plugin 'jiangmiao/auto-pairs'

" https://github.com/maralla/completor.vim
Plugin 'maralla/completor.vim'

" https://github.com/vim-airline/vim-airline
Plugin 'vim-airline/vim-airline'

" https://github.com/Yggdroot/indentLine
Plugin 'Yggdroot/indentLine'

" https://github.com/justinmk/vim-syntax-extra
Plugin 'justinmk/vim-syntax-extra'

call vundle#end()
filetype plugin indent on

let g:airline_left_sep = '🭀'
let g:airline_right_sep = '🭦'

let g:airline_section_z = "Line: %l/%L, Col: %c/%C"

let g:indentLine_char = '│'

"  ------------- General ------------- 

set wrap 
set textwidth=79
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set autoindent
set smartindent
set number
set relativenumber 
set colorcolumn=80

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

set mouse=a
set scrolloff=999
set autocomplete

"  ------------- Maps ------------- 

nnoremap <C-Tab> :tabnew 
nnoremap <Tab> :tabNext<Enter>
nnoremap ~ :tabnew ~/.vimrc<Enter>
nnoremap j jzz
nnoremap k kzz
nnoremap p pv=

" ------------- Theme ---------- 

colorscheme unokai
highlight Normal ctermbg=NONE
highlight NonText ctermbg=NONE

"  ------------- C files specific ------------- 
if expand("%:e") == "c" 
    let @c = "I// \<Esc>j"
    let @u = "I\<Del>\<Del>\<Del>\<Esc>j"
    let @m = "^vf*f hh\"tyf*f lvf=h\"nyf=a malloc(sizeof(\<Esc>\"tp$a;\<Esc>oif(!\<Esc>\"npkf;hhi"
    let @f = "^f vf \"nyA fork(\<Esc>A;\<CR>if(\<Esc>\"np$i < 0\<Esc>oreturn 1;\<Esc>oif(\<Esc>\"np$i == 0\<Esc>A{\<CR>\<Esc>joelse{\<CR>"

    nnoremap H :call ToggleH()<Enter>
    function! ToggleH()
        let f = expand("%:r")
        let e = expand("%:e")
        :let h = f . ".h"
        :let c = f . ".c"
        :echo e
        if e == "c"
            :w
            :execute 'e ' . fnameescape(h)
        else
            :w
            :execute 'e ' . fnameescape(c)
        endif
    endfunction

    function! Format()
        if expand("%:e") == "c"
            normal! mf
            :execute '%!clang-format'
            normal! 'f
        endif
        :execute 'w'
    endfunction

    inoremap <Esc> <Esc>:call Format()<Enter>
    inoremap froi for(int i = 0; i < M ; i++)<CR>{<CR>}<Esc>O
    inoremap froj for(int j = 0; j < M ; j++)<CR>{<CR>}<Esc>O
    inoremap frokk for(int k = 0; k < M ; k++)<CR>{<CR>}<Esc>O

    inoremap #if <Esc>ggI#ifndef <NAME>_H<CR>#define <NAME>_H<CR><CR>#endif /* <NAME>_H */<Esc>:%s/<NAME>/
    inoremap #d #define 
    inoremap #in #include 


endif

