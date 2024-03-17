if exists('$ime')
  set winblend=0
  set clipboard=unnamedplus

  let groups = [ 'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier', 'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function', 'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText', 'SignColumn', 'CursorLine', 'EndOfBuffer', 'NormalFloat', 'Pmenu', 'StatusLine', 'StatusLineTerm', 'StatusLineNC', 'StatusLineTermNC']
  for g in groups
    execute 'highlight' g 'guibg=NONE'
  endfor
endif
