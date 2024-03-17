" hook_source {{{
let g:vimtex_compiler_latexmk = {
  \'background': 1,
  \'build_dir': '',
  \'continuous': 1,
  \'options': [
    \'-pdfdvi', 
    \'-verbose',
    \'-file-line-error',
    \'-synctex=1',
    \'-interaction=nonstopmode',
  \],
  \}
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_general_options = "-x \"nvr +%{line} %{input}\" --synctex-forward @line:0:@tex @pdf"
" }}}
