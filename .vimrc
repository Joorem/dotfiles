"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set autoindent
set complete-=i                   " disable scanning included files
set complete-=t                   " disable searching tags
set cursorline
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
set switchbuf=usetab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ' '

" Make <c-p> and <c-n> behave like <up> and <down>: show new or previous results matching current command-line
cnoremap <c-n> <down>
cnoremap <c-p> <up>

" Disable arrow keys
nnoremap <Left>  <nop>
nnoremap <Right> <nop>
nnoremap <Up>    <nop>
nnoremap <Down>  <nop>

" Navigate through windows with Ctrl+(h|j|k|l)
nnoremap <C-h> <C-W><C-h>
nnoremap <C-j> <C-W><C-j>
nnoremap <C-k> <C-W><C-k>
nnoremap <C-l> <C-W><C-l>

" Search for the current selected word with *
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>

" Turn paste mode on/off
noremap <leader>pp :setlocal paste!<cr>
noremap <leader>PP :setlocal nopaste!<cr>

" Buffers
noremap <leader>d :bdelete<cr>
noremap <leader>l :sbNext<cr>
noremap <leader>h :sbprevious<cr>

" Quit insert mode with Ctrl+d
inoremap <c-d> <esc>

" Write file with zz
nnoremap zz :w<cr>

" Move current line or visual-selection with Ctrl+Shift+(j|k)
nnoremap <c-s-j> :move .+1<CR>==
nnoremap <c-s-k> :move .-2<CR>==
inoremap <c-s-j> <Esc>:move .+1<CR>==gi
inoremap <c-s-k> <Esc>:move .-2<CR>==gi
vnoremap <c-s-j> :move '>+1<CR>gv=gv
vnoremap <c-s-k> :move '<-2<CR>gv=gv

" Open .vimrc with <space>+e and source it with <space>+s
nnoremap <leader>e :vsplit $MYVIMRC<cr>
nnoremap <leader>s :source $MYVIMRC<cr>

" Surround the current word with " or '
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

" Open a new buffer in a vsplit and enter INSERT mode
nnoremap <c-v> :vnew<cr>i

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

execute pathogen#infect()

" ctrlp.vim (https://github.com/ctrlpvim/ctrlp.vim.git)
map <leader>u :CtrlPMRU<cr>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|png)$',
  \ }

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
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_perl_checker = 1
let g:syntastic_enable_ruby_checker = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable
colorscheme gruvbox
