local lspconfig = require('lspconfig')

local setups = {}

local is_node_repo = lspconfig.util.root_pattern('package.json')(vim.fn.getcwd())

setups.lua_ls = function(opts)
  opts.settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  }
  lspconfig.lua_ls.setup(opts)
end

setups.vtsls = function(opts)
  if is_node_repo then
    lspconfig.vtsls.setup(opts)
  end
end

setups.denols = function(opts)
  if not is_node_repo then
    lspconfig.denols.setup(opts)
  end
end

return setups
