"" nerdtree
let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeHijackNetrw = 0

"" nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to checkall selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

let g:ranger_replace_netrw = 1
let g:ranger_open_new_tab = 0

let g:coc_global_extenstion = ['coc-snippets']
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

let g:solarized_visibility="low"
let g:solarized_termtrans=1
let g:solarized_statusline="low"

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline_powerline_fonts = 1
"let g:airline_theme='luna'
"let g:airline_solarized_bg='dark'
let g:go_addtags_transform = "snakecase"
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
let g:go_decls_includes = "func,type"
let g:go_def_mapping_enabled = 0
let g:go_def_mode = "gopls"
let g:go_echo_command_info = 1
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_info_mode = "gopls"
let g:go_list_type = "quickfix"
" let g:go_metalinter_autosave = 1
" let g:go_metalinter_autosave_enabled = ['vet', 'golint']
" let g:go_metalinter_command = ""
" let g:go_metalinter_deadline = "5s"
" let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_template_autocreate = 0
let g:go_test_show_name = 1
let g:go_textobj_include_function_doc = 0
let g:rehash256 = 1

let g:python_host_prog='/usr/local/bin/python'
let g:python3_host_prog='/usr/bin/python3'

" let g:phpfmt_standard = 'PSR2'

