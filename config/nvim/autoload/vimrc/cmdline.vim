function vimrc#cmdline#enable(dict, prompt='') abort
  call cmdline#set_option(a:dict)
  let cmdline = cmdline#_get()
  let cmdline.prompt = a:prompt
  call cmdline#enable()
endfunction

function vimrc#cmdline#input(dict, prompt='', text='', completion='custom,cmdline#_dummy') abort
  call cmdline#set_option(a:dict)
  call cmdline#input(a:prompt, a:text, a:completion)
endfunction
