" hook_source {{{
function! s:ScrollViewTimer() abort
  if !exists('b:scrollview_disable_timer')
    let b:scrollview_disable_timer = -1
  endif
  if timer_info(b:scrollview_disable_timer) == []
    ScrollViewEnable
  else
    call timer_stop(b:scrollview_disable_timer)
  endif
  let b:scrollview_disable_timer = timer_start(800, { -> execute("ScrollViewDisable") })
endfunction

autocmd WinScrolled * call s:ScrollViewTimer()
" }}}
