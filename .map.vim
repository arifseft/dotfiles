let mapleader = ","

" Clear search highlighting with Escape key
nnoremap <silent><esc> :noh<cr><esc>

" terminal emulation
nnoremap <silent> <leader>h :sp <bar> terminal<CR><INS>
nnoremap <silent> <leader>v :vsp <bar> terminal<CR><INS>
tnoremap <ESC> <C-\><C-n>

"" Set working directory
nnoremap <leader>/ :cd %:p:h<CR>
nnoremap <leader>// :cd `git rev-parse --show-toplevel`<CR>

command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview(), <bang>0)

nnoremap <C-g> :Rg<Cr> 
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

nnoremap <silent> <leader>, :Buffers<CR>
tmap <leader>, :Buffers<CR>
nnoremap <silent> <C-f> :BLines<CR>
nnoremap <silent> <leader>f :Lines<CR>
nnoremap <silent> <leader>t :BTags<CR>
" nnoremap <silent> <C-p> :call fzf#vim#files('$KARIR', {'options': '--prompt ""'})<CR>

nnoremap <silent> <C-p> :call fzf#vim#files(FindRootDirectory(), {'options': '--prompt ""'})<cr>

nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>
map <leader>m :vsp $HOME/.map.vim<CR>

"Recovery commands from history through FZF
nmap <leader>y :History:<CR>

noremap YY "+y<CR>
noremap XX "+x<CR>

if has('macunix')
    " pbcopy for OSX copy/paste
    vmap <C-x> :!pbcopy<CR>
    vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>x :bn<CR>

noremap <leader>j :cn<CR>
noremap <leader>k :cp<CR>

"" Close buffer
nmap <leader>c :Bclose<CR>
tmap <leader>c exit<CR>
noremap <leader>q :q<CR>


"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Adjust windows size
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Disable arrow keys
noremap <UP> <NOP>
noremap <DOWN> <NOP>
noremap <RIGHT> <NOP>
noremap <LEFT> <NOP>

" edit vimrc
nnoremap <leader>e :vsp $MYVIMRC<cr>

" edit snippets
nnoremap <leader>s :vsp $XDG_CONFIG_HOME/coc/ultisnips/go.snippets<cr>Go

map <C-t> :cd `git rev-parse --show-toplevel` <bar> NERDTreeToggle <bar> NERDTreeRefreshRoot <CR>
map <C-b> <C-^>
map <C-a> <esc>ggVG
map <leader>d 0yaf]]O<esc>O<esc>p]]w
map <leader>sv :source $DOTFILES/.config/nvim/init.vim<CR>
map <leader>o :Ranger<CR>
map gid :GetDataImplement<CR>

" map gat :'<,'>GoAddTags<CR>
" map grt :'<,'>GoRemoveTags<CR>
map gat :GoAddTags<CR>
map grt :GoRemoveTags<CR>
