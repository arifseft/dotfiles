call plug#begin('~/.vim/plugged')
    Plug 'AndrewRadev/splitjoin.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'airblade/vim-rooter'
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
    Plug 'francoiscabrol/ranger.vim'
    Plug 'honza/vim-snippets'
    Plug 'lifepillar/vim-solarized8'
    Plug 'jiangmiao/auto-pairs'
    if isdirectory('/usr/local/opt/fzf')
        Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
    else
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
        Plug 'junegunn/fzf.vim'
    endif
    Plug 'junegunn/vim-easy-align'
    Plug 'mhinz/vim-startify'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'preservim/nerdtree'
    Plug 'preservim/nerdcommenter'
    Plug 'rbgrouleff/bclose.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-surround'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
call plug#end()

