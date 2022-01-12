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
" lua heredoc {{{
lua << END
require'lualine'.setup {
  options = {
    theme = 'edge'
  }
}
require('neoscroll').setup({
    -- All these keys will be mapped to their corresponding default scrolling animation
    mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
                '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
    hide_cursor = true,          -- Hide cursor while scrolling
    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
    respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = 'sine',        -- Default easing function
    pre_hook = nil,              -- Function to run before the scrolling animation starts
    post_hook = nil,              -- Function to run after the scrolling animation ends
})
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
END
" }}}
colorscheme edge
