local lspconfig = require('lspconfig')

local servers = {}

local node_root_dir = lspconfig.util.root_pattern("package.json")
local is_node_repo = node_root_dir(vim.api.nvim_buf_get_name(0)) ~= nil

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

servers.vtsls = function(opts)
  if is_node_repo then
    lspconfig.vtsls.setup(opts)
  end
end

servers.denols = function(opts)
  if not is_node_repo then
    lspconfig.denols.setup(opts)
  end
end

local function setup(server_name, opts)
  if servers[server_name] then
    servers[server_name](opts)
  else
    lspconfig[server_name].setup(opts)
  end
end

return setup
