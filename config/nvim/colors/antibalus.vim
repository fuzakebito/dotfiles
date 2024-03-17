if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

if !(exists('g:colors_name') && g:colors_name ==# 'antibalus')
  hi clear
  if exists('syntax_on')
    syntax reset
  endif
endif

let g:colors_name = 'antibalus'

let s:palette = {
  \ 'bg': ['#202020', '235'],
  \ 'g0': ['#282828', '237'],
  \ 'g1': ['#2f2f2f', '238'],
  \ 'g2': ['#373737', '240'],
  \ 'g25': ['#606060', '239'],
  \ 'g3': ['#808080', '246'],
  \ 'g4': ['#cfcfcf', '247'],
  \ 'g5': ['#d7d7d7', '249'],
  \ 'g6': ['#dedede', '250'],
  \ 'g7': ['#e6e6e6', '252'],
  \ 'r': ['#ef3f5f', '167'],
  \ 'g': ['#62b283', '72'],
  \ 'y': ['#d19a61', '173'],
  \ 'b': ['#759ee2', '110'],
  \ 'm': ['#ad88ce', '140'],
  \ 'c': ['#2db3bb', '73'],
  \ 'lr': ['#fd5970', '203'],
  \ 'lg': ['#7ac095', '78'],
  \ 'ly': ['#dcab7a', '180'],
  \ 'lb': ['#89aeeb', '122'],
  \ 'lm': ['#bb9ad9', '146'],
  \ 'lc': ['#57c1c8', '79'],
  \ 'none': ['NONE', 'NONE']
  \ }

function! s:hi(group, fg, bg, ...)
  execute 'highlight' a:group
    \ 'guifg=' . a:fg[0]
    \ 'guibg=' . a:bg[0]
    \ 'ctermfg=' . a:fg[1]
    \ 'ctermbg=' . a:bg[1]
    \ 'gui=' . (a:0 >= 1 ?
      \ a:1 :
      \ 'NONE')
    \ 'cterm=' . (a:0 >= 1 ?
      \ (a:1 ==# 'undercurl' ?
        \ 'underline' :
        \ a:1) :
      \ 'NONE')
    \ 'guisp=' . (a:0 >= 2 ?
      \ a:2[0] :
      \ 'NONE')
endfunction

call s:hi('Normal', s:palette.g4, s:palette.bg)
call s:hi('Terminal', s:palette.g4, s:palette.bg)
call s:hi('EndOfBuffer', s:palette.bg, s:palette.bg)
call s:hi('Folded', s:palette.g3, s:palette.g1)
call s:hi('ToolbarLine', s:palette.g5, s:palette.g2)
call s:hi('SignColumn', s:palette.g4, s:palette.none)
call s:hi('FoldColumn', s:palette.g5, s:palette.g2)
call s:hi('IncSearch', s:palette.bg, s:palette.m)
call s:hi('Search', s:palette.bg, s:palette.c)
call s:hi('ColorColumn', s:palette.none, s:palette.g1)
call s:hi('Conceal', s:palette.g2, s:palette.none)
call s:hi('Cursor', s:palette.none, s:palette.none, 'reverse')
highlight! link vCursor Cursor
highlight! link iCursor Cursor
highlight! link lCursor Cursor
highlight! link CursorIM Cursor
call s:hi('CursorLine', s:palette.none, s:palette.g0)
call s:hi('CursorColumn', s:palette.none, s:palette.g0)
call s:hi('LineNr', s:palette.g3, s:palette.bg)
call s:hi('CursorLineNr', s:palette.g5, s:palette.g2)
call s:hi('DiffAdd', s:palette.g, s:palette.none)
call s:hi('DiffChange', s:palette.b, s:palette.none)
call s:hi('DiffDelete', s:palette.r, s:palette.none)
call s:hi('DiffText', s:palette.b, s:palette.none)
call s:hi('Directory', s:palette.g, s:palette.none)
call s:hi('ErrorMsg', s:palette.r, s:palette.none, 'bold,underline')
call s:hi('WarningMsg', s:palette.y, s:palette.none, 'bold')
call s:hi('ModeMsg', s:palette.g4, s:palette.none, 'bold')
call s:hi('MoreMsg', s:palette.b, s:palette.none, 'bold')
call s:hi('MatchParen', s:palette.none, s:palette.g2)
call s:hi('NonText', s:palette.g25, s:palette.none)
call s:hi('Whitespace', s:palette.g3, s:palette.none)
call s:hi('SpecialKey', s:palette.g4, s:palette.none)
call s:hi('Pmenu', s:palette.none, s:palette.none)
call s:hi('PmenuSbar', s:palette.none, s:palette.none)
call s:hi('PmenuSel', s:palette.none, s:palette.g1)
highlight! link WildMenu PmenuSel
call s:hi('PmenuThumb', s:palette.none, s:palette.g2)
call s:hi('NormalFloat', s:palette.g5, s:palette.bg)
call s:hi('FloatBorder', s:palette.g25, s:palette.none)
call s:hi('Question', s:palette.y, s:palette.none)
call s:hi('SpellBad', s:palette.none, s:palette.none, 'undercurl', s:palette.r)
call s:hi('SpellCap', s:palette.none, s:palette.none, 'undercurl', s:palette.y)
call s:hi('SpellLocal', s:palette.none, s:palette.none, 'undercurl', s:palette.b)
call s:hi('SpellRare', s:palette.none, s:palette.none, 'undercurl', s:palette.m)
call s:hi('StatusLine', s:palette.g5, s:palette.g2)
call s:hi('StatusLineTerm', s:palette.g5, s:palette.g2)
call s:hi('StatusLineNC', s:palette.g5, s:palette.g1)
call s:hi('StatusLineTermNC', s:palette.g5, s:palette.g1)
call s:hi('TabLine', s:palette.g6, s:palette.g2)
call s:hi('TabLineFill', s:palette.g5, s:palette.none)
call s:hi('TabLineSel', s:palette.bg, s:palette.m)
call s:hi('VertSplit', s:palette.g1, s:palette.none)
call s:hi('WinSeparator', s:palette.g1, s:palette.none)
call s:hi('Visual', s:palette.none, s:palette.g3)
call s:hi('VisualNOS', s:palette.none, s:palette.g3, 'underline')
call s:hi('QuickFixLine', s:palette.m, s:palette.none, 'bold')
call s:hi('Debug', s:palette.y, s:palette.none)
call s:hi('debugPC', s:palette.bg, s:palette.g)
call s:hi('debugBreakpoint', s:palette.bg, s:palette.r)
call s:hi('ToolbarButton', s:palette.bg, s:palette.m)
if has('nvim')
  call s:hi('Substitute', s:palette.bg, s:palette.y)
  highlight! link DiagnosticFloatingError ErrorFloat
  highlight! link DiagnosticFloatingWarn WarningFloat
  highlight! link DiagnosticFloatingInfo InfoFloat
  highlight! link DiagnosticFloatingHint HintFloat
  highlight! link DiagnosticError ErrorText
  highlight! link DiagnosticWarn WarningText
  highlight! link DiagnosticInfo InfoText
  highlight! link DiagnosticHint HintText
  highlight! link DiagnosticVirtualTextError VirtualTextError
  highlight! link DiagnosticVirtualTextWarn VirtualTextWarning
  highlight! link DiagnosticVirtualTextInfo VirtualTextInfo
  highlight! link DiagnosticVirtualTextHint VirtualTextHint
  highlight! link DiagnosticUnderlineError ErrorText
  highlight! link DiagnosticUnderlineWarn WarningText
  highlight! link DiagnosticUnderlineInfo InfoText
  highlight! link DiagnosticUnderlineHint HintText
  highlight! link DiagnosticSignError RedSign
  highlight! link DiagnosticSignWarn YellowSign
  highlight! link DiagnosticSignInfo BlueSign
  highlight! link DiagnosticSignHint GreenSign
  highlight! link LspDiagnosticsFloatingError ErrorFloat
  highlight! link LspDiagnosticsFloatingWarning WarningFloat
  highlight! link LspDiagnosticsFloatingInformation InfoFloat
  highlight! link LspDiagnosticsFloatingHint HintFloat
  highlight! link LspDiagnosticsDefaultError ErrorText
  highlight! link LspDiagnosticsDefaultWarning WarningText
  highlight! link LspDiagnosticsDefaultInformation InfoText
  highlight! link LspDiagnosticsDefaultHint HintText
  highlight! link LspDiagnosticsVirtualTextError VirtualTextError
  highlight! link LspDiagnosticsVirtualTextWarning VirtualTextWarning
  highlight! link LspDiagnosticsVirtualTextInformation VirtualTextInfo
  highlight! link LspDiagnosticsVirtualTextHint VirtualTextHint
  highlight! link LspDiagnosticsUnderlineError ErrorText
  highlight! link LspDiagnosticsUnderlineWarning WarningText
  highlight! link LspDiagnosticsUnderlineInformation InfoText
  highlight! link LspDiagnosticsUnderlineHint HintText
  highlight! link LspDiagnosticsSignError RedSign
  highlight! link LspDiagnosticsSignWarning YellowSign
  highlight! link LspDiagnosticsSignInformation BlueSign
  highlight! link LspDiagnosticsSignHint GreenSign
  highlight! link LspReferenceText CurrentWord
  highlight! link LspReferenceRead CurrentWord
  highlight! link LspReferenceWrite CurrentWord
  highlight! link TermCursor Cursor
  highlight! link healthError Red
  highlight! link healthSuccess Green
  highlight! link healthWarning Yellow
endif


call s:hi('Type', s:palette.r, s:palette.none, 'italic')
call s:hi('Structure', s:palette.r, s:palette.none, 'italic')
call s:hi('StorageClass', s:palette.r, s:palette.none, 'italic')
call s:hi('Identifier', s:palette.c, s:palette.none, 'italic')
call s:hi('Constant', s:palette.g, s:palette.none, 'italic')
call s:hi('PreProc', s:palette.m, s:palette.none)
call s:hi('PreCondit', s:palette.m, s:palette.none)
call s:hi('Include', s:palette.m, s:palette.none)
call s:hi('Keyword', s:palette.m, s:palette.none)
call s:hi('Define', s:palette.m, s:palette.none)
call s:hi('Typedef', s:palette.m, s:palette.none)
call s:hi('Exception', s:palette.m, s:palette.none)
call s:hi('Conditional', s:palette.m, s:palette.none)
call s:hi('Repeat', s:palette.m, s:palette.none)
call s:hi('Statement', s:palette.m, s:palette.none)
call s:hi('Macro', s:palette.y, s:palette.none)
call s:hi('Error', s:palette.m, s:palette.none)
call s:hi('Label', s:palette.y, s:palette.none)
call s:hi('Special', s:palette.y, s:palette.none)
call s:hi('SpecialChar', s:palette.y, s:palette.none)
call s:hi('Boolean', s:palette.g, s:palette.none)
call s:hi('String', s:palette.g, s:palette.none)
call s:hi('Character', s:palette.g, s:palette.none)
call s:hi('Number', s:palette.r, s:palette.none)
call s:hi('Float', s:palette.g, s:palette.none)
call s:hi('Function', s:palette.b, s:palette.none)
call s:hi('Operator', s:palette.m, s:palette.none)
call s:hi('Title', s:palette.none, s:palette.none, 'bold')
call s:hi('Tag', s:palette.y, s:palette.none)
call s:hi('Delimiter', s:palette.g4, s:palette.none)
call s:hi('Comment', s:palette.g3, s:palette.none, 'italic')
call s:hi('SpecialComment', s:palette.g4, s:palette.none, 'italic')
call s:hi('Todo', s:palette.r, s:palette.none, 'italic')
call s:hi('Ignore', s:palette.g4, s:palette.none)
call s:hi('Underlined', s:palette.none, s:palette.none, 'underline')
call s:hi('markdownUrl', s:palette.lb, s:palette.none, 'underline')


call s:hi('Fg', s:palette.g4, s:palette.none)
call s:hi('Bright', s:palette.g7, s:palette.none)
call s:hi('BrightItalic', s:palette.g7, s:palette.none, 'italic')
call s:hi('Grey', s:palette.g4, s:palette.none)
call s:hi('Red', s:palette.r, s:palette.none)
call s:hi('Yellow', s:palette.y, s:palette.none)
call s:hi('Green', s:palette.g, s:palette.none)
call s:hi('Cyan', s:palette.c, s:palette.none)
call s:hi('Blue', s:palette.b, s:palette.none)
call s:hi('Purple', s:palette.m, s:palette.none)
call s:hi('BrightRed', s:palette.lr, s:palette.none)
call s:hi('BrightYellow', s:palette.ly, s:palette.none)
call s:hi('BrightGreen', s:palette.lg, s:palette.none)
call s:hi('BrightCyan', s:palette.lc, s:palette.none)
call s:hi('BrightBlue', s:palette.lb, s:palette.none)
call s:hi('BrightPurple', s:palette.lm, s:palette.none)
call s:hi('RedBold', s:palette.r, s:palette.none, 'bold')
call s:hi('YellowBold', s:palette.y, s:palette.none, 'bold')
call s:hi('GreenBold', s:palette.g, s:palette.none, 'bold')
call s:hi('CyanBold', s:palette.c, s:palette.none, 'bold')
call s:hi('BlueBold', s:palette.b, s:palette.none, 'bold')
call s:hi('PurpleBold', s:palette.m, s:palette.none, 'bold')
call s:hi('BrightRedBold', s:palette.lr, s:palette.none, 'bold')
call s:hi('BrightYellowBold', s:palette.ly, s:palette.none, 'bold')
call s:hi('BrightGreenBold', s:palette.lg, s:palette.none, 'bold')
call s:hi('BrightCyanBold', s:palette.lc, s:palette.none, 'bold')
call s:hi('BrightBlueBold', s:palette.lb, s:palette.none, 'bold')
call s:hi('BrightPurpleBold', s:palette.lm, s:palette.none, 'bold')
call s:hi('RedItalic', s:palette.r, s:palette.none, 'italic')
call s:hi('YellowItalic', s:palette.y, s:palette.none, 'italic')
call s:hi('GreenItalic', s:palette.g, s:palette.none, 'italic')
call s:hi('CyanItalic', s:palette.c, s:palette.none, 'italic')
call s:hi('BlueItalic', s:palette.b, s:palette.none, 'italic')
call s:hi('PurpleItalic', s:palette.m, s:palette.none, 'italic')
call s:hi('BrightRedItalic', s:palette.lr, s:palette.none, 'italic')
call s:hi('BrightYellowItalic', s:palette.ly, s:palette.none, 'italic')
call s:hi('BrightGreenItalic', s:palette.lg, s:palette.none, 'italic')
call s:hi('BrightCyanItalic', s:palette.lc, s:palette.none, 'italic')
call s:hi('BrightBlueItalic', s:palette.lb, s:palette.none, 'italic')
call s:hi('BrightPurpleItalic', s:palette.lm, s:palette.none, 'italic')
call s:hi('RedSign', s:palette.r, s:palette.none)
call s:hi('YellowSign', s:palette.y, s:palette.none)
call s:hi('GreenSign', s:palette.g, s:palette.none)
call s:hi('CyanSign', s:palette.c, s:palette.none)
call s:hi('BlueSign', s:palette.b, s:palette.none)
call s:hi('PurpleSign', s:palette.m, s:palette.none)
call s:hi('ErrorText', s:palette.none, s:palette.r, 'undercurl', s:palette.r)
call s:hi('WarningText', s:palette.none, s:palette.y, 'undercurl', s:palette.y)
call s:hi('InfoText', s:palette.none, s:palette.b, 'undercurl', s:palette.b)
call s:hi('HintText', s:palette.none, s:palette.g, 'undercurl', s:palette.g)
call s:hi('ErrorLine', s:palette.none, s:palette.r)
call s:hi('WarningLine', s:palette.none, s:palette.y)
call s:hi('InfoLine', s:palette.none, s:palette.b)
call s:hi('HintLine', s:palette.none, s:palette.g)
highlight! link VirtualTextWarning Yellow
highlight! link VirtualTextError Red
highlight! link VirtualTextInfo Blue
highlight! link VirtualTextHint Green
call s:hi('ErrorFloat', s:palette.r, s:palette.g2)
call s:hi('WarningFloat', s:palette.y, s:palette.g2)
call s:hi('InfoFloat', s:palette.b, s:palette.g2)
call s:hi('HintFloat', s:palette.g, s:palette.g2)
if &diff
  call s:hi('CurrentWord', s:palette.bg0, s:palette.g)
else
  call s:hi('CurrentWord', s:palette.none, s:palette.g2)
endif
if (has('termguicolors') && &termguicolors) || has('gui_running')
  " Definition
  let s:terminal = {
        \ 'black':    &background ==# 'dark' ? s:palette.g0 : s:palette.g6,
        \ 'red':      s:palette.r,
        \ 'yellow':   s:palette.y,
        \ 'green':    s:palette.g,
        \ 'cyan':     s:palette.c,
        \ 'blue':     s:palette.b,
        \ 'purple':   s:palette.m,
        \ 'white':    &background ==# 'dark' ? s:palette.g6 : s:palette.g0
        \ }
  " Implementation: {{{
  if !has('nvim')
    let g:terminal_ansi_colors = [s:terminal.black[0], s:terminal.red[0], s:terminal.green[0], s:terminal.yellow[0],
          \ s:terminal.blue[0], s:terminal.purple[0], s:terminal.cyan[0], s:terminal.white[0], s:terminal.black[0], s:terminal.red[0],
          \ s:terminal.green[0], s:terminal.yellow[0], s:terminal.blue[0], s:terminal.purple[0], s:terminal.cyan[0], s:terminal.white[0]]
  else
    let g:terminal_color_0 = s:terminal.black[0]
    let g:terminal_color_1 = s:terminal.red[0]
    let g:terminal_color_2 = s:terminal.green[0]
    let g:terminal_color_3 = s:terminal.yellow[0]
    let g:terminal_color_4 = s:terminal.blue[0]
    let g:terminal_color_5 = s:terminal.purple[0]
    let g:terminal_color_6 = s:terminal.cyan[0]
    let g:terminal_color_7 = s:terminal.white[0]
    let g:terminal_color_8 = s:terminal.black[0]
    let g:terminal_color_9 = s:terminal.red[0]
    let g:terminal_color_10 = s:terminal.green[0]
    let g:terminal_color_11 = s:terminal.yellow[0]
    let g:terminal_color_12 = s:terminal.blue[0]
    let g:terminal_color_13 = s:terminal.purple[0]
    let g:terminal_color_14 = s:terminal.cyan[0]
    let g:terminal_color_15 = s:terminal.white[0]
  endif
  " }}}
endif
" nvim-treesitter/nvim-treesitter {{{
call s:hi('TSStrong', s:palette.none, s:palette.none, 'bold')
call s:hi('TSEmphasis', s:palette.none, s:palette.none, 'italic')
call s:hi('TSUnderline', s:palette.none, s:palette.none, 'underline')
call s:hi('TSNote', s:palette.bg, s:palette.b, 'bold')
call s:hi('TSWarning', s:palette.bg, s:palette.y, 'bold')
call s:hi('TSDanger', s:palette.bg, s:palette.r, 'bold')
highlight! link TSAnnotation Purple
highlight! link TSAttribute Yellow
highlight! link TSBoolean Green
highlight! link TSCharacter Green
highlight! link TSComment Comment
highlight! link TSConditional Purple
highlight! link TSConstBuiltin CyanItalic
highlight! link TSConstMacro CyanItalic
highlight! link TSConstant GreenItalic
highlight! link TSConstructor Blue
highlight! link TSException Purple
highlight! link TSEnvironment BrightPurple
highlight! link TSEnvironmentName Bright
highlight! link TSField Grey
highlight! link TSFloat Green
highlight! link TSFuncBuiltin Blue
highlight! link TSFuncMacro Cyan
highlight! link TSFunction Cyan
highlight! link TSInclude Blue
highlight! link TSKeyword Blue
highlight! link TSKeywordFunction Purple
highlight! link TSKeywordOperator Purple
highlight! link TSLabel Purple
highlight! link TSMethod Blue
highlight! link TSNamespace Purple
highlight! link TSNone Fg
highlight! link TSNumber Red
highlight! link TSOperator Purple
highlight! link TSParameter BlueItalic
highlight! link TSParameterReference BlueItalic
highlight! link TSProperty BlueItalic
highlight! link TSPunctBracket Grey
highlight! link TSPunctDelimiter Yellow
highlight! link TSPunctSpecial Yellow
highlight! link TSRepeat Purple
highlight! link TSString BrightPurpleItalic
highlight! link TSStringEscape Yellow
highlight! link TSStringRegex Yellow
highlight! link TSStructure CyanItalic
highlight! link TSSymbol Red
highlight! link TSTag CyanItalic
highlight! link TSTagDelimiter Grey
highlight! link TSText Green
highlight! link TSStrike Grey
highlight! link TSMath Yellow
highlight! link TSType Cyan
highlight! link TSTypeBuiltin Yellow
highlight! link TSURI markdownUrl
highlight! link TSVariable Fg
highlight! link TSVariableBuiltin Fg
" }}}

function! s:ModeCursorLineNr()
  if mode() == 'n'
    call s:hi('CursorLineNr', s:palette.g5, s:palette.g2)
  elseif mode() == 'i' || mode() == 't'
    call s:hi('CursorLineNr', s:palette.g1, s:palette.c)
  elseif mode() == 'v' || mode() == "\<c-v>"
    call s:hi('CursorLineNr', s:palette.g1, s:palette.r)
  else
    call s:hi('CursorLineNr', s:palette.g5, s:palette.g2)
  endif
endfunction

autocmd ModeChanged * call s:ModeCursorLineNr()

call s:hi('IblIndent', s:palette.g2, s:palette.none)
call s:hi('IblScope', s:palette.m, s:palette.none)
