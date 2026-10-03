## Overview
This is the best vimrc file ever !
It uses [Vundle](https://github.com/VundleVim/Vundle.vim) as plugin manager
(vim >> nvim)

## Install
```./install.sh```

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

### Macros

#### `@c`
Comment the current line

#### `@u`
Uncomment the current line

#### `@h`
Generate header file 
```c
#ifndef <NAME>_H
#define <NAME>_H


#endif /* <NAME>_H */
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

#### [mattn/vim-smear-cursor](https://github.com/mattn/vim-smear-cursor)
A Vim plugin that renders a smear trail behind the cursor as it moves, using sub-cell 2x2 matrix characters (block elements) for smooth rendering. Inspired by smear-cursor.nvim.

#### [jiangmiao/auto-pairs](https://github.com/jiangmiao/auto-pairs)
Insert or delete brackets, parens, quotes in pair.

#### [maralla/completor.vim](https://github.com/maralla/completor.vim)
Completor is an asynchronous code completion framework for vim8. New features of vim8 are used to implement the fast completion engine with low overhead. For using semantic completion, external completion tools should be installed.

#### [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)
Lean & mean status/tabline for vim that's light as air.

#### ['Yggdroot/indentLine'](https://github.com/Yggdroot/indentLine)
This plugin is used for displaying thin vertical lines at each indentation level for code indented with spaces. For code indented with tabs I think there is no need to support it, because you can use `:set list lcs=tab:\|\ (here is a space)`.
