" Author: zhyu <angellwings@gmail.com>
" Description: List available tasks in current project.

let s:tasks = {}

function! s:tasks.source()
  let rows = asynctasks#source(&columns * 45 / 100)
  let source = []
  for row in rows
    let source += [row[0] . ' ' . row[1] . '  ' . row[2]]
  endfor
  return source
endfunction

function! s:tasks.sink(line)
  let pos = stridx(a:line, '<')
	if pos >= 0
    let name = strpart(a:line, 0, pos)
    let name = substitute(name, '^\s*\(.\{-}\)\s*$', '\1', '')
    if name != ''
      exec "AsyncTask ". name
    endif
	endif
endfunction

let g:clap#provider#tasks# = s:tasks
