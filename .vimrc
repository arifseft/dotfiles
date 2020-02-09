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
autocmd! BufWritePost $DOTFILES/.config/nvim/init.vim source $DOTFILES/.config/nvim/init.vim
autocmd! BufWritePost $DOTFILES/.config/nvim/init.vim AirlineRefresh

autocmd! BufWritePost $HOME/.plug.vim source $DOTFILES/.config/nvim/init.vim
autocmd! BufWritePost $HOME/.plug.vim AirlineRefresh
autocmd! BufWritePost $HOME/.map.vim source $DOTFILES/.config/nvim/init.vim
autocmd! BufWritePost $HOME/.map.vim AirlineRefresh
autocmd! BufWritePost $HOME/.let.vim source $DOTFILES/.config/nvim/init.vim
autocmd! BufWritePost $HOME/.let.vim AirlineRefresh
autocmd! BufWritePost $HOME/.set.vim source $DOTFILES/.config/nvim/init.vim
autocmd! BufWritePost $HOME/.set.vim AirlineRefresh

"" Dep ensure current response
command! Dep cd %:h <bar> cd `git rev-parse --show-toplevel` <bar> execute 'terminal rm -rf vendor Gopkg.lock && dep ensure -v'
command! DepNoLock cd %:h <bar> cd `git rev-parse --show-toplevel` <bar> execute 'terminal rm -rf vendor && dep ensure -v'

command! RunQourse terminal cd $KARIR/qourse-api/cmd/app && go run qourse-api/main.go
command! StopQourse bd! term*qourse-api*main.go

command! RunNsq terminal nsq
command! RunQuiz terminal cd $KARIR/quiz/cmd/app && go run quiz/main.go
command! RunQuizConsumer terminal cd $KARIR/quiz/cmd/app && go run consumer/main.go
command! StopQuiz bd! term*quiz*quiz*main.go
command! StopQuizConsumer bd! term*quiz*consumer*main.go

command! RunQerja terminal cd $KARIR/qerja-api/cmd/app && go run qerja-api/main.go
command! StopQerja bd! term*qerja-api/main.go

command! RunQelas terminal cd $KARIR/qelas-api/cmd/app && go run qelas-api/main.go
command! StopQelas bd! term*qelas-api/main.go

function RunAll()
	 :RunQuiz
	 :RunQuizConsumer
	 :RunQourse
	 :RunQelas
	 :RunQerja
endfunction
command! RunAll call RunAll()

function StopAll()
	 :StopQuiz
	 :StopQuizConsumer
	 :StopQourse
	 :StopQelas
	 :StopQerja
endfunction
command! StopAll call StopAll()

function Run(repo)
	:exe 'bd! term*'.a:repo.'/main.go'
	:exe 'sp | terminal cd $KARIR/'.a:repo.'/cmd/app && go run '.a:repo.'/main.go'
endfunction
command! -nargs=1 Run call Run(<f-args>)

function RunConsumer(repo)
	:exe 'bd! term*'.a:repo.'*consumer/main.go'
	:exe 'sp | terminal cd $KARIR/'.a:repo.'/cmd/app && go run consumer/main.go'
endfunction
command! -nargs=1 RunConsumer call RunConsumer(<f-args>)

function Stop(repo)
	:exe 'bd! term*'.a:repo.'/main.go'
endfunction
command! -nargs=1 Stop call Stop(<f-args>)

function StopConsumer(repo)
	:exe 'bd! term*'.a:repo.'*consumer/main.go'
endfunction
command! -nargs=1 StopConsumer call StopConsumer(<f-args>)
