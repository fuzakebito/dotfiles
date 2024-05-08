local lspconfig = require('lspconfig')

local servers = {}

servers.lua_ls = function(opts)
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

local function setup(server_name, opts)
  if servers[server_name] then
    servers[server_name](opts)
  else
    lspconfig[server_name].setup(opts)
  end
end

return setup
