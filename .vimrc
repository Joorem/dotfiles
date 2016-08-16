set autoindent
set bs=2                " set relaxed backspace style
set hlsearch            " highlight search
set is                  " set incrementalsearch
set ignorecase          " ignore case during searches
set ls=2                " always show status line
set novisualbell
set number              " show line numbers
set ruler               " always show cursor position
set showcmd
set shiftwidth=2        " set spaces for autoindent
set sm                  " set showmatch
set smartindent
set tabstop=8           " set spaces for tab
set textwidth=65000
set title               " show title in console title bar
set ttyfast             " smoother changes
set ttyscroll=0         " turn off scrolling (did not work well with putty)
set visualbell t_vb=    " turn off error beep/flash
set background=dark

let g:airline#extensions#tabline#enabled = 1
let g:syntastic_enable_perl_checker = 1

execute pathogen#infect()
syntax enable
colorscheme jellybeans
