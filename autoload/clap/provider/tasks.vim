" Author: zhyu <angellwings@gmail.com>
" Description: List available tasks in current project.

let s:tasks = {}

function! s:tasks.source()
  let tasks = asynctasks#list('')
  let max_name_len = max(map(copy(tasks), {_idx, task -> len(task.name)}))

  return map(tasks, {idx, task ->
        \ s:left_pad(printf('<%s> ', task.scope), 10)
        \ . s:right_pad(task.name, max_name_len + 10)
        \ . ' : ' . task.command})
endfunction

function! s:tasks.sink(line)
  let name = substitute(a:line, '^\s*<\w\+>\s\+\(.\{-}\)\s\+:\s\+.\+$', '\1', '')
  if name != ''
    exec "AsyncTask ". name
  endif
endfunction

function! s:right_pad(s, n) abort
  return a:s . repeat(' ', a:n - len(a:s))
endfunction

function! s:left_pad(s, n) abort
  return repeat(' ', a:n - len(a:s)) . a:s
endfunction

let s:tasks.syntax = 'clap_tasks'

let g:clap#provider#tasks# = s:tasks
