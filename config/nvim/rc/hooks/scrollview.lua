-- lua_source {{{
require('scrollview').setup({
  excluded_filetypes = {''},
  floating_windows = true,
  winblend = 50,
  signs_on_startup = {},
})
vim.api.nvim_set_hl(0, "ScrollView", { bg = "#303030" })
-- }}}
