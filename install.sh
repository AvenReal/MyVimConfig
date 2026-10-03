#!/bin/sh


echo "This will overwrite your old .vimrc file ! once finished, you will arrive in a vim updating plugins, simply `:qa` to quit one all plugins have been installed."


read -p "Wanna Proceed ? [Yy/Nn]" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]; then
    if ! [~/.vim/bundle/Vundle.vim]; then
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    fi
    mv ./vimrc ~/.vimrc
    rm -rf ./
    vim -c "VundleUpdate"
fi
