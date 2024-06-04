local base = require("nvchad.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")
-- lspconfig.ccls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
--
lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

lspconfig.texlab.setup {}
lspconfig.tsserver.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"javascript"},
}

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
})
lspconfig.ruff_lsp.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
})
lspconfig.cssls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"css"},
})
