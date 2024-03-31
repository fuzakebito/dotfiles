try
  set cmdheight=0

  " For recording messages
  augroup autoCmdHeight
    autocmd!
    autocmd autoCmdHeight CmdlineEnter,RecordingEnter * set cmdheight=1
    autocmd autoCmdHeight CmdlineLeave,RecordingLeave * set cmdheight=0
  augroup END
catch
  set cmdheight=1
endtry

autocmd FocusGained * call system('fcitx5-remote -c &')
autocmd FocusLost,VimLeave * call system('fcitx5-remote -o &')

autocmd TermOpen * call vimrc#termmap()
