## Overview
This is the best vimrc file ever !
It uses [Vundle](https://github.com/VundleVim/Vundle.vim) as plugin manager
(vim >> nvim)

## Install
```

curl https://raw.githubusercontent.com/AvenReal/MyVimConfig/refs/heads/main/install.sh > AvenReal_MyVimConfig_install.sh
chmod +x AvenReal_MyVimConfig_install.sh
./AvenReal_MyVimConfig_install.sh
rm AvenReal_MyVimConfig_install.sh

```

## Usage

### Remaps

#### `nnoremap <Tab> :tabNext<Enter>`
Switch tabs by simply pressing `<Tab>` in *Normal mode*

#### `nnoremap ~ :tabnew ~/.vimrc<Enter>`
Rapidely go to your `.vimrc` file by pressing `~` in *Normal mode*

#### `nnoremap j jzz` / `nnoremap k kzz`
Keep Cursor centered when pressing `j` or `k`

#### `nnoremap p pv=`
Automaticaly indent the first line of the block that you paste

#### `nnoremap <C-Tab> :tabnew `
Open a new tab by pressing `<C-Tab>` in *Normal mode*

#### `nnoremap H :call ToggleH()<Enter>`
Toggle between `.c` and `.h` files

#### `inoremap <Esc> <Esc>:call Format()<Enter>`
Format code when exiting insert mode

#### `inoremap froi` / `inoremap froj` / `inoremap frokk`
Insert a `for` loop block with index `i`, `j`, or `k`

#### `inoremap #if`
Generate header guard block

#### `inoremap #d #define ` / `inoremap #in #include `
Quickly type `#define ` and `#include `

### Macros

#### `@c`
Comment the current line

#### `@u`
Uncomment the current line

#### `@f`
Automatically write the start of a `fork()` block
```c
type* name =<Esc>@f
```
```c
type* name = fork();
if(name < 0)
    return 1;
if(name == 0){

}else{

}
```

#### `@m`
Autommatcaly malloc the current variable
```c
type* name =<Esc>@m
```
```c
type* name = malloc(sizeof(type));
if(!name)
```

### Plugins

#### [justinmk/vim-syntax-extra](https://github.com/justinmk/vim-syntax-extra)
Vim syntax highlighting for c, bison, flex

#### [jiangmiao/auto-pairs](https://github.com/jiangmiao/auto-pairs)
Insert or delete brackets, parens, quotes in pair.

#### [maralla/completor.vim](https://github.com/maralla/completor.vim)
Completor is an asynchronous code completion framework for vim8. New features of vim8 are used to implement the fast completion engine with low overhead. For using semantic completion, external completion tools should be installed.

#### [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)
Lean & mean status/tabline for vim that's light as air.

#### ['Yggdroot/indentLine'](https://github.com/Yggdroot/indentLine)
This plugin is used for displaying thin vertical lines at each indentation level for code indented with spaces. For code indented with tabs I think there is no need to support it, because you can use `:set list lcs=tab:\|\ (here is a space)`.
