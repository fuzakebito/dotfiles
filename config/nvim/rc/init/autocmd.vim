autocmd FocusGained * call system('fcitx5-remote -c &')
autocmd FocusLost,VimLeave * call system('fcitx5-remote -o &')

autocmd TermOpen * call vimrc#termmap()
