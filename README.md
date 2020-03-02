![img](https://github.com/Joorem/dotfiles/wiki/img/iterm-vim-manpage-dig-color.png)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Build Status](https://travis-ci.org/Joorem/dotfiles.svg?branch=master)](https://travis-ci.org/Joorem/dotfiles)

# VIM

I use [Vim][8] on a daily basis and tweak it regularly. This setup is inspired by [amix][5] and [Learn Vimscript the Hard Way][12]. I currently use the theme [gruvbox][4].

## Plugins

* [ALE][15]
* [ansible-vim][25]
* [NERD Tree][2]
* [NERD Tree Git plugin][20]
* [SuperTab][16]
* [ctrlp.vim][11]
* [delimitMate][19]
* [rust.vim][26]
* [syntastic][32]
* [Tagbar][22]
* [Undotree][24]
* [vim-airline][1]
* [vim-bracketed-paste][13]
* [vim-commentary][28]
* [vim-easy-align][3]
* [vim-fugitive][29]
* [vim-git][30]
* [vim-plug][6]
* [vim-puppet][14]
* [vim-repeat][30]
* [vim-signify][23]
* [vim-vimlint][27]
* [vim-vimlparser][31]
* [vimagit][21]

## Syntax

* [nginx][10]
* [haproxy][17]
* [jinja][18]

# Zsh

## Plugins

* [zsh-git-prompt][9]

# Installation

```sh
git clone https://github.com/Joorem/dotfiles.git && \
cd dotfiles && \
sh install.sh && \
vim -E -s -u ~/.vimrc +PlugInstall +qall
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
[17]:https://github.com/haproxy/haproxy/blob/master/contrib/syntax-highlight/haproxy.vim
[18]:https://www.vim.org/scripts/script.php?script_id=1856
[19]:https://github.com/Raimondi/delimitMate
[20]:https://github.com/Xuyuanp/nerdtree-git-plugin
[21]:https://github.com/jreybert/vimagit
[22]:https://github.com/majutsushi/tagbar
[23]:https://github.com/junegunn/vim-easy-align
[24]:https://github.com/mbbill/undotree
[25]:https://github.com/pearofducks/ansible-vim
[26]:https://github.com/rust-lang/rust.vim
[27]:https://github.com/syngan/vim-vimlint
[28]:https://github.com/tpope/vim-commentary
[29]:https://github.com/tpope/vim-fugitive
[30]:https://github.com/tpope/vim-repeat
[31]:https://github.com/vim-jp/vim-vimlparser
[32]:https://github.com/vim-syntastic/syntastic
