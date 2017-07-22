#!/bin/sh

set -e
set -u

mkdir -p ~/.vim/bundle

cd ~/.vim/bundle
[ ! -d gruvbox ] && git clone https://github.com/morhetz/gruvbox
[ ! -d vim-airline ] && git clone https://github.com/vim-airline/vim-airline
[ ! -d nerdtree ] && git clone https://github.com/scrooloose/nerdtree.git
[ ! -d vim-syntastic ] && git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
[ ! -d vim-easy-align ] && git clone https://github.com/junegunn/vim-easy-align

cd $OLDPWD
for file in .vim/* .vimrc .zshenv .zshrc; do
    [ -d ~/$file ] && rm -r ~/$file;
    [ -f ~/$file ] && rm ~/$file;

    ln -fs $PWD/$file ~/$file;
done
