#!/usr/bin/env bash

set -e
set -u

#
# Vars
#
ETC_FISH_FUNDLE=~/.config/fish/functions/fundle.fish
ETC_VIM_PLUG=~/.vim/autoload/plug.vim
ETC_ZSH_GITPROMPT=~/.zsh/zsh-git-prompt
OPT_CURL=( --create-dirs --location --silent --output )
URL_FISH_FUNDLE='https://raw.githubusercontent.com/danhper/fundle/master/functions/fundle.fish'
URL_VIM_PLUG='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
URL_ZSH_GITPROMPT='https://github.com/olivierverdier/zsh-git-prompt'


#
# Prerequisites
#
mkdir -p \
  ~/.config/aria2c \
  ~/.gnupg \
  ~/.vim_runtime/temp_dirs/undodir \
  ~/.zsh

[ ! -f "$ETC_FISH_FUNDLE" ] && curl "${OPT_CURL[@]}" $ETC_FISH_FUNDLE $URL_FISH_FUNDLE
[ ! -f "$ETC_VIM_PLUG" ] && curl "${OPT_CURL[@]}" $ETC_VIM_PLUG $URL_VIM_PLUG
[ ! -d "$ETC_ZSH_GITPROMPT" ] && git clone --quiet $URL_ZSH_GITPROMPT $ETC_ZSH_GITPROMPT

#
# Symlinks
#
for file in \
  .config/aria2c/* \
  .config/fish/* \
  .gnupg/* \
  .gitconfig \
  .vim/* \
  .vimrc \
  .zshenv \
  .zshrc; do
    [ -d "$HOME/$file" ] && rm -r "${HOME:?}/$file";
    [ -f "$HOME/$file" ] && rm "$HOME/$file";

    ln -fs "$PWD/$file" "$HOME/$file";
done

#
# MacOS
#
if [[ "$OSTYPE" == "darwin"* ]]; then
    . install-macos.sh
fi
