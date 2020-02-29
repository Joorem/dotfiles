#!/bin/sh

set -e
set -u

# GPG
mkdir -p ~/.gnupg

# Vim
mkdir -p ~/.vim_runtime/temp_dirs/undodir
[ ! -f "$HOME/.vim/autoload/plug.vim" ] && curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# Zsh
mkdir -p ~/.zsh
[ ! -d ~/.zsh/zsh-git-prompt ] && git clone https://github.com/olivierverdier/zsh-git-prompt ~/.zsh/zsh-git-prompt

for file in .gnupg/* .gitconfig .vim/* .vimrc .zshenv .zshrc; do
    [ -d "$HOME/$file" ] && rm -r "${HOME:?}/$file";
    [ -f "$HOME/$file" ] && rm "$HOME/$file";

    ln -fs "$PWD/$file" "$HOME/$file";
done

if [[ "$OSTYPE" == "darwin"* ]]; then
    . install-macos.sh
fi
