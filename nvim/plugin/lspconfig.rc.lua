local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end
local status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if (not status) then
  print('There is no cmp_nvim_lsp')
  return
end

local protocol = require('vim.lsp.protocol')
local apex_jar_path = vim.fn.stdpath("config") .. '/lspserver/' .. 'apex-jorje-lsp.jar'

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    vim.api.nvim_command [[augroup END]]
  end
end
local capabilities = cmp_nvim_lsp.default_capabilities()

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}

nvim_lsp.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true)
      }
    }
  }
}

require 'lspconfig'.apex_ls.setup {
  --  cmd = { "java", "-jar", "${HOME}.config/nvim/lspserver/apex-jorje-lsp.jar", "apex-language-server" },
  cmd = { "apex-language-server" },
  --  apex_jar_path = apex_jar_path,
  on_attach = on_attach,
  capabilities = capabilities,
  apex_enable_semantic_errors = true,
  apex_enable_completion_statistics = true,
  filetypes = { 'apex' }
}
