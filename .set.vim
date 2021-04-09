set autoindent
set autoread
set backspace=indent,eol,start
set clipboard=unnamed
set cmdheight=1
set cpoptions+=n
set encoding=utf8
set expandtab
set fileencoding=utf-8
set fileencodings=utf-8
set fillchars+=vert:│
" set foldlevel=1 " 99 disable fold, 1 enable fold
set foldmethod=indent
" set foldnestmax=2
set foldenable

set gdefault
set hidden
set history=10000
set hlsearch
set ignorecase
set laststatus=2
set lazyredraw
set matchpairs+=<:>
set modifiable
set mouse=a
set nocursorcolumn
set noerrorbells
set noexpandtab
set noshowmode
set noswapfile
set novisualbell
set nowrap
set number relativenumber
set path+=**
set re=1
set rtp+=/usr/local/opt/fzf
set ruler
set scrolloff=2
set shell=zsh
" set shell=zsh\ -i
" set shell=/usr/local/bin/zsh
set shiftwidth=4
" set shortmess=a
set shortmess+=c
set showmatch
set sidescrolloff=5
set signcolumn=yes
set smartcase
set smartindent
set softtabstop=4
set splitbelow
set splitright
set t_Co=256
set tabstop=4
set title
set updatetime=300
set virtualedit=block
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
set wildmode=list:longest,list:full

let iterm_profile = $ITERM_PROFILE
if iterm_profile == "light"
    set background=light
else
    set background=dark
endif

" Fix bug 256color from tmux
if &term =~ '256color'
    " disable Background Color Erase (BCE)
    set t_ut=
endif

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

if !has('nvim')
    set ttymouse=xterm2
    set rtp+=/usr/local/lib/python3.7/site-packages/powerline/bindings/vim
endif

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
endif

