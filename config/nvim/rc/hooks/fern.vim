" hook_add {{{
nnoremap <silent> <space>e :<C-u>Fern . -drawer -reveal=% -toggle<CR>
" }}}
" hook_source {{{
let g:fern#default_hidden=1
let g:fern#window_selector_use_popup=1
autocmd FileType fern set nonu
function! s:fern_highlight() abort
  highlight! link FernRootSymbol   Comment
  highlight! link FernRootText     Comment
  highlight! link FernLeafSymbol   Grey
  highlight! link FernLeafText     None
  highlight! link FernBranchSymbol Grey
  highlight! link FernBranchText   Directory
  highlight! link FernMarkedLine   None
  highlight! link FernMarkedText   Purple
endfunction
autocmd FileType fern call s:fern_highlight()
" }}}
