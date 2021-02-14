filetype on
filetype plugin indent on

au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime
au BufRead /tmp/mutt-* set tw=72

if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has('termguicolors'))
  set termguicolors
endif

syntax on
set backspace=indent,eol,start
set backup
set backupdir=~/.local/share/nvim/backup
set binary
set bomb
set ttyfast
set clipboard+=unnamedplus
set completeopt=menuone,noselect,preview
set conceallevel=0
set cursorline
set directory=~/.local/share/nvim/swap
set encoding=UTF-8
set foldlevel=0
set foldmethod=manual
set formatoptions+=l
set gdefault
set guioptions-=e
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set linebreak
set linespace=0
set list
set listchars=tab:  
set mouse=a
set nocompatible
set noerrorbells
set nostartofline
set novisualbell
set relativenumber
set number
set regexpengine=1
set report=0
set ruler
set scrolloff=5
set shortmess=atToOc
set showcmd
set showmatch
set showmode
set showtabline=2
set sidescrolloff=10
set smartcase
set splitbelow
set splitright
set t_Co=256
set title
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)
set ttimeoutlen=50
set undodir=~/.local/share/nvim/undo
set undofile
set updatetime=300
set wildmenu
set wildmode=full
set wrap
set writebackup
set autoindent
set expandtab
set shiftround
set fileformat=unix
set pyxversion=3
set shiftwidth=4
set softtabstop=4
set tabstop=4
set ttimeoutlen=0
set autoread
set modifiable

let g:python3_host_prog       = '/usr/bin/python3'

