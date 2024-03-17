-- Disable default plugins
-- Fast Startup Settings!!
local disable_pluings = {
  -- Disable TOhtml.
  'loaded_2html_plugin',

  -- Disable archive file open and browse.
  'loaded_gzip',
  'loaded_tar',
  'loaded_tarPlugin',
  'loaded_zip',
  'loaded_zipPlugin',

  -- Disable vimball.
  'loaded_vimball',
  'loaded_vimballPlugin',

  -- Disable netrw plugins.
  'loaded_netrw',
  'loaded_netrwPlugin',
  'loaded_netrwSettings',
  'loaded_netrwFileHandlers',

  -- Disable `GetLatestVimScript`.
  'loaded_getscript',
  'loaded_getscriptPlugin',

  -- Disable other plugins
  'loaded_shada_plugin',
  'loaded_spellfile_plugin',
  'loaded_tutor_mode_plugin',
  'did_install_default_menus',
  'did_install_syntax_menu',
  'did_indent_on',
  'loaded_rrhelper',
  'loaded_matchit',
  'loaded_matchparen',
  'loaded_fzf',
}

for _, disable_plugin in pairs(disable_pluings) do
  vim.g[disable_plugin] = true
end
