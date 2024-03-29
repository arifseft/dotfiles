let mapleader = ","

" Clear search highlighting with Escape key
nnoremap <silent><esc> :noh<cr><esc>

" terminal emulation
" nnoremap <silent> <leader>h :sp <bar> terminal<CR><INS>
" nnoremap <silent> <leader>v :vsp <bar> terminal<CR><INS>
" tnoremap <ESC> <C-\><C-n>

" Folding {{{

  " Make zO recursively open whatever top level fold we're in, no matter where the
  " cursor happens to be.
  nnoremap zO zCzO
" }}}

"" used with vim's :terminal and neovim's :term
  " if exists(':tnoremap')
  "   " Term mode mappings
  "   tnoremap <c-h> <c-\><c-n><c-w>h
  "   tnoremap <c-j> <c-\><c-n><c-w>j
  "   tnoremap <c-k> <c-\><c-n><c-w>k
  "   tnoremap <c-l> <c-\><c-n><c-w>l
  "
  "   " Dual term/normal mode mappings
  "   " tnoremap <silent> <localleader>z <c-\><c-n>:ZoomWinTabToggle<cr>
  "   " nnoremap <silent> <localleader>z :ZoomWinTabToggle<cr>
  "
  "   " Normal-mode mappings for use with :term
  "   if has('nvim')
  "     nnoremap <localleader>c :tabnew \| term<cr>
  "     nnoremap <localleader>\| :vsp \| term<cr>
  "     nnoremap <localleader>- :sp \| term<cr>
  "     nnoremap <localleader>k :setlocal scrollback=1 \| setlocal scrollback=100000<cr>
  "     augroup NeovimTerminal
  "       autocmd!
  "       autocmd TermOpen * setlocal scrollback=100000
  "       " autocmd TermOpen * nnoremap <cr> i
  "     augroup END
  "   endif
  " endif

" vim-floaterm
nnoremap <silent> <leader><UP>		:FloatermToggle<CR>
tnoremap <silent> <leader><UP>		<C-\><C-n>:FloatermToggle<CR>
nnoremap <silent> <leader><DOWN>	:FloatermNew<CR>
tnoremap <silent> <leader><DOWN>	<C-\><C-n>:FloatermNew<CR>
nnoremap <silent> <leader><LEFT>	:FloatermPrev<CR>
tnoremap <silent> <leader><LEFT>	<C-\><C-n>:FloatermPrev<CR>
nnoremap <silent> <leader><RIGHT>	:FloatermNext<CR>
tnoremap <silent> <leader><RIGHT>	<C-\><C-n>:FloatermNext<CR>

" command! Ranger FloatermNew ranger
" command! Rg FloatermNew rg

"" Set working directory
nnoremap <leader>/ :cd %:p:h<CR>
nnoremap <leader>// :cd `git rev-parse --show-toplevel`<CR>

command! -bang -nargs=* Rg
	\ call fzf#vim#grep(
	\   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
	\   fzf#vim#with_preview(), <bang>0)

nnoremap <C-g> :Rg<CR>
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

nnoremap <silent> <leader>, :Buffers<CR>
tmap <leader>, :Buffers<CR>
nnoremap <silent> <C-f> :BLines<CR>
nnoremap <silent> <leader>t :BTags<CR>
" nnoremap <silent> <C-p> :call fzf#vim#files('$KARIR', {'options': '--prompt ""'})<CR>

nnoremap <silent> <C-p> :call fzf#vim#files(FindRootDirectory(), {'options': '--prompt ""'})<cr>

nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>

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
map <leader>e :vsp $MYVIMRC<cr>
map <leader>m :vsp $HOME/.map.vim<CR>
map <leader>p :vsp $HOME/.plug.vim<cr>

" edit snippets
nnoremap <leader>s :vsp $XDG_CONFIG_HOME/coc/ultisnips/go.snippets<cr>Go

" map <C-t> :cd `git rev-parse --show-toplevel` <bar> NERDTreeToggle <bar> NERDTreeRefreshRoot <CR>
" map tt :TagbarToggle<CR>
map <C-b> <C-^>
map <C-a> <esc>ggVG
map <leader>d 0yaf]]O<esc>O<esc>p]]w
map <leader>sv :source $DOTFILES/.config/nvim/init.vim<CR>
map gid :GetDataImplement<CR>

map gat :GoAddTags<CR>
map grt :GoRemoveTags<CR>

" map ej :lnext<CR>
" map ek :lprevious<CR>

" vim-todo
" nnoremap td :cd `git rev-parse --show-toplevel` <bar> OpenTodo<CR><CR>

" vimspector
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput

" command Exec set splitright | vnew | set filetype=sh | read !sh #

" execute curl
nnoremap <silent> <C-x> :sp <bar> terminal sh %<CR>

" map <leader>ff :NERDTreeFind<CR>
nmap <leader>fr <Plug>CtrlSFCwordPath -W<CR>
vmap <leader>fr <Plug>CtrlSFVwordExec

nmap cm :Commits<CR>

"" coc-explorer
nnoremap <space><space> :CocCommand explorer<CR>
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/coc',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'tab:$': {
\     'position': 'tab:$',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }

" Use preset argument to open it
" nnoremap <space>ed :CocCommand explorer --preset .vim<CR>
" nnoremap <space>ef :CocCommand explorer --preset floating<CR>
" nnoremap <space>ec :CocCommand explorer --preset cocConfig<CR>
" nnoremap <space>eb :CocCommand explorer --preset buffer<CR>

" List all presets
nnoremap <space>el :CocList explPresets

" function! L ()
"   tab term ++curwin
"   tab term lazygit
" endfunction
" command! L execute ":call L()"

map <leader>db :DB g:local

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Git
noremap <Leader>ga :Git add --patch<CR>
noremap <Leader>gc :Git commit<CR>
noremap <Leader>gp :Git push<CR>
noremap <Leader>gl :Git pull<CR>
noremap <Leader>gb :Git blame<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

nnoremap <leader>i :source $DOTFILES/.config/nvim/init.vim \| PlugInstall<CR>

"" Change Enter as toggle fold
nnoremap <C-m> za

nnoremap <silent> } :call CocAction('diagnosticNext')<cr>
nnoremap <silent> { :call CocAction('diagnosticPrevious')<cr>
noremap <Leader>gr :Gremove<CR>
noremap <Leader>gh :GitGutterPreviewHunk<CR>

nnoremap <Space>d :e scp://dev//home/ubuntu/bmi/backend/
nnoremap <Space>s :e scp://dev//home/ubuntu/bmi_staging/backend/
nnoremap <Space>p :e scp://prod//home/ubuntu/bmi/backend/
