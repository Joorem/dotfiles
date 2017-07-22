"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set autoindent
set backspace=2                   " set relaxed backspace style
set hlsearch                      " highlight search
set is                            " set incrementalsearch
set ignorecase                    " ignore case during searches
set laststatus=2                  " always show status line
set novisualbell
set ruler                         " always show cursor position
set showcmd                       " display incomplete commands
set sm                            " set showmatch
set smartindent
set shiftwidth=4                  " set spaces for autoindent
set tabstop=4                     " set spaces for tab
set expandtab                     " use spaces for tab
set shiftround
set textwidth=65000
set title                         " show title in console title bar
set ttyfast                       " smoother changes
set ttyscroll=0                   " turn off scrolling (did not work well with putty)
set visualbell t_vb=              " turn off error beep/flash
set background=dark
set timeoutlen=1000 ttimeoutlen=0 " no delay when pressing escape key
set formatoptions-=cro
set splitbelow                    " open new horizontal split below the current one
set splitright                    " open new vertical split to the righ of the current one
set autowrite                     " automatically :write before running commands
set number
set numberwidth=4
set autoread                      " set to auto read when a file is changed from the outside
set wildmenu                      " turn on the Wild menu
set encoding=utf8
set ffs=unix,dos,mac
set nobackup
set nowb
set noswapfile

let mapleader = ','

" Disable arrow keys
nnoremap <Left>  :echoe "Use h"<cr>
nnoremap <Right> :echoe "Use l"<cr>
nnoremap <Up>    :echoe "Use k"<cr>
nnoremap <Down>  :echoe "Use j"<cr>

" Navigate through panes with Ctrl+(h|j|k|l)
nnoremap <C-h> <C-W><C-h>
nnoremap <C-j> <C-W><C-j>
nnoremap <C-k> <C-W><C-k>
nnoremap <C-l> <C-W><C-l>

" Search for the current selected word with *
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>

" Turn paste mode on/off
map <leader>pp :setlocal paste!<cr>
map <leader>PP :setlocal nopaste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERD Tree (https://github.com/scrooloose/nerdtree)
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=1
let NERDTreeMapActivateNode='<space>'
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nt :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

" vim-airline (https://github.com/vim-airline/vim-airline)
let g:airline#extensions#tabline#enabled = 1

" vim-syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_perl_checker = 1
let g:syntastic_enable_ruby_checker = 1

" vim-easy-align (https://github.com/junegunn/vim-easy-align)
execute pathogen#infect()
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Colors
syntax enable
colorscheme gruvbox

" Turn persistent undo on
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

" Display extra whitespace
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
    autocmd BufReadPost *.cnf set syntax=dosini
augroup END
