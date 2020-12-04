"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=utf8
scriptencoding utf-8

"
" Files
"
set autoread                      " reload files changed outside vim
set autowrite                     " automatically :write before running commands
set fileformats=unix,dos,mac      " EOL to use
set nobackup                      " do not backup modified files
set noswapfile                    " do not use a swapfile for the buffer
set nowritebackup

"
" Indentation
"
set autoindent                    " copy indent from current line when starting a new line
set copyindent                    " copy the structure of the existing lines indent when autoindenting a new line
set expandtab                     " use spaces for tab
set smartindent                   " do smart autoindenting when starting a new line
set shiftround                    " round indent to multiple of 'shiftwidth'
set shiftwidth=2                  " number of spaces to use for each step of (auto)indent
set smarttab                      " inserts blanks according to 'shiftwidth'
set softtabstop=2                 " number of spaces that a <Tab> counts for
set tabstop=2                     " set spaces for tab

"
" Input
"
set textwidth=0
set formatoptions-=c              " automatic formatting configuration
set switchbuf=usetab

"
" Interface
"
set background=dark
set cursorline                    " highlight the screen line of the cursor
set laststatus=2                  " always show status line
set lazyredraw
set noshowmode
set number                        " print the line number in front of each line
set numberwidth=4                 " minimal number of columns to use for the line number
set regexpengine=1                " speedup refresh with cursorline enabled
set ruler                         " always show cursor position
set signcolumn=yes                " always show the signcolumn
set showcmd                       " display incomplete commands
set showmatch
set showtabline=0                 " do not show the tabline (already shown with vim-airline plugin)
set scrolloff=5                   " minimal number of screen lines to keep above and below the cursor
set splitbelow                    " open new horizontal split below the current one
set splitright                    " open new vertical split to the righ of the current one
set visualbell t_vb=              " turn off error beep/flash
set wildmenu                      " turn on the Wild menu
if (has('termguicolors'))
  set termguicolors
endif

"
" Keyboard
"
set backspace=2                   " set relaxed backspace style
set timeoutlen=1000 ttimeoutlen=0 " no delay when pressing escape key

"
" Search
"
set complete-=i                   " disable scanning included files
set complete-=t                   " disable searching tags
set hlsearch                      " highlight search
set ignorecase                    " ignore case during searches
set incsearch                     " set incrementalsearch
set smartcase                     " override the 'ignorecase' option if the search pattern contains uppercase characters

if &shell =~# 'fish$'
  set shell=sh
endif


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

" Navigate through windows with Ctrl+(h|j|k|l) or with H J K L
nnoremap <C-h> :wincmd h<cr>
nnoremap <C-j> :wincmd j<cr>
nnoremap <C-k> :wincmd k<cr>
nnoremap <C-l> :wincmd l<cr>
nnoremap H :wincmd h<cr>
nnoremap J :wincmd j<cr>
nnoremap K :wincmd k<cr>
nnoremap L :wincmd l<cr>

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
nnoremap - :resize -5<cr>
nnoremap + :resize +5<cr>
nnoremap <leader>- :vertical resize -5<cr>
nnoremap <leader>+ :vertical resize +5<cr>

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

" Open .vimrc with <space>+e and source it with <space>+s
nnoremap <leader>e :vsplit $MYVIMRC<cr>
nnoremap <leader>s :source $MYVIMRC<cr>

" Remove exra whitespaces
nnoremap <leader>t :StripWhitespace<cr>
"
" Reload file with Ctrl+e (quite usefull when developing a syntax file)
nnoremap <C-e> :e<cr>

" Surround the current word with " or '
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

" Fix indentation
nnoremap <silent> <leader>m gg=G

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
augroup insert_no_cursorline
    autocmd!
  autocmd InsertLeave,WinEnter * set cursorline
  autocmd InsertEnter * set nocursorline
augroup END

" Disable hlsearch when entering INSERT mode
augroup insert_no_hlsearch
    autocmd!
  autocmd InsertEnter * setlocal nohlsearch
  autocmd InsertLeave * setlocal hlsearch
augroup END

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

" ClearView: make the UI minimalist with Ctrl+P (for screenshots)
let s:cleared = 0
let s:ve = &t_ve
function! ClearView()
    if s:cleared == 0
        NERDTreeClose
        set laststatus=0
        set nocursorline
        set nonumber
        set noruler
        set noshowcmd
        set noshowmode
        set signcolumn=no
        set t_ve=
        set guicursor=a:xxx
        let s:cleared = 1
    else
        NERDTreeToggle
        wincmd p
        set laststatus=2
        set cursorline
        set number
        set ruler
        set showcmd
        set showmode
        set signcolumn=yes
        execute 'set t_ve=' . s:ve
        let s:cleared = 0
    endif
endfunction
nnoremap <C-p> :call ClearView()<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" UI
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jreybert/vimagit'
Plug 'lifepillar/vim-gruvbox8'
Plug 'lilydjwg/colorizer'
Plug 'mhinz/vim-signify'
Plug 'psliwka/vim-smoothie'
Plug 'sainnhe/sonokai'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'

" Filetype & Syntax
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'Joorem/vim-haproxy'
Plug 'cespare/vim-toml'
Plug 'chr4/nginx.vim'
Plug 'dag/vim-fish'
Plug 'godlygeek/tabular'
Plug 'hashivim/vim-terraform'
Plug 'pearofducks/ansible-vim'
Plug 'rodjek/vim-puppet'
Plug 'rust-lang/rust.vim'
Plug 'syngan/vim-vimlint'
Plug 'tmux-plugins/vim-tmux'
Plug 'vim-jp/vim-vimlparser'

" Utility
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'junegunn/vim-easy-align'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-git'
Plug 'w0rp/ale'

call plug#end()

filetype plugin indent on

"
" Coc.vim
"
let g:airline#extensions#coc#enabled = 1

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" use K to open documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>

"
" Ale
"
let g:airline#extensions#ale#enabled = 1
let g:ale_sh_shellcheck_options = '-x'

"
" colorizer (https://github/lilydjwg/colorizer)
"
map <leader>c :ColorToggle<cr>

"
" LeaderF (https://github.com/Yggdroot/LeaderF)
"
let g:Lf_CommandMap = {'<C-]>': ['<C-V>'],}
let g:Lf_PreviewInPopup = 1
let g:Lf_StlColorscheme = 'gruvbox_material'
let g:Lf_WildIgnore = {
  \ 'dir': ['.svn','.git','.hg'],
  \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
  \}
let g:Lf_WindowPosition = 'popup'

"
" NERD Tree (https://github.com/scrooloose/nerdtree)
"
augroup nerdtree
  autocmd!

  " open NERDTree with Vim
  autocmd VimEnter * NERDTree
  autocmd VimEnter * wincmd p

  " open NERDTree even if no file is specified
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

  " exit Vim if NERDTree is the last window opened
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinPos = 'left'
let g:NERDTreeShowHidden=1
let g:NERDTreeMapActivateNode='<space>'
let g:NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nt :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

"
" Sonokai (https://github.com/sainnhe/sonokai)
"

let g:sonokai_style = 'andromeda'
let g:sonokai_disable_italic_comment = 1
let g:sonokai_diagnostic_line_highlight = 1

"
" vim-airline (https://github.com/vim-airline/vim-airline)
"
let g:airline_theme = 'sonokai'
let g:airline_highlighting_cache = 1
let g:airline_powerline_fonts = 1

"
" tagbar (https://github.com/majutsushi/tagbar)
"
map <C-t> :TagbarToggle<cr>

"
" Terraform
"
let g:terraform_align = 1


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
colorscheme sonokai
