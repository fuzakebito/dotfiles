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
" hook_source {{{
let g:terminal_color_0  = '#2b2b2b'
let g:terminal_color_1  = '#ef3f5f'
let g:terminal_color_2  = '#51b57d'
let g:terminal_color_3  = '#d5a261'
let g:terminal_color_4  = '#759ee2'
let g:terminal_color_5  = '#ad88ce'
let g:terminal_color_6  = '#2db3bb'
let g:terminal_color_7  = '#d4d4d4'
let g:terminal_color_8  = '#383838'
let g:terminal_color_9  = '#fd5970'
let g:terminal_color_10 = '#6bc38f'
let g:terminal_color_11 = '#e0b37a'
let g:terminal_color_12 = '#89aeeb'
let g:terminal_color_13 = '#bb9ad9'
let g:terminal_color_14 = '#57c1c8'
let g:terminal_color_15 = '#e6e6e6'
" }}}
" deol {{{
set nu
set winblend=0
" }}}
