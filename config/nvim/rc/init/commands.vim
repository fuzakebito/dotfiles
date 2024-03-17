command! -range C echo <range> ? strcharlen(join(getline(<line1>, <line2>), "\n")) : strcharlen(getline("."))
