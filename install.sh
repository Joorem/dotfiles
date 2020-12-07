#!/usr/bin/env bash

set -e
set -u

#
# Vars
#
ETC_VIM_PLUG=~/.vim/autoload/plug.vim
ETC_VIM_AIRLINE_GRUVBOX8=~/.vim/autoload/airline/themes/gruvbox8.vim
OPT_CURL=(--create-dirs --location --silent --output)
PRG_GIT=/usr/bin/git
URL_VIM_PLUG='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
URL_VIM_AIRLINE_GRUVBOX8='https://gist.githubusercontent.com/lifepillar/cc3236a47bbba0261283f43f73074932/raw/511af9c8b630a38da94b5c31b0058f0339b8ea7a/gruvbox8.vim'

#
# Prerequisites
#
mkdir -p \
  ~/.config/aria2c \
  ~/.config/bat \
  ~/.config/starship \
  ~/.gnupg \
  ~/.vim_runtime/temp_dirs/undodir \
  ~/.zsh

[ ! -f "$ETC_VIM_PLUG" ] && curl "${OPT_CURL[@]}" $ETC_VIM_PLUG $URL_VIM_PLUG
[ ! -f "$ETC_VIM_AIRLINE_GRUVBOX8" ] && curl "${OPT_CURL[@]}" $ETC_VIM_AIRLINE_GRUVBOX8 $URL_VIM_AIRLINE_GRUVBOX8

#
# Symlinks
#
for file in \
  .config/alacritty \
  .config/aria2c/* \
  .config/bat/* \
  .config/nord-dircolors \
  .config/zplug \
  .config/starship \
  .config/tmux \
  .config/youtube-dl \
  .gnupg/* \
  .gitconfig \
  .vim/* \
  .vimrc \
  .zsh/* \
  .zshenv \
  .zshrc; do
  [ -d "$HOME/$file" ] && rm -r "${HOME:?}/$file"
  [ -f "$HOME/$file" ] && rm "$HOME/$file"

  ln -fs "$PWD/$file" "$HOME/$file"
done

#
# Git submodules
#
${PRG_GIT} submodule init
${PRG_GIT} submodule update

#
# MacOS
#
if [[ "$OSTYPE" == "darwin"* ]]; then
  . install-macos.sh
fi
