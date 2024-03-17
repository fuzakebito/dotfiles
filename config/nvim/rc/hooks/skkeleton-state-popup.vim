" hook_source {{{
call skkeleton_state_popup#config(#{
  \   labels: {
  \     'input': #{hira: "あ", kata: 'ア', hankata: 'ｱ', zenkaku: 'Ａ'},
  \     'input:okurinasi': #{hira: '変換', kata: '変換', hankata: '変換', abbrev: 'ab'},
  \     'input:okuriari': #{hira: '送り', kata: '送り', hankata: '送り'},
  \     'henkan': #{hira: '候補選択', kata: '候補選択', hankata: '候補選択', abbrev: 'ab'},
  \     'latin': '_A',
  \   },
  \   opts: #{relative: 'cursor', col: 0, row: 1, anchor: 'NW', style: 'minimal'},
  \   popupTimeMs: 800,
  \ })
call skkeleton_state_popup#run()
let s:skk_sp_pum_visible_prev = v:false
function! s:skkeleton_state_popup_avoid_pum() abort
  if pum#visible() == s:skk_sp_pum_visible_prev
    return
  else
    let s:skk_sp_pum_visible_prev = pum#visible()
    if pum#visible()
      call skkeleton_state_popup#config(#{
        \   opts: #{relative: 'cursor', col: 1, row: 0, anchor: 'NW', style: 'minimal'},
        \ })
    else
      call skkeleton_state_popup#config(#{
        \   opts: #{relative: 'cursor', col: 0, row: 1, anchor: 'NW', style: 'minimal'},
        \ })
    endif
  endif
endfunction
autocmd InsertEnter,CursorMovedI * call s:skkeleton_state_popup_avoid_pum()
" }}}
