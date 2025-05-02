" hook_add {{{
nmap <C-j> i<Plug>(skkeleton-toggle)
imap <C-j> <Plug>(skkeleton-toggle)
cmap <C-j> <Plug>(skkeleton-toggle)
" }}}
" hook_post_source {{{
" let g:skkeleton#debug = v:true
call skkeleton#azik#register()
call skkeleton#config({
  \ 'kanaTable': 'azik',
  \ 'eggLikeNewline': v:true,
  \ 'registerConvertResult': v:true,
  \ 'sources': ["deno_kv"],
  \ 'globalDictionaries': [["~/.cache/dein/repos/github.com/skk-dev/dict/SKK-JISYO.L", "euc-jp"],["~/.cache/dein/repos/github.com/tokuhirom/jawiki-kana-kanji-dict/SKK-JISYO.jawiki", "UTF-8"]],
  \ 'databasePath': expand("~/.cache/skkeleton.sqlite3"),
  \ 'markerHenkan': '',
  \ 'markerHenkanSelect': '',
  \ 'lowercaseMap': {'+': ';'},
  \ })
call skkeleton#register_kanatable('azik', {
  \   " ": "henkanFirst",
  \   "^": "henkanPoint",
  \   "@": "katakana",
  \   "<s-l>": "zenkaku",
  \   "/": "abbrev",
  \   "l": "disable",
  \ })
call skkeleton#register_kanatable('azik', {
  \   "dr": ["である", ""],
  \   "ji": ["じ", ""],
  \   "jk": ["じん", ""],
  \   "vn": ["あん", ""],
  \   "k;": ["こい", ""],
  \   "s;": ["そい", ""],
  \   "t;": ["とい", ""],
  \   "n;": ["のい", ""],
  \   "h;": ["ほい", ""],
  \   "m;": ["もい", ""],
  \   "y;": ["よい", ""],
  \   "r;": ["ろい", ""],
  \   "g;": ["ごい", ""],
  \   "z;": ["ぞい", ""],
  \   "d;": ["どい", ""],
  \   "b;": ["ぼい", ""],
  \   "p;": ["ぽい", ""],
  \   "ky;": ["きょい", ""],
  \   "kg;": ["きょい", ""],
  \   "sy;": ["しょい", ""],
  \   "x;": ["しょい", ""],
  \   "ty;": ["ちょい", ""],
  \   "c;": ["ちょい", ""],
  \   "ny;": ["にょい", ""],
  \   "ng;": ["にょい", ""],
  \   "hy;": ["ひょい", ""],
  \   "hg;": ["ひょい", ""],
  \   "my;": ["みょい", ""],
  \   "mg;": ["みょい", ""],
  \   "ry;": ["りょい", ""],
  \   "gy;": ["ぎょい", ""],
  \   "zy;": ["じょい", ""],
  \   "j;": ["じょい", ""],
  \   "by;": ["びょい", ""],
  \   "py;": ["ぴょい", ""],
  \   "pg;": ["ぴょい", ""],
  \   "xxa": ["ぁ", ""],
  \   "xxya": ["ゃ", ""],
  \   "xxi": ["ぃ", ""],
  \   "xxu": ["ぅ", ""],
  \   "xxyu": ["ゅ", ""],
  \   "xxe": ["ぇ", ""],
  \   "xxo": ["ぉ", ""],
  \   "xxyo": ["ょ", ""],
  \   "z,": ["‥", ""],
  \   "z.": ["…", ""],
  \   "vh": ["←", ""],
  \   "vk": ["↑", ""],
  \   "vl": ["→", ""],
  \   "vj": ["↓", ""],
  \   ",": ["、", ""],
  \   ".": ["。", ""],
  \   "[": ["「", ""],
  \   "]": ["」", ""],
  \   "z[": ["『", ""],
  \   "z]": ["』", ""],
  \   "z~": ["〜", ""],
  \   "z\<Space>": ["　", ""],
  \ })

" ---https://zenn.dev/vim_jp/articles/my-azik-is-burning---
augroup Skkeleton
  autocmd!
  let s:azikOkuriList = [
    \   ['Q', 'aI'],
    \   ['Z', 'aNn'],
    \   ['K', 'iNn'],
    \   ['H', 'uU'],
    \   ['J', 'uNn'],
    \   ['W', 'eI'],
    \   ['D', 'eNn'],
    \   ['P', 'oU'],
    \   ['L', 'oNn'],
    \   ['+', 'oI']
    \ ]

  function s:mapAzikOkuri(input, feed) abort
    for mode in ['i', 'c']
      exec 'autocmd User skkeleton-enable-post ' .. mode .. 'map <buffer> ' ..
        \   a:input .. " <Cmd>call <SID>azikOkuri('" .. a:input .. "', '" ..
        \   a:feed .. "')<CR>"
      exec 'autocmd User skkeleton-disable-post silent! ' .. mode ..
        \   'unmap <buffer> ' .. a:input
    endfor
  endfunction

  function s:azikOkuri(input, feed) abort
    if g:skkeleton#state.phase ==# 'input:okurinasi' && g:skkeleton#mode !=# 'abbrev'
      \   && g:skkeleton#vim_status().prevInput =~# '\a$'
      call skkeleton#handle('handleKey', {'key': split(a:feed, '\zs')})
    else
      call skkeleton#handle('handleKey', {'key': a:input})
    endif
  endfunction

  for item in s:azikOkuriList
    call s:mapAzikOkuri(item[0], item[1])
  endfor
augroup END
" ---------------------------------------------------------

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

autocmd User skkeleton-enable-post imap <c-@> <c-q>
autocmd User skkeleton-disable-post iunmap <c-@>
" }}}
