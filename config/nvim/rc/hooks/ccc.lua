-- lua_source {{{
local ccc = require("ccc")
ccc.setup({
  inputs = {
    ccc.input.rgb,
    ccc.input.hsl,
    ccc.input.cmyk,
    ccc.input.oklab,
    ccc.input.oklch,
  },
})
-- }}}
