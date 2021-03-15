" Startify
let g:startify_bookmarks=[
	\ '~/.zshrc',
	\ '$MYVIMRC',
	\ '~/go/src/github.com/flynd-dev/bmi/docker-compose.yml'
	\ ]

let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'files',     'header': ['   Recent Files']   },
          \ { 'type': 'dir',       'header': ['   Recent Files in: '. getcwd()] },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]


let s:header = [
			\'         ##           #                                                                                   ',
			\'       ######         ###                                                                                 ',
			\'     #########       #####                                                                               ',
			\'    ############      ######                                                         ###                    ',
			\'    #############     ######       ########    ########     ########   ####      ### ### #################  ',
			\'    ##############    ######      ##      ##  ##       #  ##        ##  ###     ###  ### ###    ###    ###  ',
			\'    ######  ########  ######      ##      ##  ##########  ##        ##   ###   ###   ### ###    ###    ###  ',
			\'    ######    ##############      ##      ##  ##          ##        ##    ##   ##    ### ###    ###    ###  ',
			\'    ######     #############      ##      ##   ##     #    ##      ##      ## ##     ### ###    ###    ###  ',
			\'    ######      ############      ##      ##     #####       ######         ###      ### ###    ###    ###  ',
			\'     #####        #########                                                                               ',
			\'       ###         ######                                                                                 ',
			\'         #           ##                                                                                   ']

function! s:center(lines) abort
  let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
  let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction

let g:startify_custom_header = s:center(s:header)

 
