" vim: fdm=marker
set nocompatible
set number
set termguicolors
set mouse=a
set guicursor=
set cursorline
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set helplang=ja
language messages en_US.UTF-8

" Vim keybindings {{{
nnoremap @@ @@<Plug>(atmark)
nnoremap <Plug>(atmark)@ @@<Plug>(atmark)
autocmd FocusGained * call system('fcitx5-remote -c &')
" }}}
" splitted scripts {{{
nnoremap <silent> <C-w>t :<C-u>source ~/.config/nvim/scripts/terminal.vim<cr>
" }}}
" dein init {{{
source ~/.token/token.vim
" prepare CACHE {{{
let s:CACHE = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif
" }}}
" dir config
let g:vim_config_dir = fnamemodify(expand('<sfile>'), ':h')
let s:dein_home = s:CACHE . '/dein'
let s:dein_dir = s:dein_home . '/repos/github.com/Shougo/dein.vim'
let g:dein#types#git#clone_depth = 1
let g:dein#install_progress_type = "floating"
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
  let s:toml_dir = g:vim_config_dir . '/toml'
  let s:dein_toml = s:toml_dir . '/dein.toml'
  let s:dein_lazy_toml = s:toml_dir . '/lazy.toml'
  let s:ddc_toml = s:toml_dir . '/ddc.toml'
  let s:nvimlsp_toml = s:toml_dir . '/nvim-lsp.toml'
  call dein#load_toml(s:dein_toml, {'lazy': 0})
  call dein#load_toml(s:dein_lazy_toml, {'lazy' : 1})
  call dein#load_toml(s:ddc_toml, {'lazy': 1})
  call dein#load_toml(s:nvimlsp_toml, {'lazy': 1})
  " }}}
  call dein#end()
  call dein#save_state()
endif
" load current dir as a plugin {{{
 if !empty($plug_dev)
   let &runtimepath = getcwd() .. ',' .. &runtimepath
 endif
" }}}
 
 call dein#call_hook('source')
" auto install plugins
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}
