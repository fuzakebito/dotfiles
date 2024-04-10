if exists('$ime')
  set winblend=0
  set clipboard=unnamedplus

  let groups = [ 'Normal', 'CursorLine', 'NormalFloat', 'Pmenu', 'StatusLine', 'StatusLineTerm', 'StatusLineNC', 'StatusLineTermNC']
  for g in groups
    execute 'highlight' g 'guibg=NONE'
  endfor
endif
