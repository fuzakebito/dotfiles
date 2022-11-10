autocmd TermOpen * startinsert

" term mode window controll {{{
tnoremap <C-W>n       <cmd>new<cr>
tnoremap <C-W><C-N>   <cmd>new<cr>
tnoremap <C-W>q       <cmd>quit<cr>
tnoremap <C-W><C-Q>   <cmd>quit<cr>
tnoremap <C-W>c       <cmd>close<cr>
tnoremap <C-W>o       <cmd>only<cr>
tnoremap <C-W><C-O>   <cmd>only<cr>
tnoremap <C-W><Down>  <cmd>wincmd j<cr>
tnoremap <C-W><C-J>   <cmd>wincmd j<cr>
tnoremap <C-W>j       <cmd>wincmd j<cr>
tnoremap <C-W><Up>    <cmd>wincmd k<cr>
tnoremap <C-W><C-K>   <cmd>wincmd k<cr>
tnoremap <C-W>k       <cmd>wincmd k<cr>
tnoremap <C-W><Left>  <cmd>wincmd h<cr>
tnoremap <C-W><C-H>   <cmd>wincmd h<cr>
tnoremap <C-W><BS>    <cmd>wincmd h<cr>
tnoremap <C-W>h       <cmd>wincmd h<cr>
tnoremap <C-W><Right> <cmd>wincmd l<cr>
tnoremap <C-W><C-L>   <cmd>wincmd l<cr>
tnoremap <C-W>l       <cmd>wincmd l<cr>
tnoremap <C-W>w       <cmd>wincmd w<cr>
tnoremap <C-W><C-W>   <cmd>wincmd w<cr>
tnoremap <C-W>W       <cmd>wincmd W<cr>
tnoremap <C-W>t       <cmd>wincmd t<cr>
tnoremap <C-W><C-T>   <cmd>wincmd t<cr>
tnoremap <C-W>b       <cmd>wincmd b<cr>
tnoremap <C-W><C-B>   <cmd>wincmd b<cr>
tnoremap <C-W>p       <cmd>wincmd p<cr>
tnoremap <C-W><C-P>   <cmd>wincmd p<cr>
tnoremap <C-W>P       <cmd>wincmd P<cr>
tnoremap <C-W>r       <cmd>wincmd r<cr>
tnoremap <C-W><C-R>   <cmd>wincmd r<cr>
tnoremap <C-W>R       <cmd>wincmd R<cr>
tnoremap <C-W>x       <cmd>wincmd x<cr>
tnoremap <C-W><C-X>   <cmd>wincmd x<cr>
tnoremap <C-W>K       <cmd>wincmd K<cr>
tnoremap <C-W>J       <cmd>wincmd J<cr>
tnoremap <C-W>H       <cmd>wincmd H<cr>
tnoremap <C-W>L       <cmd>wincmd L<cr>
tnoremap <C-W>T       <cmd>wincmd T<cr>
tnoremap <C-W>=       <cmd>wincmd =<cr>
tnoremap <C-W>-       <cmd>wincmd -<cr>
tnoremap <C-W>+       <cmd>wincmd +<cr>
tnoremap <C-W>z       <cmd>pclose<cr>
tnoremap <C-W><C-Z>   <cmd>pclose<cr>
" }}}

" term mode auto restore {{{
function s:save_terminal_mode()
  let b:term_mode = mode()
endfunction

function s:restore_terminal_mode()
  if get(b:, 'term_mode', '') ==# 't'
    startinsert
  endif
endfunction

augroup restore_terminal_mode
  autocmd!
  autocmd TermEnter '__terminal__' call s:save_terminal_mode()
  autocmd TermLeave '__terminal__' call s:save_terminal_mode()
  autocmd BufEnter '__terminal__' call s:restore_terminal_mode()
augroup END
" }}}

let s:termname = '__terminal__'
function! s:open() abort
  if bufexists(s:termname)
    if has('nvim')
      botright split | resize 20
    else
      botright split
    endif
    call execute('buffer ' .. s:termname)
    startinsert
  else
    if has('nvim')
      botright split | resize 20 | terminal
    else
      botright terminal
    endif
    startinsert
    call execute('file ' .. s:termname)
    setl nobuflisted
  endif
endfunction
function! s:close(pane) abort
  call execute(a:pane . 'wincmd c')
endfunction
function! s:toggle() abort
  let pane = bufwinnr(s:termname)
  if pane > -1
    call s:close(pane)
  else
    call s:open()
  endif
endfunction

call s:toggle()
command! -nargs=0 TerminalToggle call s:toggle()
nnoremap <silent> <C-w>t :<C-u>TerminalToggle<CR>

" vim: fdm=marker
