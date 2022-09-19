" vim: fdm=marker
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
nmap <space>n :<C-u>setlocal relativenumber!<CR>
let g:mapleader = "\<Space>"
nnoremap <Leader> <Nop>
xnoremap <Leader> <Nop>
autocmd InsertLeave * call system('fcitx5-remote -c &')
" term mode window controll {{{
tnoremap <C-W>n       <cmd>new<cr>
tnoremap <C-W><C-N>   <cmd>new<cr>
tnoremap <C-W>q       <cmd>quit<cr>
tnoremap <C-W><C-Q>   <cmd>quit<cr>
tnoremap <C-W>c       <cmd>close<cr>
tnoremap <C-W>o       <cmd>only<cr>
tnoremap <C-W><C-O>   <cmd>only<cr>
tnoremap <C-W><Down>  <cmd>wincmd j<cr>
tnoremap <C-W><C-J>   <cmd>wincmd j<cr>
tnoremap <C-W>j       <cmd>wincmd j<cr>
tnoremap <C-W><Up>    <cmd>wincmd k<cr>
tnoremap <C-W><C-K>   <cmd>wincmd k<cr>
tnoremap <C-W>k       <cmd>wincmd k<cr>
tnoremap <C-W><Left>  <cmd>wincmd h<cr>
tnoremap <C-W><C-H>   <cmd>wincmd h<cr>
tnoremap <C-W><BS>    <cmd>wincmd h<cr>
tnoremap <C-W>h       <cmd>wincmd h<cr>
tnoremap <C-W><Right> <cmd>wincmd l<cr>
tnoremap <C-W><C-L>   <cmd>wincmd l<cr>
tnoremap <C-W>l       <cmd>wincmd l<cr>
tnoremap <C-W>w       <cmd>wincmd w<cr>
tnoremap <C-W><C-W>   <cmd>wincmd w<cr>
tnoremap <C-W>W       <cmd>wincmd W<cr>
tnoremap <C-W>t       <cmd>wincmd t<cr>
tnoremap <C-W><C-T>   <cmd>wincmd t<cr>
tnoremap <C-W>b       <cmd>wincmd b<cr>
tnoremap <C-W><C-B>   <cmd>wincmd b<cr>
tnoremap <C-W>p       <cmd>wincmd p<cr>
tnoremap <C-W><C-P>   <cmd>wincmd p<cr>
tnoremap <C-W>P       <cmd>wincmd P<cr>
tnoremap <C-W>r       <cmd>wincmd r<cr>
tnoremap <C-W><C-R>   <cmd>wincmd r<cr>
tnoremap <C-W>R       <cmd>wincmd R<cr>
tnoremap <C-W>x       <cmd>wincmd x<cr>
tnoremap <C-W><C-X>   <cmd>wincmd x<cr>
tnoremap <C-W>K       <cmd>wincmd K<cr>
tnoremap <C-W>J       <cmd>wincmd J<cr>
tnoremap <C-W>H       <cmd>wincmd H<cr>
tnoremap <C-W>L       <cmd>wincmd L<cr>
tnoremap <C-W>T       <cmd>wincmd T<cr>
tnoremap <C-W>=       <cmd>wincmd =<cr>
tnoremap <C-W>-       <cmd>wincmd -<cr>
tnoremap <C-W>+       <cmd>wincmd +<cr>
tnoremap <C-W>z       <cmd>pclose<cr>
tnoremap <C-W><C-Z>   <cmd>pclose<cr>
" }}}
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
