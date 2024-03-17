" hook_add {{{
nmap <C-j> i<Plug>(skkeleton-toggle)
imap <C-j> <Plug>(skkeleton-toggle)
cmap <C-j> <Plug>(skkeleton-toggle)
" }}}
" hook_post_source {{{
" let g:skkeleton#debug = v:true
call skkeleton#config({
  \ 'eggLikeNewline': v:true,
  \ 'registerConvertResult': v:true,
  \ 'sources': ["deno_kv"],
  \ 'globalDictionaries': [["~/.cache/dein/repos/github.com/skk-dev/dict/SKK-JISYO.L", "euc-jp"],["~/.cache/dein/repos/github.com/tokuhirom/jawiki-kana-kanji-dict/SKK-JISYO.jawiki", "UTF-8"]],
  \ 'databasePath': expand("~/.cache/skkeleton.sqlite3"),
  \ 'markerHenkan': '',
  \ 'markerHenkanSelect': '',
  \ })
call skkeleton#register_kanatable('rom', {
  \ 'dr': ['である', ''],
  \ '~': ['〜', ''],
  \ "z\<Space>": ["\u3000", ''],
  \ })

" skkeleton_pre
autocmd User skkeleton-enable-pre call s:skkeleton_pre()
function! s:skkeleton_pre() abort
  " Overwrite sources
  let s:prev_buffer_config = ddc#custom#get_buffer()
  call ddc#custom#patch_buffer('sources', ['skkeleton'])
endfunction

" skkeleton_post
autocmd User skkeleton-disable-pre call s:skkeleton_post()
function! s:skkeleton_post() abort
  " Restore sources
  call ddc#custom#set_buffer(s:prev_buffer_config)
endfunction
" }}}
