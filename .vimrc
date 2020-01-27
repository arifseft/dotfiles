source $HOME/.plug.vim
source $HOME/.set.vim
source $HOME/.let.vim

"" Clear highlight number
highlight clear LineNr
highlight clear CursorLineNr

syntax enable
colorscheme solarized8
filetype plugin indent on

hi! Normal guibg=NONE ctermbg=NONE
hi! NonText guibg=NONE ctermbg=NONE

" Auto change directory to opened file
autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

" Autosave when left buffer
autocmd FocusLost * silent :up
autocmd WinLeave * silent :up
autocmd BufWinLeave * silent :up

" Exit terminal
augroup terminal_settings
    autocmd!

    autocmd BufWinEnter,WinEnter term://* startinsert
    autocmd BufLeave term://* stopinsert

    " Ignore various filetypes as those will close terminal automatically
    " Ignore fzf, ranger, coc
    autocmd TermClose term://*
          \ if (expand('<afile>') !~ "fzf") && (expand('<afile>') !~ "ranger") && (expand('<afile>') !~ "coc") |
          \   call nvim_input('<CR>')  |
          \ endif
augroup END

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" Load
source $HOME/.map.vim
source $HOME/.startify.vim
source $HOME/.coc.vim

" Automatically source vimrc on save.
autocmd! BufWritePost $MYVIMRC source $MYVIMRC
autocmd! BufWritePost $MYVIMRC AirlineRefresh

autocmd! BufWritePost $HOME/.plug.vim source $MYVIMRC
autocmd! BufWritePost $HOME/.plug.vim AirlineRefresh
autocmd! BufWritePost $HOME/.map.vim source $MYVIMRC
autocmd! BufWritePost $HOME/.map.vim AirlineRefresh
autocmd! BufWritePost $HOME/.let.vim source $MYVIMRC
autocmd! BufWritePost $HOME/.let.vim AirlineRefresh
autocmd! BufWritePost $HOME/.set.vim source $MYVIMRC
autocmd! BufWritePost $HOME/.set.vim AirlineRefresh
