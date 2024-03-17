" hook_source {{{
function! s:fern_settings() abort
nnoremap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
nnoremap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
nnoremap <silent><expr><buffer> <C-d> fern_preview#is_win_visible() ? '<Plug>(fern-action-preview:scroll:down:half)' : "<cmd> lua require('neoscroll').scroll(vim.wo.scroll, true, 350)<CR>"
nnoremap <silent><expr><buffer> <C-u> fern_preview#is_win_visible() ? '<Plug>(fern-action-preview:scroll:up:half)' : "<cmd> lua require('neoscroll').scroll(-vim.wo.scroll, true, 350)<CR>"
endfunction

augroup fern-settings
  autocmd!
  autocmd FileType fern call s:fern_settings()
augroup END
" }}}
