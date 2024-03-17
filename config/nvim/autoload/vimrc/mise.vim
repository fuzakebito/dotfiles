function! vimrc#mise#hook_env() abort
  let mise_env = substitute(system('mise hook-env -s bash'), '^export ', 'let $', '')
  echomsg mise_env
endfunction
