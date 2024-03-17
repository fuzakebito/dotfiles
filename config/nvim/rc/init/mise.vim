if execute('mise')
  call vimrc#mise#hook_env()
  autocmd DirChanged * call vimrc#mise#hook_env()
endif
