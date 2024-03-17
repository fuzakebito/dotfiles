filetype off
syntax off
autocmd BufReadPre,BufNew * ++once filetype plugin indent on
autocmd BufReadPre,BufNew * ++once syntax enable
