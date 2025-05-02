local lspconfig = require('lspconfig')

local setups = {}

local is_node_repo = lspconfig.util.root_pattern('package.json')(vim.fn.getcwd())

local deno_as_npm = setmetatable({}, {
  __call = function(_, cmd)
    return vim.list_extend({
      "deno",
      "run",
      "--allow-all",
      "--no-config",
      "--no-lock",
      "--node-modules-dir=false",
    }, cmd)
  end,
})
deno_as_npm.cmd_env = { NO_COLOR = true }

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

setups.clangd = function(opts)
  lspconfig.clangd.setup(opts)
end

setups.vtsls = function(opts)
  if is_node_repo then
    opts.cmd = { "pnpx", "npm:@vtsls/language-server@0.2.5", "--stdio" }
    opts.on_attach = function(client)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end
    lspconfig.vtsls.setup(opts)
  end
end

setups.ruff = function(opts)
  lspconfig.ruff.setup(opts)
end

setups.pylsp = function(opts)
  lspconfig.pylsp.setup(opts)
end

setups.pyright = function(opts)
  opts.cmd = deno_as_npm { "npm:pyright@1.1.370/pyright-langserver", "--stdio" }
  opts.cmd_env = deno_as_npm.cmd_env
  opts.single_file_support = true
  lspconfig.pyright.setup(opts)
end

setups.denols = function(opts)
  opts.single_file_support = true
  if not is_node_repo then
    lspconfig.denols.setup(opts)
  end
end

setups.svelte = function(opts)
  -- opts.cmd = deno_as_npm { "npm:svelte-language-server@0.17.0", "--stdio" }
  opts.cmd = { "pnpx", "npm:svelte-language-server@0.17.0", "--stdio" }
  opts.on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end
  lspconfig.svelte.setup(opts)
end

setups.tinymist = function(opts)
  lspconfig.tinymist.setup(opts)
end

setups.texlab = function(opts)
  lspconfig.texlab.setup(opts)
end

setups.zls = function(opts)
  lspconfig.zls.setup(opts)
end

setups.hls = function(opts)
  lspconfig.hls.setup(opts)
end

setups.taplo = function(opts)
  lspconfig.taplo.setup(opts)
end

return setups
