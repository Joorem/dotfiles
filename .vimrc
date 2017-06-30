set autoindent
set backspace=2                " set relaxed backspace style
set hlsearch            " highlight search
set is                  " set incrementalsearch
set ignorecase          " ignore case during searches
set laststatus=2        " always show status line
set novisualbell
set ruler               " always show cursor position
set showcmd             " display incomplete commands
set sm                  " set showmatch
set smartindent
set shiftwidth=4        " set spaces for autoindent
set tabstop=4           " set spaces for tab
set expandtab           " use spaces for tab
set shiftround
set textwidth=65000
set title               " show title in console title bar
set ttyfast             " smoother changes
set ttyscroll=0         " turn off scrolling (did not work well with putty)
set visualbell t_vb=    " turn off error beep/flash
set background=dark
set timeoutlen=1000 ttimeoutlen=0 " no delay when pressing escape key
set formatoptions-=cro
set splitbelow          " open new horizontal split below the current one
set splitright          " open new vertical split to the righ of the current one
set autowrite           " automatically :write before running commands
set number
set numberwidth=4

" display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
augroup END

let mapleader = ','
nnoremap <Leader>r :RunInInteractiveShell<space>

" get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let g:html_indent_tags = 'li\|p'

let g:airline#extensions#tabline#enabled = 1
let g:syntastic_enable_perl_checker = 1
let g:syntastic_enable_ruby_checker = 1

execute pathogen#infect()

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
call plug#end()

syntax enable
au BufReadPost *.cnf set syntax=dosini

"colorscheme jellybeans
"colorscheme hybrid_e7
colorscheme gruvbox
