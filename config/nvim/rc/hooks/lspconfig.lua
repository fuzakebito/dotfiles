-- lua_source {{{
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local lsp = vim.lsp
local diagnostic = vim.diagnostic

local function nnoremap(mapping, func, opts)
  vim.keymap.set('n', mapping, func, opts or { noremap = true, silent = true })
end
nnoremap('<space>le', diagnostic.open_float)
nnoremap('[d', diagnostic.goto_prev)
nnoremap(']d', diagnostic.goto_next)
nnoremap('<space>lq', diagnostic.setloclist)

local bufopts = { noremap = true, silent = true, buffer = bufnr }
nnoremap('gD', lsp.buf.declaration, bufopts)
nnoremap('gd', lsp.buf.definition, bufopts)
nnoremap('K', lsp.buf.hover, bufopts)
nnoremap('gi', lsp.buf.implementation, bufopts)
nnoremap('<C-k>', lsp.buf.signature_help, bufopts)
nnoremap('<space>lwa', lsp.buf.add_workspace_folder, bufopts)
nnoremap('<space>lwr', lsp.buf.remove_workspace_folder, bufopts)
nnoremap('<space>lwl', function()
  print(vim.inspect(lsp.buf.list_workspace_folders()))
end, bufopts)
nnoremap('<space>lD', lsp.buf.type_definition, bufopts)
nnoremap('<space>lrn', lsp.buf.rename, bufopts)
nnoremap('<space>lca', lsp.buf.code_action, bufopts)
nnoremap('gr', lsp.buf.references, bufopts)
nnoremap('<space>lf', lsp.buf.format, bufopts)

mason_lspconfig.setup({
  ensure_installed = {
    "lua_ls",
    "vimls",
  },
  automatic_installation = true,
})

require('lspconfig.ui.windows').default_options.border = 'single'

local lsp_flags = {
  debounce_text_changes = 150,
}

local capabilities = lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

mason_lspconfig.setup_handlers {
  function (server_name) -- default handler
    local opts = {}
    opts.capabilities = capabilities
    opts.flags = lsp_flags
    lspconfig[server_name].setup(opts)
  end,
  -- handler override for specific servers.
  lua_ls = function()
    lspconfig.lua_ls.setup {
      capabilities = capabilities,
      flags = lsp_flags,
      settings = {
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
    }
  end,
}
-- }}}
