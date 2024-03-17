-- lua_source {{{
require("ibl").setup({
  indent = { char = "▏" },
  debounce = 90,
  scope = {
    char = "▎",
    show_start = false,
    show_end = false,
    include = {
      node_type = {
        ["*"] = {
          "*",
        }
      },
    },
  },
})
-- }}}
