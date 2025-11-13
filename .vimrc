" ~/.vimrc


" ##############################################################################
"                                 Vundle Plugins
" ##############################################################################

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
Plugin 'preservim/nerdtree'

" https://github.com/Xuyuanp/nerdtree-git-plugin
Plugin 'Xuyuanp/nerdtree-git-plugin'

" https://github.com/airblade/vim-gitgutter
Plugin 'airblade/vim-gitgutter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

runtime! plugin/sensible.vim

" ##############################################################################
"                                  Things
" ##############################################################################

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

" NERDTree Git Plugin

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'😁',
                \ 'Staged'    :'🙂',
                \ 'Untracked' :'🥶',
                \ 'Renamed'   :'🙃',
                \ 'Unmerged'  :'🤢',
                \ 'Deleted'   :'🫥',
                \ 'Dirty'     :'😏',
                \ 'Ignored'   :'😡',
                \ 'Clean'     :'😇',
                \ 'Unknown'   :'🤡',
                \ }

let g:NERDTreeGitStatusConcealBrackets = 1 " default: 0

" ##############################################################################
"                               Git Gutter
" ##############################################################################

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '┰'
let g:gitgutter_sign_removed_above_and_below = '-'
let g:gitgutter_sign_modified_removed = '≃'


highlight SignColumn        ctermbg=NONE
highlight GitGutterAdd      guifg=#00ff00 guibg=#00ff00
highlight GitGutterChange   guifg=#ffff00 guibg=#ffff00
highlight GitGutterDelete   guifg=#ff0000 guibg=#ff0000

" ##############################################################################
"                               Other Things
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

command! Wqa call CloseTermAndQuit()

function! CloseTermAndQuit()
  " Loop over all buffers
  for buf in range(1, bufnr('$'))
    if bufexists(buf) && getbufvar(buf, '&buftype') ==# 'terminal'
      execute 'bdelete!' buf
    endif
  endfor
  " Now write and quit all
  wall | qall
endfunction


nnoremap :wqa :Wqa
nnoremap :WQa :Wqa
nnoremap :WQA :Wqa

inoremap :wqa <Esc>:Wqa
inoremap :Wqa <Esc>:Wqa
inoremap :WQa <Esc>:Wqa
inoremap :WQA <Esc>:Wqa


inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> <CR>{<CR>} <Esc>O

inoremap fori for(int i = 0; i <  ; i++)<CR>{<CR>}<Esc>O
inoremap forj for(int j = 0; j <  ; j++)<CR>{<CR>}<Esc>O
inoremap forkk for(int k = 0; k <  ; k++)<CR>{<CR>}<Esc>O

nnoremap x :w<Enter> :! clear && gcc *.c -fsanitize=address -Wextra -g && echo "-------------------------------------------------------------------" && ./a.out && rm a.out <Enter>

nnoremap ~ :tabnew ~/.vimrc<Enter> :let wid = win_getid() <Enter>:vs "temp.vim" <Enter>:below term <Enter>:call win_gotoid(temp) <Enter>:q <Enter>:call win_gotoid(wid):vertical resize 120<Enter>




" ##############################################################################
"                                  Extra
" ##############################################################################

" Automatically close terminal buffers when quitting all
autocmd QuitPre * if &buftype == 'terminal' | execute 'bdelete!' | endif

:colorscheme habamax

if filereadable("main.c") && expand('%:t:r') != "main.c"
    :let wid = win_getid()
    :vs main.c
    :below term
    :call win_gotoid(wid)
    :wincmd H
    :vertical resize 120
else
    :let wid = win_getid()
    :vs "temp.vim"
    :let temp = win_getid()
    :below term
    :call win_gotoid(wid)
    :wincmd H
    :call win_gotoid(temp)
    :q
    :call win_gotoid(wid)
    :vertical resize 120
endif
