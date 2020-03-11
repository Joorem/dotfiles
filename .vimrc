"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
scriptencoding utf-8

set autoindent
set autoread                      " reload files changed outside vim
set complete-=i                   " disable scanning included files
set complete-=t                   " disable searching tags
set cursorline
set backspace=2                   " set relaxed backspace style
set hlsearch                      " highlight search
set is                            " set incrementalsearch
set ignorecase                    " ignore case during searches
set laststatus=2                  " always show status line
set lazyredraw
set novisualbell
set ruler                         " always show cursor position
set showcmd                       " display incomplete commands
set sm                            " set showmatch
set smartindent
set shiftwidth=2                  " set spaces for autoindent
set tabstop=2                     " set spaces for tab
set expandtab                     " use spaces for tab
set shiftround
set textwidth=65000
set title                         " show title in console title bar
set visualbell t_vb=              " turn off error beep/flash
set background=dark
set timeoutlen=1000 ttimeoutlen=0 " no delay when pressing escape key
set formatoptions-=cro
set smartcase                     " override the 'ignorecase' option if the search pattern contains uppercase characters
set regexpengine=1                " speedup refresh with cursorline enabled
set splitbelow                    " open new horizontal split below the current one
set splitright                    " open new vertical split to the righ of the current one
set scrolloff=5                   " minimal number of screen lines to keep above and below the cursor
set autowrite                     " automatically :write before running commands
set number
set numberwidth=4
set autoread                      " set to auto read when a file is changed from the outside
set wildmenu                      " turn on the Wild menu
set encoding=utf8
set ffs=unix,dos,mac
set nobackup
set nowritebackup
set noswapfile
set switchbuf=usetab
set showtabline=0                 " do not show the tabline (already shown with vim-airline plugin)
set noshowmode
set smarttab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:mapleader = ' '

" Make <c-p> and <c-n> behave like <up> and <down>: show new or previous results matching current command-line
cnoremap <c-n> <down>
cnoremap <c-p> <up>

" Disable arrow keys
nnoremap <Left>  <nop>
nnoremap <Right> <nop>
nnoremap <Up>    <nop>
nnoremap <Down>  <nop>

" Navigate through windows with Ctrl+(h|j|k|l)
nnoremap <C-j> <C-W>j
nnoremap <C-h> <C-W>h
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" Search for the current selected word with *
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>

" Turn paste mode on/off
noremap <leader>pp :setlocal paste!<cr>
noremap <leader>PP :setlocal nopaste!<cr>

" Buffers
noremap <leader>d :bdelete<cr>
noremap <leader>l :sbNext<cr>
noremap <leader>h :sbprevious<cr>

" Windows size
nnoremap f <C-W>=
nnoremap F <C-W>_<C-W>\|
"nnoremap < :vertical resize -10<cr>
"nnoremap > :vertical resize +10<cr>
nnoremap - :resize -5<cr>
nnoremap + :resize +5<cr>

" Quit insert mode with Ctrl+d
inoremap <C-d> <Esc>
inoremap jk <Esc>

" Quit Vim with 'q' (like more/less)
nnoremap q :q<cr>

" Go to the begining or the end of a line with Ctrl+(a|e) in INSERT mode
inoremap <C-a> <c-o>0
inoremap <C-e> <c-o>$

" Write file with zz
nnoremap zz :w<cr>

" Move current line or visual-selection with Ctrl+Shift+(j|k)
"nnoremap <c-s-j> :move .+1<CR>==
"nnoremap <c-s-k> :move .-2<CR>==
"inoremap <c-s-j> <Esc>:move .+1<CR>==gi
"inoremap <c-s-k> <Esc>:move .-2<CR>==gi
"vnoremap <c-s-j> :move '>+1<CR>gv=gv
"vnoremap <c-s-k> :move '<-2<CR>gv=gv

" Open .vimrc with <space>+e and source it with <space>+s
nnoremap <leader>e :vsplit $MYVIMRC<cr>
nnoremap <leader>s :source $MYVIMRC<cr>

" Surround the current word with " or '
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

" Open a new buffer in a vsplit and enter INSERT mode
nnoremap <leader>v :vnew<cr>i

" Disable hlsearch until the next search
nnoremap <esc><esc> :silent! nohls<cr>

" Modify parameters in parentheses, eg: dp (delete), cp (delete + insert mode)
onoremap p i(

" Preserve visual selection when using < or >
xnoremap < <gv
xnoremap > >gv


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable cursorline in INSERT mode
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter * set nocursorline

" Disable hlsearch when entering ISNERT mode
autocmd InsertEnter * setlocal nohlsearch
autocmd InsertLeave * setlocal hlsearch

" Remove trailing whitespace
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>t :call StripWhitespace()<cr>

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'Raimondi/delimitMate'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'cespare/vim-toml'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'jreybert/vimagit'
Plug 'junegunn/vim-easy-align'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-signify'
Plug 'mbbill/undotree'
Plug 'morhetz/gruvbox'
Plug 'pearofducks/ansible-vim'
Plug 'rodjek/vim-puppet'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'syngan/vim-vimlint'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-git'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'vim-jp/vim-vimlparser'
Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'
Plug 'ryanoasis/vim-devicons'
call plug#end()

"
" ctrlp.vim (https://github.com/ctrlpvim/ctrlp.vim.git)
"
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|png)$',
  \ }

"
" NERD Tree (https://github.com/scrooloose/nerdtree)
"
" open NERDTree with Vim
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
" open NERDTree even if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" exit Vim if NERDTree is the last window opened
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinPos = "left"
let g:NERDTreeShowHidden=1
let g:NERDTreeMapActivateNode='<space>'
let g:NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nt :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

"
" vim-airline (https://github.com/vim-airline/vim-airline)
"
let g:airline_theme='gruvbox'
let g:airline_highlighting_cache = 1
let g:airline_powerline_fonts = 1

"
" gruvbox theme (https://github.com/morhetz/gruvbox)
"
let g:gruvbox_contrast_dark = 'medium'

"
" syntastic (https://github.com/vim-syntastic/syntastic)
"
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 0 " syntastic slows down everything when opening big files
let g:syntastic_check_on_wq = 0

"
" tagbar (https://github.com/majutsushi/tagbar)
"
map <C-t> :TagbarToggle<cr>


"
" undotree (https://github.com/mbbill/undotree)
"
map <leader>uu :UndotreeToggle<cr>
let g:undotree_WindowLayout = 3
let g:undotree_DiffpanelHeight = 40
let g:undotree_SetFocusWhenToggle = 1

"
" vimagit (https://github.com/jreybert/vimagit)
"
map <C-g> :Magit<cr>

"
" vim-devicons (https://github.com/ryanoasis/vim-devicons)
"
let g:WebDevIconsOS = 'Darwin' " See https://github.com/ryanoasis/vim-devicons/pull/135

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable
colorscheme gruvbox
