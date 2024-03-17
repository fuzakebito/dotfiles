" hook_add {{{
nnoremap <space>j <cmd>FuzzyMotion<cr>
" }}}
" hook_source {{{
let g:fuzzy_motion_auto_jump = v:true
let g:fuzzy_motion_matchers = ['fzf','kensaku']
" }}}
