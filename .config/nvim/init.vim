" vim: fdm=marker
set number
set relativenumber
set termguicolors
set mouse=a
set guicursor=
set cursorline
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set helplang=ja

" Vim keybindings {{{
nmap <space>n :<C-u>setlocal relativenumber!<CR>
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
let g:mapleader = "\<Space>"
nnoremap <Leader> <Nop>
xnoremap <Leader> <Nop>
" }}}
" dein init {{{
" prepare CACHE {{{
let s:CACHE = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif
" }}}
" dir config
let s:vim_config_dir = fnamemodify(expand('<sfile>'), ':h')
let s:dein_home = s:CACHE . '/dein'
let s:dein_dir = s:dein_home . '/repos/github.com/Shougo/dein.vim'
" install dein {{{
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_dir)
    execute '!git clone --depth=1 https://github.com/Shougo/dein.vim' s:dein_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_dir, ':p')
endif
" }}}
" start dein
if dein#min#load_state(s:dein_home)
  " inline vimrc {{{
  " let g:dein#inline_vimrcs = ['options.rc.vim', 'mappings.rc.vim']
  " }}}
  call dein#begin(s:dein_home)
  " load toml {{{
  let s:toml_dir = s:vim_config_dir . '/toml'
  let s:dein_toml = s:toml_dir . '/dein.toml'
  let s:dein_lazy_toml = s:toml_dir . '/lazy.toml'
  call dein#load_toml(s:dein_toml, {'lazy': 0})
  call dein#load_toml(s:dein_lazy_toml, {'lazy' : 1})
  " }}}
  call dein#end()
  call dein#save_state()
endif
" auto install plugins
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}

colorscheme edge
