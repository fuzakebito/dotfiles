-- lua_post_source {{{
local exclude_filetypes = {
  ["ddu-filer"] = true,
  ["deol"] = true,
}
require('hlchunk').setup({
  chunk = {
    enable = true,
    notify = true,
    use_treesitter = true,
    -- details about support_filetypes and exclude_filetypes in https://github.com/shellRaining/hlchunk.nvim/blob/main/lua/hlchunk/utils/filetype.lua
    exclude_filetypes = exclude_filetypes,
    chars = {
      horizontal_line = "─",
      vertical_line = "│",
      left_top = "╭",
      left_bottom = "╰",
      right_arrow = ">",
    },
    style = {
      { fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Keyword")), "fg", "gui") },
      { fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("ErrorMsg")), "fg", "gui") }, -- this fg is used to highlight wrong chunk
    },
    textobject = "",
    max_file_size = 1024 * 1024,
    error_sign = true,
  },
  indent = {
    enable = true,
    use_treesitter = true,
    exclude_filetypes = exclude_filetypes,
    chars = {
      "│",
    },
    style = {
      { fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("FloatBorder")), "fg", "gui") }
    },
  },
  line_num = {
    enable = false,
    use_treesitter = true,
    exclude_filetypes = exclude_filetypes,
    style = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Keyword")), "fg", "gui"),
  },
  blank = {
    enable = false,
  },
})
-- }}}
