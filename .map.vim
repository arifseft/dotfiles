let mapleader = ","

" Clear search highlighting with Escape key
nnoremap <silent><esc> :noh<cr><esc>

" terminal emulation
nnoremap <silent> <leader>h :sp <bar> terminal<CR><INS>
nnoremap <silent> <leader>v :vsp <bar> terminal<CR><INS>
tnoremap <ESC> <C-\><C-n>

"" Quick exit insert mode with jk
inoremap jk <ESC>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>


command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview(), <bang>0)

nnoremap <C-g> :Rg<Cr> 
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <C-f> :BLines<CR>
nnoremap <silent> <leader>f :Lines<CR>
nnoremap <silent> <leader>t :BTags<CR>
nnoremap <silent> <C-p> :call fzf#vim#files('$KARIR', {'options': '--prompt ""'})<CR>

nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>
map <leader>m :Maps<CR>

"Recovery commands from history through FZF
nmap <leader>y :History:<CR>

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
    " pbcopy for OSX copy/paste
    vmap <C-x> :!pbcopy<CR>
    vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>x :bn<CR>


"" Close buffer
nmap <leader>c :bd<CR>
tmap <leader>c exit<CR>>
noremap <leader>q :q<CR>


"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Disable arrow keys
map <UP> <NOP>
map <DOWN> <NOP>
map <RIGHT> <NOP>
map <LEFT> <NOP>

" edit vimrc
nnoremap <leader>e :vsp $MYVIMRC<cr>

" edit snippets
nnoremap <leader>s :vsp $XDG_CONFIG_HOME/coc/ultisnips/go.snippets<cr>G

" replace
nnoremap <leader>r :%s///g<Left><Left>
xnoremap <leader>r :%s///g<Left><Left>
nnoremap <leader>rc :%s///gc<Left><Left>
xnoremap <leader>rc :%s///gc<Left><Left>

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

map <C-n> :NERDTreeToggle<CR>

