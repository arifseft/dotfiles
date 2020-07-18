call plug#begin('~/.vim/plugged')
    Plug 'AndrewRadev/splitjoin.vim'
	Plug 'airblade/vim-gitgutter'
    Plug 'airblade/vim-rooter'
	" Plug 'beanworks/vim-phpfmt'
	Plug 'editorconfig/editorconfig-vim'
	Plug 'ekalinin/Dockerfile.vim'
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
    Plug 'francoiscabrol/ranger.vim'
    Plug 'honza/vim-snippets'
	Plug 'leafgarland/typescript-vim'
    Plug 'lifepillar/vim-solarized8'
	Plug 'jwalton512/vim-blade'
	Plug 'jiangmiao/auto-pairs'
    if isdirectory('/usr/local/opt/fzf')
        Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
    else
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
        Plug 'junegunn/fzf.vim'
    endif
    Plug 'junegunn/vim-easy-align'
	Plug 'majutsushi/tagbar'
	Plug 'MaxMEllon/vim-jsx-pretty'
    Plug 'mhinz/vim-startify'
	Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
	Plug 'pangloss/vim-javascript'
	Plug 'neoclide/vim-jsx-improve'
	Plug 'preservim/nerdtree'
    Plug 'preservim/nerdcommenter'
	Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
    Plug 'rbgrouleff/bclose.vim'
	Plug 'ryanoasis/vim-devicons'
	Plug 'SirVer/ultisnips'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'tobyS/pdv'
	Plug 'tobyS/vmustache'
	Plug 'tpope/vim-abolish'
	Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-rails'
    Plug 'tpope/vim-sensible'
	Plug 'tpope/vim-surround'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
	Plug 'vim-ruby/vim-ruby'
	Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
    Plug 'majutsushi/tagbar'
	" Plug 'vim-syntastic/syntastic'
	" Plug 'wsdjeg/vim-todo'
call plug#end()

