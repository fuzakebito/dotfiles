" hook_add {{{
nnoremap <space>gs <Cmd>GinStatus<CR>
nnoremap <space>gl <Cmd>GinLog<CR>
" }}}
" gin-diff {{{
nmap <buffer><nowait> s <Cmd>GinStatus<CR>
" }}}
" gin-status {{{
nmap <buffer><nowait> c <Cmd>Gin commit -v<CR>
" }}}
" gin-log {{{
nmap <buffer><nowait> p <Cmd>Gin push<CR>
" }}}
