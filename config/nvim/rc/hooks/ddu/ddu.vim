" hook_add {{{
"nnoremap <expr> <Space>ff
"      \ vimrc#is_git_worktree() ?
"      \ "<Cmd>Ddu -name=files file_git
"      \ -ui-param-ff-startFilter
"      \ -ui-param-ff-startAutoAction
"      \ -source-option-file-path=`t:->get('ddu_ui_filer_path', getcwd())`
"      \ <CR>" :
"      \ "<Cmd>Ddu -name=files file_rec
"      \ -ui-param-ff-startFilter
"      \ -ui-param-ff-startAutoAction
"      \ -source-option-file-path=`t:->get('ddu_ui_filer_path', getcwd())`
"      \ <CR>"
nnoremap <Space>ff
      \ <Cmd>Ddu -name=files-`tabpagenr()`
      \ `vimrc#is_git_worktree() ? 'file_git' : 'file_rec'`
      \ -resume
      \ -expandInput
      \ -ui-param-ff-startFilter
      \ -ui-param-ff-startAutoAction
      \ <CR>
"nnoremap sr
"      \ <Cmd>Ddu -name=files -resume<CR>
nnoremap <Space>fh <Cmd>Ddu
      \ -name=help help
      \ -sync
      \ -ui-param-ff-startFilter
      \ -ui-param-ff-startAutoAction
      \ <CR>
nnoremap <Space>fg <Cmd>Ddu
      \ -name=search rg -resume=v:false
      \ -ui-param-ff-ignoreEmpty
      \ -source-param-rg-input='`'Pattern: '->input('<cword>'->expand())`'
      \ -source-option-rg-path='`'Directory: '->input($'{getcwd()}/', 'dir')`'
      \ -ui-param-ff-startAutoAction
      \ <CR>
xnoremap <Space>fg y<Cmd>Ddu
      \ -name=search rg -resume=v:false
      \ -ui-param-ff-ignoreEmpty
      \ -source-param-rg-input='`'Pattern: '->input(v:register->getreg())`'
      \ -source-option-rg-path='`'Directory: '->input($'{getcwd()}/', 'dir')`'
      \ <CR>
nnoremap <Space>fr <Cmd>Ddu
      \ -name=register register
      \ -source-option-register-defaultAction=
      \`'.'->col() == 1 ? 'insert' : 'append'`
      \ -ui-param-ff-autoResize
      \ <CR>
nnoremap <Space>fm <Cmd>Ddu
      \ -name=outline markdown
      \ -ui-param-ff-ignoreEmpty
      \ -ui-param-ff-displayTree
      \ <CR>
xnoremap <expr> <Space>fr
      \ (mode() ==# 'V' ? '"_R<Esc>' : '"_d')
      \ .. '<Cmd>Ddu -name=register register
      \ -source-option-ff-defaultAction=insert
      \ -ui-param-autoResize<CR>'
nnoremap <Space>fd <Cmd>Ddu dein<CR>
nnoremap <C-o> <Cmd>Ddu jumplist <CR>

" Initialize ddu.vim lazily.
call ddu#load('ui', ['ff', 'filer'])
call ddu#load('source', [
\ 'file', 'file_point', 'file_old', 'file_git',
\ ])
call ddu#load('filter', [
\ 'matcher_kensaku', 'matcher_relative', 'matcher_substring',
\ 'matcher_ignore_current_buffer', 'matcher_hidden',
\ 'sorter_alpha',
\ 'column-icon_filename'
\ ])
call ddu#load('kind', ['file'])
call ddu#custom#load_config(expand('$HOOKS_DIR/ddu/ddu.ts'))
" }}}

" hook_post_update {{{
call ddu#set_static_import_path()
" }}}
