" hook_source {{{
let g:codeium_disable_bindings = 1
let g:codeium_manual = v:true
let g:codeium_render = v:false

let g:codeium_filetypes = #{
  \   gitcommit: v:true,
  \   markdown: v:true,
  \   text: v:true,
  \   yaml: v:true,
  \   ddu-ff-filter: v:false,
  \ }
" }}}
" hook_post_source {{{
call CodeiumEnable()
" }}}
