if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  echoerr '[antibalus] termguicolors is not set. antibalus requires true-color support.'
  finish
endif

if !(exists('g:colors_name') && g:colors_name ==# 'antibalus')
  hi clear
  if exists('syntax_on')
    syntax reset
  endif
endif

let g:colors_name = 'antibalus'

hi Normal guifg=#d9d9d9 guibg=#1e1e1e gui=NONE
hi NormalFloat guifg=#d9d9d9 guibg=#1e1e1e gui=NONE
hi IncSearch guifg=#1e1e1e guibg=#95c0ff gui=NONE
hi CurSearch guifg=#1e1e1e guibg=#95c0ff gui=NONE
hi Search guifg=NONE guibg=#3a5678 gui=NONE
hi ErrorMsg guifg=#e24871 guibg=NONE gui=NONE
hi WarningMsg guifg=#d7a564 guibg=NONE gui=NONE
hi ModeMsg guifg=#d9d9d9 guibg=NONE gui=bold
hi MoreMsg guifg=#77aaf6 guibg=NONE gui=bold
hi Question guifg=#d7a564 guibg=NONE gui=NONE
hi NonText guifg=#4e4e4e guibg=NONE gui=NONE
hi StatusLine guifg=#d9d9d9 guibg=#303030 gui=NONE
hi StatusLineTerm guifg=#d9d9d9 guibg=#303030 gui=NONE
hi StatusLineNC guifg=#b4b4b4 guibg=#222222 gui=NONE
hi StatusLineTermNC guifg=#b4b4b4 guibg=#222222 gui=NONE
hi TabLine guifg=#4e4e4e guibg=NONE gui=NONE
hi TabLineFill guifg=NONE guibg=NONE gui=NONE
hi TabLineSel guifg=#d9d9d9 guibg=#3f3f3f gui=NONE
hi VertSplit guifg=#000000 guibg=NONE gui=NONE
hi WinSeparator guifg=#000000 guibg=NONE gui=NONE
hi FloatBorder guifg=#3f3f3f guibg=NONE gui=NONE
hi WildMenu guifg=#77aaf6 guibg=#303030 gui=NONE
hi DiffAdd guifg=NONE guibg=#1b2f26 gui=NONE
hi DiffChange guifg=NONE guibg=#1b2c34 gui=NONE
hi DiffDelete guifg=#e24871 guibg=#341b25 gui=NONE
hi DiffText guifg=NONE guibg=#1b2c34 gui=NONE
hi Cursor guifg=NONE guibg=NONE gui=reverse
hi! link vCursor Cursor
hi! link iCursor Cursor
hi! link lCursor Cursor
hi! link CursorIM Cursor
hi CursorLine guifg=NONE guibg=#222222 gui=NONE
hi CursorColumn guifg=NONE guibg=#222222 gui=NONE
hi LineNr guifg=#4e4e4e guibg=NONE gui=NONE
hi CursorLineNr guifg=#7f7f7f guibg=NONE gui=NONE
hi Folded guifg=#caa8ef guibg=#222222 gui=NONE
hi FoldColumn guifg=NONE guibg=NONE gui=NONE
hi MatchParen guifg=NONE guibg=NONE gui=reverse
hi Pmenu guifg=#d9d9d9 guibg=NONE gui=NONE
hi PmenuSel guifg=NONE guibg=#303030 gui=NONE
hi Title guifg=#77aaf6 guibg=NONE gui=bold
hi Directory guifg=#77aaf6 guibg=NONE gui=NONE
hi Comment guifg=#7f7f7f guibg=NONE gui=NONE
hi Constant guifg=#e37fc0 guibg=NONE gui=NONE
hi String guifg=#77d0a4 guibg=NONE gui=NONE
hi Character guifg=#77d0a4 guibg=NONE gui=NONE
hi Number guifg=#f499d3 guibg=NONE gui=NONE
hi Boolean guifg=#77d0a4 guibg=NONE gui=NONE
hi Float guifg=#f499d3 guibg=NONE gui=NONE
hi Identifier guifg=#77aaf6 guibg=NONE gui=NONE
hi Function guifg=#38d1db guibg=NONE gui=NONE
hi Statement guifg=#77aaf6 guibg=NONE gui=NONE
hi Conditional guifg=#77aaf6 guibg=NONE gui=NONE
hi Repeat guifg=#77aaf6 guibg=NONE gui=NONE
hi Label guifg=#77aaf6 guibg=NONE gui=NONE
hi Operator guifg=#77aaf6 guibg=NONE gui=NONE
hi Keyword guifg=#77aaf6 guibg=NONE gui=NONE
hi Exception guifg=#77aaf6 guibg=NONE gui=NONE
hi PreProc guifg=#e37fc0 guibg=NONE gui=NONE
hi Include guifg=#77aaf6 guibg=NONE gui=NONE
hi Define guifg=#77aaf6 guibg=NONE gui=NONE
hi Macro guifg=#e37fc0 guibg=NONE gui=NONE
hi PreCondit guifg=#77aaf6 guibg=NONE gui=NONE
hi Type guifg=#b691df guibg=NONE gui=NONE
hi StorageClass guifg=#77aaf6 guibg=NONE gui=NONE
hi Structure guifg=#77aaf6 guibg=NONE gui=NONE
hi Typedef guifg=#77aaf6 guibg=NONE gui=NONE
hi Special guifg=#77aaf6 guibg=NONE gui=NONE
hi SpecialChar guifg=#77aaf6 guibg=NONE gui=NONE
hi Tag guifg=#77aaf6 guibg=NONE gui=NONE
hi Delimiter guifg=#d9d9d9 guibg=NONE gui=NONE
hi SpecialComment guifg=#77aaf6 guibg=NONE gui=NONE
hi Debug guifg=#e7876e guibg=NONE gui=NONE
hi Underlined guifg=NONE guibg=NONE gui=underline
hi Ignore guifg=NONE guibg=NONE gui=strikethrough
hi Error guifg=NONE guibg=#73243e gui=NONE
hi Todo guifg=#1e1e1e guibg=#77aaf6 gui=NONE
hi! link Added DiffAdd
hi! link Changed DiffChange
hi! link Removed DiffDelete
hi DiagnosticError guifg=#e24871 guibg=#341b25 gui=NONE
hi DiagnosticWarn guifg=#d7a564 guibg=#332b1b gui=NONE
hi DiagnosticInfo guifg=#00bcc8 guibg=#1b2f32 gui=NONE
hi DiagnosticHint guifg=#77aaf6 guibg=#1b2c34 gui=NONE
hi DiagnosticOk guifg=#56bb8d guibg=#1b2f26 gui=NONE
hi DiagnosticSignError guifg=#e24871 guibg=NONE gui=NONE
hi DiagnosticSignWarn guifg=#d7a564 guibg=NONE gui=NONE
hi DiagnosticSignInfo guifg=#00bcc8 guibg=NONE gui=NONE
hi DiagnosticSignHint guifg=#77aaf6 guibg=NONE gui=NONE
hi DiagnosticSignOk guifg=#56bb8d guibg=NONE gui=NONE
hi DiagnosticUnderlineError guifg=NONE guibg=NONE gui=undercurl guisp=#e24871
hi DiagnosticUnderlineWarn guifg=NONE guibg=NONE gui=undercurl guisp=#d7a564
hi DiagnosticUnderlineInfo guifg=NONE guibg=NONE gui=undercurl guisp=#00bcc8
hi DiagnosticUnderlineHint guifg=NONE guibg=NONE gui=undercurl guisp=#77aaf6
hi DiagnosticUnderlineOk guifg=NONE guibg=NONE gui=undercurl guisp=#56bb8d
hi GitSignsAdd guifg=#56bb8d guibg=NONE gui=NONE
hi GitSignsChange guifg=#77aaf6 guibg=NONE gui=NONE
hi GitSignsDelete guifg=#e24871 guibg=NONE gui=NONE
hi CmdlineCursor guifg=#000000 guibg=#ffffff gui=NONE
if has('nvim')
  let g:terminal_color_0  = '#303030'
  let g:terminal_color_1  = '#e24871'
  let g:terminal_color_2  = '#56bb8d'
  let g:terminal_color_3  = '#d7a564'
  let g:terminal_color_4  = '#77aaf6'
  let g:terminal_color_5  = '#b691df'
  let g:terminal_color_6  = '#00bcc8'
  let g:terminal_color_7  = '#d9d9d9'
  let g:terminal_color_8  = '#3f3f3f'
  let g:terminal_color_9  = '#f26887'
  let g:terminal_color_10 = '#77d0a4'
  let g:terminal_color_11 = '#ebbb80'
  let g:terminal_color_12 = '#95c0ff'
  let g:terminal_color_13 = '#caa8ef'
  let g:terminal_color_14 = '#38d1db'
  let g:terminal_color_15 = '#ffffff'
endif
