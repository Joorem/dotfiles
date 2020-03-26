[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![Build Status](https://travis-ci.org/Joorem/dotfiles.svg?branch=master)](https://travis-ci.org/Joorem/dotfiles)

# $TERM

I spend a lot of time in my terminal and as a Mac user I use [iTerm2][29]. I cannot imagine living without all the functionalities it offers: clever bindings, Tmux integration, a large amount of settings, etc..

* **Theme**: [gruvbox][40]
* **Font**: [Anonymice Nerd Font Mono][41] (a recompilation of [Anonymous Pro][42] which I need for `vim-devicons`)

# $SHELL

I used ZSH for years but since I tried [fish][43] I try to slowly migrate to it and find my way. The configuration present in this repository is quite simple for now and I will slowly tweak it.

## External programs

* [bat][bat] (replacement for `cat`)

# $EDITOR

I use [Vim][8] on a daily basis and tweak it regularly. This setup is partially inspired by [amix][5] and [Learn Vimscript the Hard Way][12]. I currently use the theme [gruvbox8][45].

Here is a screenshot of what it looks like:

![iTerm & Vim screenshot](https://github.com/Joorem/dotfiles/wiki/img/iterm-vim-gruvbox.png)

## Dependencies

Some of the plugins I currently use need externals programs to work correctly.

* [ctags][39] (needed by `Tagbar`)
* [git][48] (needed by `vim-signify` & `vimagit`)
* [mardownlint][38] (needed by `syntastic`)
* [nerd-fonts][33] (needed by `vim-devicons`)
* [shellcheck][34] (needed by `syntastic`)
* [pynvim][49] (needed by `LeaderF`)

## Plugins

| Plugin                      | Description                                      |
| --------------------------- | ------------------------------------------------ |
| [ALE][15]                   | Check syntax in Vim asynchronously and fix files |
| [ansible-vim][25]           | Syntax highlighting for Ansible                  |
| [coc.vim][vim-coc]          | Intellisense engine for Vim8 & Neovim            |
| [LeaderF][11]               | Efficient fuzzy finder                           |
| [NERD Tree][2]              | A Tree explorer                                  |
| [NERD Syntax Highlight][36] | Syntax and highlight for NERD Tree               |
| [NERD Tree Git plugin][20]  | Git status in NERD Tree                          |
| [nginx.vim][nginx]          | Syntax for nginx files                           |
| [delimitMate][19]           | Automatic closing of "", (), {}, etc             |
| [rust.vim][26]              | Syntax & Syntastic integration for rust          |
| [Tagbar][22]                | Displays tags in a window, ordered by scope      |
| [Undotree][24]              | Undo history visualizer                          |
| [vim-airline][1]            | Lean & mean status/tabline                       |
| [vim-bracketed-paste][13]   | Handles bracketed-paste-mode                     |
| [vim-colorizer][47]         | Colorize all text in the form #rrggbb or #rgb    |
| [vim-commentary][28]        | Comment stuff out                                |
| [vim-devicons][37]          | Adds file type icons to Vim plugins              |
| [vim-easy-align][3]         | Alignment plugin                                 |
| [vim-fish][44]              | Vim support for editing fish scripts             |
| [vim-git][30]               | Vim Git runtime files                            |
| [vim-gruvbox8][45]          | Simplified and optimized Gruvbox colorscheme     |
| [vim-haproxy][vim-haproxy]  | Syntax and highlighting for HAProxy              |
| [vim-plug][6]               | Minimalist Vim Plugin Manager                    |
| [vim-puppet][14]            | Syntax, formatting, ctags, for Puppet            |
| [vim-repeat][30]            | Enable repeating supported plugin maps with "."  |
| [vim-signify][23]           | Show a VCS diff using Vim                        |
| [vim-smoothie][46]          | Smooth scrolling for Vim                         |
| [vim-toml][35]              | Syntax for TOML                                  |
| [vim-vimlint][27]           | Lint for vim script                              |
| [vim-vimlparser][31]        | Vim script parser                                |
| [vimagit][21]               | Ease your git workflow within Vim                |

## Syntax

* [jinja][18]

# Installation

If you want to test my configuration just run the following command, it will create symbolic links between your `$HOME` directory and the needed files (.vimrc, etc.):

```sh
git clone --quiet https://github.com/Joorem/dotfiles.git && \
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
[11]:https://github.com/Yggdroot/LeaderF
[12]:http://learnvimscriptthehardway.stevelosh.com
[13]:https://github.com/ConradIrwin/vim-bracketed-paste
[14]:https://github.com/rodjek/vim-puppet
[15]:https://github.com/w0rp/ale
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
[29]:https://www.iterm2.com
[30]:https://github.com/tpope/vim-repeat
[31]:https://github.com/vim-jp/vim-vimlparser
[33]:https://github.com/ryanoasis/nerd-fonts
[34]:https://github.com/koalaman/shellcheck
[35]:https://github.com/cespare/vim-toml
[36]:https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
[37]:https://github.com/ryanoasis/vim-devicons
[38]:https://github.com/markdownlint/markdownlint
[39]:https://github.com/universal-ctags/ctags
[40]:https://github.com/morhetz/gruvbox-contrib/tree/master/iterm2
[41]:https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/AnonymousPro/complete/Anonymice%20Nerd%20Font%20Complete%20Mono.ttf
[42]:https://www.marksimonson.com/fonts/view/anonymous-pro
[43]:https://fishshell.com
[44]:https://github.com/dag/vim-fish
[45]:https://github.com/lifepillar/vim-gruvbox8
[46]:https://github.com/psliwka/vim-smoothie
[47]:https://github.com/lilydjwg/colorizer
[48]:https://git-scm.com
[49]:https://github.com/neovim/neovim/wiki/FAQ#python-support-isnt-working
[bat]:https://github.com/sharkdp/bat
[nginx]:https://github.com/chr4/nginx.vim
[vim-coc]:https://github.com/neoclide/coc.nvim
[vim-haproxy]:https://github.com/Joorem/vim-haproxy
