" jk
nnoremap gj gj<Plug>(gjk)
nnoremap gk gk<Plug>(gjk)
nnoremap <Plug>(gjk)j gj<Plug>(gjk)
nnoremap <Plug>(gjk)k gk<Plug>(gjk)

" HL
nnoremap H ^<Plug>(H)
nnoremap L $<Plug>(L)
nnoremap <Plug>(H)H H^
nnoremap <Plug>(L)L L^
function! HL_bisect(mode) abort
  if a:mode == 'start'
    let g:hl_bisect = #{top: line('w0'), bot: line('w$'), mid: float2nr((line('w0')+line('w$'))/2)}
  else
    if a:mode == 'up'
      let g:hl_bisect.bot = g:hl_bisect.mid
    elseif a:mode == 'down'
      let g:hl_bisect.top = g:hl_bisect.mid
    endif
    let g:hl_bisect.mid = float2nr((g:hl_bisect.top + g:hl_bisect.bot)/2)
  endif
  execute 'normal! ' . g:hl_bisect.mid . 'G^'
endfunction
nnoremap <Plug>(L)H <Cmd>call HL_bisect('start')<CR><Plug>(hl_bisect)
nnoremap <Plug>(H)L <Cmd>call HL_bisect('start')<CR><Plug>(hl_bisect)
nnoremap <Plug>(hl_bisect)H <Cmd>call HL_bisect('up')<CR><Plug>(hl_bisect)
nnoremap <Plug>(hl_bisect)L <Cmd>call HL_bisect('down')<CR><Plug>(hl_bisect)
nnoremap <Plug>(H) <Nop>
nnoremap <Plug>(L) <Nop>
nnoremap <Plug>(hl_bisect) <Nop>

" Continuous macro execution
nnoremap @@ @@<Plug>(atmark)
nnoremap <Plug>(atmark)@ @@<Plug>(atmark)

" Cursor keys do not start undo block
inoremap <Left> <C-G>U<Left>
inoremap <Right> <C-G>U<Right>

" Scroll
" nnoremap <C-d> 3<C-e>
" nnoremap <C-u> 3<C-y>
" nnoremap <C-e> <C-d>
" nnoremap <C-y> <C-u>
nnoremap <c-e> <c-e>gj
nnoremap <c-y> <c-y>gk

" Disable CTRL-Z
nnoremap <C-Z> <NOP>
vnoremap <C-Z> <NOP>
onoremap <C-Z> <NOP>

" Tag jump on help filetype
autocmd FileType help nnoremap <buffer> <CR> <C-]>
