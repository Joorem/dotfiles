#!/bin/sh

set -e
set -u

# GPG
mkdir -p ~/.gnupg

# Vim
mkdir -p ~/.vim/bundle ~/.vim_runtime/temp_dirs/undodir

cd ~/.vim/bundle
[ ! -d ctrlp.vim ] && git clone https://github.com/ctrlpvim/ctrlp.vim.git
[ ! -d gruvbox ] && git clone https://github.com/morhetz/gruvbox
[ ! -d nerdtree ] && git clone https://github.com/scrooloose/nerdtree.git
[ ! -d syntastic ] && git clone --depth=1 https://github.com/vim-syntastic/syntastic
[ ! -d vim-airline ] && git clone https://github.com/vim-airline/vim-airline
[ ! -d vim-bracketed-paste ] && git clone https://github.com/ConradIrwin/vim-bracketed-paste
[ ! -d vim-easy-align ] && git clone https://github.com/junegunn/vim-easy-align

# Zsh
mkdir -p ~/.zsh
[ ! -d ~/.zsh/zsh-git-prompt ] && git clone https://github.com/olivierverdier/zsh-git-prompt ~/.zsh/zsh-git-prompt

cd $OLDPWD
for file in .gnupg/* .gitconfig .vim/* .vimrc .zshenv .zshrc; do
    [ -d ~/$file ] && rm -r ~/$file;
    [ -f ~/$file ] && rm ~/$file;

    ln -fs $PWD/$file ~/$file;
done
