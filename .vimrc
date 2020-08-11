" Load sources
source $DOTFILES/.plug.vim
source $DOTFILES/.set.vim
source $DOTFILES/.let.vim

packadd cfilter

let g:vdebug_features = { 'max_children': 256 }
let g:vdebug_options = {}
let g:vdebug_options['ide_key'] = 'XDEBUG_VIM'
let g:vdebug_options['break_on_open'] = 0
let g:vdebug_options['server'] = '127.0.0.1'
let g:vdebug_options['port'] = '9001'

let python_highlight_all = 1

" syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" map <leader>s :SyntasticCheck<CR>
" map <leader>d :SyntasticReset<CR>
" map <leader>e :lnext<CR>
" map <leader>r :lprev<CR>
"
" " tag list
" map <leader>t :TagbarToggle<CR>

" Auto open NERDTree
" au VimEnter * NERDTree

" Define some single Blade directives. This variable is used for highlighting only.
let g:blade_custom_directives = ['datetime', 'javascript']

" Define pairs of Blade directives. This variable is used for highlighting and indentation.
let g:blade_custom_directives_pairs = {
      \   'markdown': 'endmarkdown',
      \   'cache': 'endcache',
      \ }

let g:pdv_template_dir = $HOME ."/.vim/plugged/pdv/templates_snip"
nnoremap <buffer> <C-i> :call pdv#DocumentWithSnip()<CR>

"" Clear highlight number highlight clear LineNr highlight clear CursorLineNr

syntax enable

if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

colorscheme solarized8
filetype plugin indent on

hi! Normal guibg=NONE ctermbg=NONE
hi! NonText guibg=NONE ctermbg=NONE
hi! VertSplit ctermbg=NONE guibg=NONE
" hi! Comment ctermfg=DarkGrey guifg=DarkGrey
" hi! Search ctermbg=DarkRed guibg=DarkBlue
" hi! ErrorMsg ctermbg=White ctermfg=Red guibg=White guifg=Red
"

" Auto change directory to opened file
autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

" Autosave when left buffer
autocmd FocusLost * silent :up
autocmd WinLeave * silent :up
autocmd BufWinLeave * silent :up

autocmd FileType go nnoremap <buffer> <c-s> :w <bar> silent CocRestart<CR>
autocmd FileType javascript nnoremap <buffer> <c-s> :w <bar> silent CocRestart<CR>

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

autocmd BufNewFile,BufRead *.js set shiftwidth=2
autocmd BufNewFile,BufRead *.js set softtabstop=4
autocmd BufNewFile,BufRead *.js set tabstop=4

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

source $DOTFILES/.map.vim
source $DOTFILES/.startify.vim
source $DOTFILES/.coc.vim

" Automatically source vimrc on save.
" autocmd! BufWritePost $DOTFILES/.config/nvim/init.vim source $DOTFILES/.config/nvim/init.vim
" autocmd! BufWritePost $DOTFILES/.config/nvim/init.vim AirlineRefresh
"
" autocmd! BufWritePost $DOTFILES/.plug.vim source $DOTFILES/.config/nvim/init.vim
" autocmd! BufWritePost $DOTFILES/.plug.vim AirlineRefresh
" autocmd! BufWritePost $DOTFILES/.map.vim source $DOTFILES/.config/nvim/init.vim
" autocmd! BufWritePost $DOTFILES/.map.vim AirlineRefresh
" autocmd! BufWritePost $DOTFILES/.let.vim source $DOTFILES/.config/nvim/init.vim
" autocmd! BufWritePost $DOTFILES/.let.vim AirlineRefresh
" autocmd! BufWritePost $DOTFILES/.set.vim source $DOTFILES/.config/nvim/init.vim
" autocmd! BufWritePost $DOTFILES/.set.vim AirlineRefresh


" vim-prettier
" let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" vim-javascript
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

function! LaravelView()
	let currentLine = getline(".")
	let viewPath = matchstr(currentLine, '\c(\([''"]\)\zs.\{-}\ze\1')
	let viewPath = substitute(viewPath,'\.','/','ge')
	exe 'cd `git rev-parse --show-toplevel`'
	exe 'e resources/views/'.viewPath.'.blade.php'
endfunction
noremap gv :call LaravelView()<CR>

" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind if NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

function! ToggleNerdTree()
  set eventignore=BufEnter
  NERDTreeToggle
  set eventignore=
endfunction
nmap <C-t> :call ToggleNerdTree()<CR>

" function! LaravelController()
"     let currentLine = getline(".")
"     let a = "	Route::get('/audit/detail/download', 'DashboardController@downloadAuditDetail')"
"
"     let controllerName = matchstr(a, '\c\s.*(\([''"]\)\zs.\{-}\ze\1')
"     let controllerName = substitute(controllerName,'\.','/','e')
" echo controllerName
	" exe 'cd `git rev-parse --show-toplevel`'
	" exe 'e app/Http/Controllers/Admin/'.controllerName.'.php'
" endfunction
" noremap gc :call LaravelController()<CR>

" When using `dd` in the quickfix list, remove the item from the quickfix list.
function! RemoveQFItem()
  let curqfidx = line('.') - 1
  let qfall = getqflist()
  call remove(qfall, curqfidx)
  call setqflist(qfall, 'r')
  execute curqfidx + 1 . "cfirst"
  :copen
endfunction
:command! RemoveQFItem :call RemoveQFItem()
" Use map <buffer> to only map dd in the quickfix window. Requires +localmap
autocmd FileType qf map <buffer> dd :RemoveQFItem<cr>

"" Dep ensure current response
" command! Dep cd %:h <bar> cd `git rev-parse --show-toplevel` <bar> execute 'sp | terminal dep ensure -v'
"
" command! RunNsq terminal nsq
"
" function Run(repo)
"     exe 'sp | terminal cd $KARIR/'.a:repo.'/cmd/app && watchexec -r --exts go,json -w $KARIR/'.a:repo.' go run '.a:repo.'/main.go'
" endfunction
" command! -nargs=1 Run call Run(<f-args>)
"
" function RunConsumer(repo)
"     exe 'sp | terminal cd $KARIR/'.a:repo.'/cmd/app && watchexec -r --exts go,json -w $KARIR/'.a:repo.' go run consumer/main.go'
" endfunction
" command! -nargs=1 RunConsumer call RunConsumer(<f-args>)
"
" function Stop(repo)
"     exe 'bd! term*'.a:repo.'/main.go'
" endfunction
" command! -nargs=1 Stop call Stop(<f-args>)
"
" function StopConsumer(repo)
"     exe 'bd! term*'.a:repo.'*consumer/main.go'
" endfunction
" command! -nargs=1 StopConsumer call StopConsumer(<f-args>)
"
" function CreateLog(repo)
"     exe '!mkdir /var/log/'.a:repo.' && touch /var/log/'.a:repo.'/'.a:repo.'.log'
" endfunction
" command! -nargs=1 CreateLog call CreateLog(<f-args>)
"
" function GetDataImplement()
"     let q = filter(getwininfo(), 'v:val.quickfix && !v:val.loclist')
"     if len(q) != 0
"         clast
"         cclose
"     else
"         GoImplements
"     endif
" endfunction
" command! GetDataImplement call GetDataImplement()
"
" function! s:mixedcase(word)
"   return substitute(s:camelcase(a:word),'^.','\u&','')
" endfunction
" function! s:camelcase(word)
"   let word = substitute(a:word, '-', '_', 'g')
"   if word !~# '_' && word =~# '\l'
"     return substitute(word,'^.','\l&','')
"   else
"     return substitute(word,'\C\(_\)\=\(.\)','\=submatch(1)==""?tolower(submatch(2)) : toupper(submatch(2))','g')
"   endif
" endfunction
" function! s:snakecase(word)
"   let word = substitute(a:word,'::','/','g')
"   let word = substitute(word,'\(\u\+\)\(\u\l\)','\1_\2','g')
"   let word = substitute(word,'\(\l\|\d\)\(\u\)','\1_\2','g')
"   let word = substitute(word,'[.-]','_','g')
"   let word = tolower(word)
"   return word
" endfunction
"
" function CopyQServiceVendor()
"     cd %:p:h
"     let l:vendordir = getcwd()
"     let check = matchstr(l:vendordir, 'vendor')
"     if empty(check)
"        throw "not in vendor directory ! ".l:vendordir
"     endif
"     let l:qservicedir = substitute(l:vendordir, "/karirdotcom.*github.com", "", "")
"     exe "!cp ".l:vendordir."/* ".l:qservicedir
"     echo l:qservicedir." ...Qservice copied "
" endfunction
" command! QServiceVendor call CopyQServiceVendor()
"
" function! PgToStruct(start, end) range
"     for line in range(a:start, a:end)
"         let wordLine = getline(line)
"         call setline(line, substitute(s:mixedcase(wordLine),'^.','\u&',''))
"     endfor
"     let current_pos = getpos(".")
"     execute a:firstline . "," . a:lastline . "s/| NO//e"
"     execute a:firstline . "," . a:lastline . "s/| YES/*/e"
"     execute a:firstline . "," . a:lastline . "s/| no//e"
"     execute a:firstline . "," . a:lastline . "s/| yes/*/e"
"     execute a:firstline . "," . a:lastline . "s/| bool/bool/e"
"     execute a:firstline . "," . a:lastline . "s/| varchar/string/e"
"     execute a:firstline . "," . a:lastline . "s/| _varchar/string/e"
"     execute a:firstline . "," . a:lastline . "s/| json/string/e"
"     execute a:firstline . "," . a:lastline . "s/| text/string/e"
"     execute a:firstline . "," . a:lastline . "s/| int4/uint64/e"
"     execute a:firstline . "," . a:lastline . "s/| numeric/float64/e"
"     execute a:firstline . "," . a:lastline . "s/| date/time.Time/e"
"     execute a:firstline . "," . a:lastline . "s/| timestamp/time.Time/e"
"     execute a:firstline . "," . a:lastline . "s/| time/time.Time/e"
"     execute a:firstline . "," . a:lastline . "GoAddTags json db"
"     call setpos(".", current_pos)
" endfunction
" command! -nargs=* -range PgToStruct <line1>, <line2>call PgToStruct(<line1>, <line2>)
"
" function! StructToInput(start, end) range
"     for line in range(a:start, a:end)
"         exe 'norm 0'
"         exe 'norm w'
"         exe 'norm e'
"         exe 'norm l'
"         exe 'norm d$'
"         exe 'norm yiw'
"         exe 'norm A : input.'
"         exe 'norm p'
"         exe 'norm a ,'
"         exe 'norm j'
"     endfor
" endfunction
" command! -nargs=* -range StructToInput <line1>, <line2>call StructToInput(<line1>, <line2>)
"
" function InitHandler(repo, service)
"     exe '!touch $KARIR/'.a:repo.'/pkg/handler/handler.'.s:camelcase(a:service).'.go'
"     exe 'e $KARIR/'.a:repo.'/pkg/handler/handler.'.s:camelcase(a:service).'.go'
"     exe 'norm i package handler'
"     exe 'w'
" endfunction
" command! -nargs=* InitHandler call InitHandler(<f-args>)
"
" function InitService(repo, service)
"     exe 'Mkdir! $KARIR/'.a:repo.'/pkg/service/'.s:camelcase(a:service)
"     exe 'Mkdir! $KARIR/'.a:repo.'/pkg/service/'.s:camelcase(a:service).'/data'
"     exe '!touch $KARIR/'.a:repo.'/pkg/service/'.s:camelcase(a:service).'/service.'.s:camelcase(a:service).'.go'
"     exe 'e $KARIR/'.a:repo.'/pkg/service/'.s:camelcase(a:service).'/service.'.s:camelcase(a:service).'.go'
"     let serviceInit=[	' package '.s:camelcase(a:service),	' ',	' import "github.com/karirdotcom/'.a:repo.'/pkg/service/'.s:camelcase(a:service).'/data"',	' ', ' type '.s:mixedcase(a:service).'Service struct {', ' 	'.s:camelcase(a:service).'Data data.'.s:mixedcase(a:service).'Data', ' }', ' ', ' func New() '.s:mixedcase(a:service).'Service {', ' 	return '.s:mixedcase(a:service).'Service{', ' 		'.s:camelcase(a:service).'Data: data.Postgres'.s:mixedcase(a:service).'Data{},', ' 	}', ' }']
"     for line in serviceInit
"         exe 'norm o '.line
"     endfor
"     exe 'w'
" endfunction
" command! -nargs=* InitService call InitService(<f-args>)
"
" function InitModel(repo, service, model, table_name)
"     exe 'Mkdir! $KARIR/'.a:repo.'/pkg/service/'.s:camelcase(a:service)
"     exe 'Mkdir! $KARIR/'.a:repo.'/pkg/service/'.s:camelcase(a:service).'/data'
"     exe '!touch $KARIR/'.a:repo.'/pkg/service/'.s:camelcase(a:service).'/data/postgres.'.s:camelcase(a:model).'.go'
"     let getColumns = GetColumns(a:table_name)
"     exe 'e $KARIR/'.a:repo.'/pkg/service/'.s:camelcase(a:service).'/data/postgres.'.s:camelcase(a:model).'.go'
"     let insertColumns = ''
"     let insertParams = ''
"     let updateColumns = ''
"     let c = 0
"     let cx = 0
"     let bi = 1
"     let bu = 1
"     while c < len(getColumns)
"         let cx += 1
"         if getColumns[c] != 'id'
"             let insertColumns = insertColumns.getColumns[c]
"             let insertParams = insertParams.'$'.bi
"             if getColumns[c] != 'created_at'
"                 let updateColumns = updateColumns.getColumns[c].' = $'.bu
"                 let bu += 1
"             endif
"             if cx < len(getColumns)
"                 let insertColumns = insertColumns.', '
"                 let insertParams = insertParams.', '
"                 if getColumns[c] != 'created_at'
"                     let updateColumns = updateColumns.', '
"                 endif
"             endif
"             let bi += 1
"         endif
"         let c += 1
"     endwhile
"     let insertQuery = ' Insert'.s:mixedcase(a:model).' = `INSERT INTO '.a:table_name.'('.insertColumns.') VALUES('.insertParams.') RETURNING id`'
"     let updateQuery = ' Update'.s:mixedcase(a:model).' = `UPDATE '.a:table_name.' SET '.updateColumns.' WHERE id = $'.bu.'`'
"     exe 'norm i package data'
"     exe 'norm o '
"     exe 'norm o import qframeworkDb "github.com/karirdotcom/qframework/pkg/common/database"'
"     exe 'norm o '
"     exe 'norm o type Postgres'.s:mixedcase(a:model).'Data struct{}'
"     exe 'norm o '
"     exe 'norm o type Postgres'.s:mixedcase(a:model).'Statement struct {'
"     exe 'norm o 	Get'.s:mixedcase(a:model).'    qframeworkDb.Qstatement'
"     exe 'norm o 	Insert'.s:mixedcase(a:model).' qframeworkDb.Qstatement'
"     exe 'norm o 	Update'.s:mixedcase(a:model).' qframeworkDb.Qstatement'
"     exe 'norm o }'
"     exe 'norm o '
"     exe 'norm o const ('
"     exe 'norm o 	Get'.s:mixedcase(a:model).' = `SELECT * FROM '.a:table_name.'`'
"     exe 'norm o '.insertQuery
"     exe 'norm o '.updateQuery
"     exe 'norm o )'
"     exe 'norm o '
"     exe 'norm o var postgres'.s:mixedcase(a:model).'Stmt Postgres'.s:mixedcase(a:model).'Statement'
"     exe 'norm o '
"     exe 'norm o func init() {'
"     exe 'norm o 	postgres'.s:mixedcase(a:model).'Stmt.Get'.s:mixedcase(a:model).' = qframeworkDb.QPrepare(database.GetDBMaster(), Get'.s:mixedcase(a:model).')'
"     exe 'norm o 	postgres'.s:mixedcase(a:model).'Stmt.Insert'.s:mixedcase(a:model).' = qframeworkDb.QPrepare(database.GetDBMaster(), Insert'.s:mixedcase(a:model).')'
"     exe 'norm o 	postgres'.s:mixedcase(a:model).'Stmt.Update'.s:mixedcase(a:model).' = qframeworkDb.QPrepare(database.GetDBMaster(), Update'.s:mixedcase(a:model).')'
"     exe 'norm o }'
"     exe 'norm o '
"     exe 'norm o func (m Postgres'.s:mixedcase(a:model).'Data) Get'.s:mixedcase(a:model).'(filter Get'.s:mixedcase(a:model).'Filter) ([]'.s:mixedcase(a:model).', error) {'
"     exe 'norm o 	var '.s:camelcase(a:model).' []'.s:mixedcase(a:model).''
"     exe 'norm o 	var values []interface{}'
"     exe 'norm o 	var where []string'
"     exe 'norm o '
"     exe 'norm o 	query := Get'.s:mixedcase(a:model).''
"     exe 'norm o '
"     exe 'norm o 	if filter.Id != nil {'
"     exe 'norm o 		where = append(where, "id = ?")'
"     exe 'norm o 		values = append(values, *filter.Id)'
"     exe 'norm o 	}'
"     exe 'norm o '
"     exe 'norm o 	var limit uint64'
"     exe 'norm o 	if filter.Limit == 0 {'
"     exe 'norm o 		limit = 1'
"     exe 'norm o 	} else {'
"     exe 'norm o 		limit = filter.Limit'
"     exe 'norm o 	}'
"     exe 'norm o '
"     exe 'norm o 	if len(where) > 0 {'
"     exe 'norm o 		query = query + " WHERE " + strings.Join(where, " AND ")'
"     exe 'norm o 	}'
"     exe 'norm o '
"     exe 'norm o query += fmt.Sprintf(` LIMIT %d OFFSET %d`, limit, filter.Offset)'
"     exe 'norm o '
"     exe 'norm o 	rebind := database.GetDBMasterPointer().Rebind(query)'
"     exe 'norm o '
"     exe 'norm o 	q := qframeworkDb.QPrepare(database.GetDBMaster(), rebind)'
"     exe 'norm o 	defer q.Statement.Close()'
"     exe 'norm o 	err := database.GetDb().Select('
"     exe 'norm o 		q,'
"     exe 'norm o 		&'.s:camelcase(a:model).','
"     exe 'norm o 		values...,'
"     exe 'norm o 	)'
"     exe 'norm o '
"     exe 'norm o 	if err != nil {'
"     exe 'norm o 		if err == sql.ErrNoRows {'
"     exe 'norm o 			return nil, nil'
"     exe 'norm o 		}'
"     exe 'norm o '
"     exe 'norm o 		return nil, qerror.NewError(err)'
"     exe 'norm o 	}'
"     exe 'norm o '
"     exe 'norm o 	return '.s:camelcase(a:model).', nil'
"     exe 'norm o }'
"     exe 'norm o '
"     exe 'norm o func (m Postgres'.s:mixedcase(a:model).'Data) Insert'.s:mixedcase(a:model).'(input '.s:mixedcase(a:model).') (uint64, error) {'
"     exe 'norm o 	var id uint64'
"     exe 'norm o '
"     exe 'norm o 	args := []interface{}{'
"     let c = 0
"     while c < len(getColumns)
"         if getColumns[c] != 'id'
"             exe 'norm o input.'.s:mixedcase(getColumns[c]).','
"         endif
"         let c += 1
"     endwhile
"     exe 'norm o 	}'
"     exe 'norm o '
"     exe 'norm o 	err := database.GetDb().QueryRow(postgres'.s:mixedcase(a:model).'Stmt.Insert'.s:mixedcase(a:model).', args...).Scan(&id)'
"     exe 'norm o 	if err != nil {'
"     exe 'norm o 		return id, qerror.NewError(err)'
"     exe 'norm o 	}'
"     exe 'norm o '
"     exe 'norm o 	return id, nil'
"     exe 'norm o }'
"     exe 'norm o '
"     exe 'norm o func (m Postgres'.s:mixedcase(a:model).'Data) Update'.s:mixedcase(a:model).'(id uint64, input '.s:mixedcase(a:model).') (*'.s:mixedcase(a:model).', error) {'
"     exe 'norm o 	args := []interface{}{'
"     let c = 0
"     while c < len(getColumns)
"         if getColumns[c] != 'id' && getColumns[c] != 'created_at'
"             exe 'norm o input.'.s:mixedcase(getColumns[c]).','
"         endif
"         let c += 1
"     endwhile
"     exe 'norm o 		id,'
"     exe 'norm o 	}'
"     exe 'norm o '
"     exe 'norm o 	_, err := database.GetDb().Exec(postgres'.s:mixedcase(a:model).'Stmt.Update'.s:mixedcase(a:model).', args...)'
"     exe 'norm o '
"     exe 'norm o 	if err != nil {'
"     exe 'norm o 		return &input, qerror.NewError(err)'
"     exe 'norm o 	}'
"     exe 'norm o '
"     exe 'norm o 	return &input, nil'
"     exe 'norm o }'
"     exe 'w'
" endfunction
" command! -nargs=* InitModel call InitModel(<f-args>)
"
" function InitInterface(repo, service, model)
"     exe 'Mkdir! $KARIR/'.a:repo.'/pkg/service/'.s:camelcase(a:service)
"     exe 'Mkdir! $KARIR/'.a:repo.'/pkg/service/'.s:camelcase(a:service).'/data'
"     exe '!touch $KARIR/'.a:repo.'/pkg/service/'.s:camelcase(a:service).'/data/interface.'.s:camelcase(a:model).'.go'
"     exe 'e $KARIR/'.a:repo.'/pkg/service/'.s:camelcase(a:service).'/data/interface.'.s:camelcase(a:model).'.go'
"     let interfaceInit=[' package data', ' ', ' import "time"', ' ', ' type Get'.s:mixedcase(a:model).'Filter struct {', ' 	Id     *uint64 `json:"id" db:"id"`', ' 	Limit  uint64  `json:"limit"`', ' 	Offset uint64  `json:"offset"`', ' }', ' ', ' type '.s:mixedcase(a:model).'Data interface {', ' 	Get'.s:mixedcase(a:model).'(filter Get'.s:mixedcase(a:model).'Filter) ([]'.s:mixedcase(a:model).', error)', ' 	Insert'.s:mixedcase(a:model).'(payload '.s:mixedcase(a:model).') (uint64, error)', ' 	Update'.s:mixedcase(a:model).'(id uint64, payload '.s:mixedcase(a:model).') (*'.s:mixedcase(a:model).', error)', ' }']
"     for line in interfaceInit
"         exe 'norm o '.line
"     endfor
"     exe 'w'
" endfunction
" command! -nargs=* InitInterface call InitInterface(<f-args>)
"
" function InitModelInterface(repo, service, model, table_name)
"     exe 'InitInterface '.a:repo.' 'a:service.' '.a:model
"     exe 'CreatePgStruct '.a:repo.' '.a:service.' '.a:model.' '.a:table_name
"     exe 'InitModel '.a:repo.' '.a:service.' '.a:model.' '.a:table_name
" endfunction
" command! -nargs=* InitModelInterface call InitModelInterface(<f-args>)
"
" function InitAll(repo, service, model, table_name)
"     exe 'InitModelInterface '.a:repo.' '.a:service.' '.a:model.' '.a:table_name
"     exe 'InitService '.a:repo.' '.a:service
"     exe 'InitHandler '.a:repo.' '.a:service
" endfunction
" command! -nargs=* InitAll call InitAll(<f-args>)
"
" function CreateServiceFuncMS(repo, service, resource)
"     exe 'e $KARIR/'.a:repo.'/pkg/service/'.s:camelcase(a:service).'/service.'.s:camelcase(a:service).'.go'
"     exe 'norm G'
"     exe 'norm o'
"     let serviceFunc=[' type '.a:resource.a:service.'Input struct {', ' 	Limit  uint64 `json:"limit"`', ' 	Offset uint64 `json:"offset"`', ' }', ' ', ' type '.a:resource.a:service.'Output struct {', ' 	Id        uint64     `json:"id"`', ' 	CreatedAt time.Time  `json:"created_at"`', ' 	UpdatedAt time.Time  `json:"updated_at"`', ' }', ' ',' func (s '.a:service.'Service) '.a:resource.a:service.'(input '.a:resource.a:service.'Input) ([]'.a:resource.a:service.'Output, error) {','	'.s:camelcase(a:service).', err := s.'.s:camelcase(a:service).'Data.'.a:resource.a:service.'(data.'.a:resource.a:service.'Filter{','		Limit:  input.Limit,','		Offset: input.Offset,','	})','	if err != nil {','		return nil, qerror.NewError(err)','	}','	if '.s:camelcase(a:service).' == nil {','		return nil, nil','	}','','	var output []'.a:resource.a:service.'Output','	copier.Copy(&output, &'.s:camelcase(a:service).')','','	return output, nil','}']
"     for line in serviceFunc
"         exe 'norm o '.line
"     endfor
"     exe 'w'
" endfunction
" command! -nargs=* CreateServiceFuncMS call CreateServiceFuncMS(<f-args>)
"
" function CreateEndpointMS(repo, url, service, resource)
"     exe 'e $KARIR/'.a:repo.'/cmd/app/'.a:repo.'/main.go'
"     exe ':norm G'
"     exe ':norm O router.QPOST("'.a:url.'", handler.'.a:resource.a:service.'Handler'.')'
"     exe 'w'
" endfunction
" command! -nargs=* CreateEndpointMS call CreateEndpointMS(<f-args>)
"
" function CreateHandlerFuncMS(repo, service, resource)
"     exe 'e $KARIR/'.a:repo.'/pkg/handler/handler.'.s:camelcase(a:service).'.go'
"     exe 'norm G'
"     exe 'norm o'
"     let handlerFunc=['func '.a:resource.a:service.'Handler'.'(writer http.ResponseWriter, request *http.Request, params httprouter.Params) (interface{}, error) {','			 var input '.s:camelcase(a:service).'.'.a:resource.a:service.'Input',	'',	'			 jsonBody, err := ioutil.ReadAll(request.Body)',				 ' err = json.Unmarshal(jsonBody, &input)',				 ' if terr, ok := err.(*json.UnmarshalTypeError); ok {',				 ' return nil, qerror.NewValidationError(fmt.Sprintf("Failed to unmarshal field %s, type %s", terr.Field, terr.Type))',				 ' }',				 ' if err != nil {',				 ' return nil, qerror.NewError(err)',				 ' }',                 '',				 ' validate := validator.New()',                 '',				 ' if err = validate.Struct(input); err != nil {',				 ' errVal := helper.FormatValidatorArrayResponse(err)',				 ' return nil, qerror.NewValidationErrors(errVal)',				 ' }',                 '',				 ' '.s:camelcase(a:service).'Service := '.s:camelcase(a:service).'.New()',				 ' response, err := '.s:camelcase(a:service).'Service.'.a:resource.a:service.'(input)',				 ' if err != nil {',				 ' return nil, qerror.NewError(err)',				 ' }',                 '',				 ' return response, nil',				 ' }']
"     for line in handlerFunc
"         exe 'norm o '.line
"     endfor
"     exe 'w'
" endfunction
" command! -nargs=* CreateHandlerFuncMS call CreateHandlerFuncMS(<f-args>)
"
" function CreateMS(repo, url, service, resource)
"     exe 'CreateEndpointMS '.a:repo.' '.a:url.' '.a:service.' '.a:resource
"     exe 'CreateServiceFuncMS '.a:repo.' '.a:service.' '.a:resource
"     exe 'CreateHandlerFuncMS '.a:repo.' '.a:service.' '.a:resource
" endfunction
" command! -nargs=* CreateMS call CreateMS(<f-args>)
"
" function CreateProxy(repo, url, service, resource)
"     exe 'e $KARIR/'.a:repo.'/pkg/service/'.s:camelcase(a:service).'/service.'.s:camelcase(a:service).'.go'
"     exe 'norm gg'
"     exe '/type '.a:resource.a:service
"     exe 'norm 0'
"     exe 'norm v'
"     exe '/func ('
"     exe '?}'
"     exe 'norm y'
"
"     exe 'e $KARIR/qservice/pkg/common/'.a:repo.'/'.a:repo.'.go'
"     exe 'norm gg'
"     exe '/type'
"     exe '/}'
"     exe 'norm O '.s:mixedcase(a:resource.a:service).'Url string'
"     exe '/return'
"     exe '/}'
"     exe 'norm O '.s:mixedcase(a:resource.a:service).'Url: url + "'.a:url.'",'
"     exe 'norm G'
"     exe 'norm o'
"     exe 'norm o'
"     exe 'norm p'
"
"     exe 'e $KARIR/'.a:repo.'/pkg/service/'.s:camelcase(a:service).'/service.'.s:camelcase(a:service).'.go'
"     exe 'norm gg'
"     exe '/) '.a:resource.a:service.'('
"     exe 'norm yaf'
"
"     exe 'e $KARIR/qservice/pkg/common/'.a:repo.'/'.a:repo.'.go'
"     exe 'norm G'
"     exe 'norm o'
"     exe 'norm o'
"     exe 'norm p'
"     exe 'norm dif'
"     exe 'norm gg'
"     exe '/type'
"     exe 'norm w'
"     exe 'norm yiw'
"     exe 'norm G'
"     exe 'norm k'
"     exe 'norm 0'
"     exe 'norm f)'
"     exe 'norm h'
"     exe 'norm viw'
"     exe 'norm p'
"     exe 'norm F('
"     exe 'norm l'
"     exe 'norm s q'
"     exe 'norm $'
"     exe 'norm F('
"     exe 'norm l'
"     exe 'norm vt,'
"     exe 'norm y'
"     exe 'norm o var result '
"     exe 'norm p'
"     exe 'norm o'
"     exe 'norm o action := q.'.s:mixedcase(a:resource.a:service).'Url'
"     exe 'norm o payload, err := json.Marshal(input)'
"     exe 'norm o'
"     exe 'norm o status, response, body, err := helper.HttpRequest("POST", action, payload)'
"     exe 'norm o if err != nil {'
"     exe 'norm o 	return nil, qerror.NewError(err, body)'
"     exe 'norm o }'
"     exe 'norm o'
"     exe 'norm o if status != 200 {'
"     exe 'norm o 	return nil, qerror.NewError(err, body)'
"     exe 'norm o }'
"     exe 'norm o'
"     exe 'norm o marshaledResponse, err := json.Marshal(response.Data)'
"     exe 'norm o if err != nil {'
"     exe 'norm o 	return nil, qerror.NewError(err, response)'
"     exe 'norm o }'
"     exe 'norm o'
"     exe 'norm o err = json.Unmarshal(marshaledResponse, &result)'
"     exe 'norm o if err != nil {'
"     exe 'norm o 	return nil, qerror.NewError(err, marshaledResponse)'
"     exe 'norm o }'
"     exe 'norm o'
"     exe 'norm o return result, nil'
"
"     exe 'w'
" endfunction
" command! -nargs=* CreateProxy call CreateProxy(<f-args>)
"
" function CreateEndpointAPI(repoAPI, repoMS, url, service, resource)
"     exe 'e $KARIR/'.a:repoAPI.'/cmd/app/'.a:repoAPI.'/'.a:repoMS.'/'.a:repoMS.'.go'
"     exe ':norm G'
"     exe ':norm O router.QPOST("'.a:url.'", middleware.KarirAuthorization(handler'.s:mixedcase(a:repoMS).'.'.a:resource.a:service.'Handler'.'))'
"     exe 'w'
" endfunction
" command! -nargs=* CreateEndpointAPI call CreateEndpointAPI(<f-args>)
"
" function CreateHandlerFuncAPI(repoAPI, repoMS, service, resource)
"     exe 'e $KARIR/'.a:repoAPI.'/pkg/handler/'.tolower(s:mixedcase(a:repoMS)).'/handler.'.s:camelcase(a:service).'.go'
"     exe 'norm gg'
"     exe 'norm o import "github.com/karirdotcom/'.a:repoAPI.'/pkg/service/'.tolower(s:mixedcase(a:repoMS)).'"'
"     exe 'norm G'
"     exe 'norm o'
"     exe 'norm o func '.a:resource.a:service.'Handler(writer http.ResponseWriter, request *http.Request, params httprouter.Params) (interface{}, error) {'
"     exe 'norm o		var input '.tolower(s:mixedcase(a:repoMS)).'.'.s:mixedcase(a:resource.a:service).'Input'
"     exe 'norm o '
"     exe 'norm o 	ctx := request.Context()'
"     exe 'norm o 	auth, ok := ctx.Value("auth").(*qredential.CommonTokenPayload)'
"     exe 'norm o '
"     exe 'norm o 	if !ok {'
"     exe 'norm o 		return nil, qerror.NewAuthorizationErrors([]string{constants.ERR_INVALID_ACCESS_TOKEN})'
"     exe 'norm o 	}'
"     exe 'norm o '
"     exe 'norm o		body, err := ioutil.ReadAll(request.Body)'
"     exe 'norm o		if err != nil {'
"     exe 'norm o			return nil, qerror.NewError(err)'
"     exe 'norm o		}'
"     exe 'norm o '
"     exe 'norm o		err = json.Unmarshal(body, &input)'
"     exe 'norm o		if err != nil {'
"     exe 'norm o			return nil, qerror.NewError(err)'
"     exe 'norm o		}'
"     exe 'norm o		'
"     exe 'norm o		validate = validator.New()'
"     exe 'norm o		if err = validate.Struct(input); err != nil {'
"     exe 'norm o			errVal := helper.FormatValidatorArrayResponse(err)'
"     exe 'norm o			return nil, qerror.NewValidationErrors(errVal)'
"     exe 'norm o		}'
"     exe 'norm o '
"     exe 'norm o 	userId := uint64(auth.SourceId)'
"     exe 'norm o '
"     exe 'norm o 	response, err := '.tolower(s:mixedcase(a:repoMS)).'.New'.a:service.'().'.a:resource.a:service.'(userId, input)'
"     exe 'norm o 	if err != nil {'
"     exe 'norm o 		return nil, qerror.NewError(err)'
"     exe 'norm o 	}'
"     exe 'norm o '
"     exe 'norm o 	return response, nil'
"     exe 'norm o }'
"     exe 'w'
" endfunction
" command! -nargs=* CreateHandlerFuncAPI call CreateHandlerFuncAPI(<f-args>)
"
" function CreateServiceFuncAPI(repoAPI, repoMS, service, resource)
"     exe 'e $KARIR/'.a:repoMS.'/pkg/service/'.s:camelcase(a:service).'/service.'.s:camelcase(a:service).'.go'
"     exe 'norm gg'
"     exe '/type '.a:resource.a:service.'Input struct {'
"     exe 'norm 0'
"     exe 'norm v'
"     exe '/func ('
"     exe '?}'
"     exe 'norm y'
"
"     exe 'e $KARIR/'.a:repoAPI.'/pkg/service/'.tolower(s:mixedcase(a:repoMS)).'/service.'.s:camelcase(a:service).'.go'
"     exe 'norm gg'
"     exe 'norm o import karir_ms "github.com/karirdotcom/qservice/pkg/common/'.a:repoMS.'"'
"     exe 'norm G'
"     exe 'norm o'
"     exe 'norm o'
"     exe 'norm p'
"     exe 'norm G'
"     exe 'norm o'
"     exe 'norm o'
"
"     exe 'norm o func (s '.s:mixedcase(a:repoMS).a:service.'Service) '.a:resource.a:service.'(userId uint64, input '.s:mixedcase(a:resource.a:service).'Input) (*'.s:mixedcase(a:resource.a:service).'Output, error) {'
"     exe 'norm o 	resp, err := microservice.Get'.s:mixedcase(a:repoMS).'().'.s:mixedcase(a:resource.a:service).'('.s:snakecase(a:repoMS).'.'.s:mixedcase(a:resource.a:service).'Input{})'
"     exe 'norm o '
"     exe 'norm o 	if err != nil {'
"     exe 'norm o 		return nil, qerror.NewError(err)'
"     exe 'norm o 	}'
"     exe 'norm o '
"     exe 'norm o		var output '.s:mixedcase(a:resource.a:service).'Output'
"     exe 'norm o		copier.Copy(&output, &resp)'
"     exe 'norm o '
"     exe 'norm o		return &output, nil'
"     exe 'norm o }'
"
"     exe 'w'
" endfunction
" command! -nargs=* CreateServiceFuncAPI call CreateServiceFuncAPI(<f-args>)
"
" function CreateAPI(repoAPI, repoMS, url, service, resource)
"     exe 'CreateEndpointAPI '.a:repoAPI.' '.a:repoMS.' '.a:url.' '.a:service.' '.a:resource
"     exe 'CreateServiceFuncAPI '.a:repoAPI.' '.a:repoMS.' '.a:service.' '.a:resource
"     exe 'CreateHandlerFuncAPI '.a:repoAPI.' '.a:repoMS.' '.a:service.' '.a:resource
" endfunction
" command! -nargs=* CreateAPI call CreateAPI(<f-args>)
"
" function InitHandlerAPI(repoAPI, repoMS, service)
"     exe '!touch $KARIR/'.a:repoAPI.'/pkg/handler/'.tolower(s:mixedcase(a:repoMS)).'/handler.'.s:camelcase(a:service).'.go'
"     exe 'e $KARIR/'.a:repoAPI.'/pkg/handler/'.tolower(s:mixedcase(a:repoMS)).'/handler.'.s:camelcase(a:service).'.go'
"     exe 'norm i package '.tolower(s:mixedcase(a:repoMS))
"     exe 'w'
" endfunction
" command! -nargs=* InitHandlerAPI call InitHandlerAPI(<f-args>)
"
" function InitServiceAPI(repoAPI, repoMS, service)
"     exe 'Mkdir! $KARIR/'.a:repoAPI.'/pkg/service/'.tolower(s:mixedcase(a:repoMS))
"     exe '!touch $KARIR/'.a:repoAPI.'/pkg/service/'.tolower(s:mixedcase(a:repoMS)).'/service.'.s:camelcase(a:service).'.go'
"     exe 'e $KARIR/'.a:repoAPI.'/pkg/service/'.tolower(s:mixedcase(a:repoMS)).'/service.'.s:camelcase(a:service).'.go'
"
"     exe 'norm o package '.tolower(s:mixedcase(a:repoMS))
"     exe 'norm o '
"     exe 'norm o import ('
"     exe 'norm o 	"github.com/karirdotcom/karir-api/pkg/common/microservice"'
"     exe 'norm o 	"github.com/karirdotcom/qframework/pkg/common/qerror"'
"     exe 'norm o 	'.s:snakecase(a:repoMS).' "github.com/karirdotcom/qservice/pkg/common/'.a:repoMS.'"'
"     exe 'norm o )'
"     exe 'norm o '
"     exe 'norm o type '.s:mixedcase(a:repoMS).s:mixedcase(a:service).'Service struct {'
"     exe 'norm o }'
"     exe 'norm o '
"     exe 'norm o func New'.s:mixedcase(a:service).'() '.s:mixedcase(a:repoMS).s:mixedcase(a:service).'Service {'
"     exe 'norm o 	return '.s:mixedcase(a:repoMS).s:mixedcase(a:service).'Service{}'
"     exe 'norm o }'
"
"     exe 'w'
" endfunction
" command! -nargs=* InitServiceAPI call InitServiceAPI(<f-args>)
"
" function InitAllAPI(repoAPI, repoMS, service)
"     exe 'InitServiceAPI '.a:repoAPI.' '.a:repoMS.' '.a:service
"     exe 'InitHandlerAPI '.a:repoAPI.' '.a:repoMS.' '.a:service
" endfunction
" command! -nargs=* InitAllAPI call InitAllAPI(<f-args>)
"
" function GetColumns(table_name)
"     let getColumns = "select column_name from information_schema.columns where table_name ='".a:table_name."'"
"     let copyDB = system('pgdevkarir -c "'.getColumns.'"')
"     exe 'e /tmp/'.a:table_name
"     exe 'norm G'
"     exe 'norm o '.copyDB
"     exe '/rows)'
"     let total_column = getline('.')
"     let total_column = substitute(total_column, "(", "", "")
"     let total_column = substitute(total_column, " rows)", "", "")
"     let total_column = str2nr(total_column)
"
"     exe '?column_name'
"     exe 'norm j'
"     let columns = []
"     let c = 1
"     while c <= total_column
"         exe 'norm j'
"         exe 'norm 0'
"         exe 'norm w'
"         exe 'norm d0'
"         let line = getline('.')
"         call add(columns, line)
"         let c += 1
"     endwhile
"     exe 'norm ggvGd'
"     exe 'w'
"     exe 'bd /tmp/'.a:table_name
"     return columns
" endfunction
"
" function CreatePgStruct(repo, service, model, table_name)
"     let getDBInfo = "select column_name, is_nullable, udt_name FROM information_schema.COLUMNS WHERE TABLE_NAME = '".a:table_name."'"
"     let copyDB = system('pgdevkarir -c "'.getDBInfo.'"')
"
"     exe 'e $KARIR/'.a:repo.'/pkg/service/'.s:camelcase(a:service).'/data/interface.'.s:camelcase(a:model).'.go'
"     exe 'norm G'
"     exe '?type'
"     exe 'norm O'
"     exe 'norm i '.copyDB
"     exe 'norm G'
"     exe '?column_name'
"     exe 'norm cc type '.s:mixedcase(a:model).' struct {'
"     exe 'norm j'
"     exe 'norm dd'
"     exe '/rows)'
"     let total_column = getline('.')
"     let total_column = substitute(total_column, "(", "", "")
"     let total_column = substitute(total_column, " rows)", "", "")
"     let total_column = str2nr(total_column)
"     exe 'norm cc }'
"
"     let c = 1
"     let from_line = line('.') - total_column
"     let to_line = from_line + total_column - 1
"     while c <= total_column
"         exe 'norm k'
"         exe 'norm 0'
"         exe 'norm w'
"         exe 'norm d0'
"         exe 'norm crm'
"         let c += 1
"     endwhile
"
"     exe from_line.','.to_line.'PgToStruct'
"
"     exe 'w'
" endfunction
" command! -nargs=* CreatePgStruct call CreatePgStruct(<f-args>)
