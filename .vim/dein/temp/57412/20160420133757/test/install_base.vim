" set verbose=1

let s:suite = themis#suite('install')
let s:assert = themis#helper('assert')

function! s:suite.rm() abort "{{{
  let temp = tempname()
  call writefile([], temp)

  call dein#install#_rm(temp)

  call s:assert.equals(filereadable(temp), 0)
endfunction"}}}

function! s:suite.copy_directories() abort "{{{
  let temp = tempname()
  let temp2 = tempname()
  let temp3 = tempname()

  call mkdir(temp)
  call mkdir(temp2)
  call mkdir(temp3)
  call writefile([], temp.'/foo')
  call writefile([], temp3.'/bar')

  call dein#install#_copy_directories([temp, temp3], temp2)

  call s:assert.true(isdirectory(temp2))
  echomsg string(system('ls -R ' . temp2))
  call s:assert.true(filereadable(temp2.'/foo'))
  call s:assert.true(filereadable(temp2.'/bar'))
endfunction"}}}

" vim:foldmethod=marker:fen:
