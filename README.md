![img](https://github.com/Joorem/dotfiles/wiki/img/iterm-vim-manpage-dig-color.png)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Build Status](https://travis-ci.org/Joorem/dotfiles.svg?branch=master)](https://travis-ci.org/Joorem/dotfiles)

# VIM
I use [Vim][8] on a daily basis and tweak it regularly. This setup is inspired by [amix][5] and [Learn Vimscript the Hard Way][12]. I currently use the theme [gruvbox][4].

## Plugins
* [ALE][15]
* [NERD Tree][2]
* [SuperTab][16]
* [ctrlp.vim][11]
* [vim-airline][1]
* [vim-bracketed-paste][13]
* [vim-easy-align][3]
* [vim-plug][6]
* [vim-puppet][14]

## Syntax
* [nginx][10]

# Zsh
## Plugins
* [zsh-git-prompt][9]

# Installation
```sh
git clone https://github.com/Joorem/dotfiles.git && cd dotfiles && sh install.sh && vim -c "PlugInstall"
```

[1]:https://github.com/vim-airline/vim-airline
[2]:https://github.com/scrooloose/nerdtree
[3]:https://github.com/junegunn/vim-easy-align
[4]:https://github.com/morhetz/gruvbox
[5]:https://github.com/amix/vimrc
[6]:https://github.com/junegunn/vim-plug
[8]:https://vim.sourceforge.io
[9]:https://github.com/olivierverdier/zsh-git-prompt
[10]:http://hg.nginx.org/nginx/raw-file/tip/contrib/vim/syntax/nginx.vim
[11]:https://github.com/ctrlpvim/ctrlp.vim
[12]:http://learnvimscriptthehardway.stevelosh.com
[13]:https://github.com/ConradIrwin/vim-bracketed-paste
[14]:https://github.com/rodjek/vim-puppet
[15]:https://github.com/w0rp/ale
[16]:https://github.com/ervandew/supertab
