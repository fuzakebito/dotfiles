" hook_add {{{
let g:deol_lmargin = float2nr(&lines*0.05+0.5)
let g:deol_cmargin = float2nr(&columns*0.05+0.5)
nnoremap <c-]> <Cmd>call deol#start(#{
\ toggle: v:true,
\ split: 'floating',
\ winheight: &lines - 2*g:deol_lmargin-2-exists('$TMUX'),
\ winwidth: &columns - 2*g:deol_cmargin-2,
\ winrow: g:deol_lmargin,
\ wincol: g:deol_cmargin,
\ prompt_pattern: '❯ ',
\ floating_border: 'rounded',
\ })<CR>
tnoremap <C-]> <C-\><C-n>
" }}}
" deol {{{
set nu
set winblend=0
" }}}
