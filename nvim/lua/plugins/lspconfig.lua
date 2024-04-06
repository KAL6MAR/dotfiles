return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
    config = function()
      local mlspconfig = require("mason-lspconfig")
      mlspconfig.setup({
        ensure_installed = { "tailwindcss", "apex_ls", "tsserver" },
      })
      local lspconfig = require("lspconfig")
      lspconfig.apex_ls.setup({})
      lspconfig.tailwindcss.setup({})
      lspconfig.tsserver.setup({})
    end,
  },

  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      local apex_jar_path = vim.fn.stdpath("config") .. "/lspserver" .. "apex-jorje-lsp.jar"
      print(apex_jar_path)

      local on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_command([[augroup Format]])
          vim.api.nvim_command([[autocmd! * <buffer>]])
          vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
          vim.api.nvim_command([[augroup END]])
        end
      end

      lspconfig.apex_ls.setup({
        apex_jar_path = apex_jar_path,
        cmd = { "apex_language_server" },
        on_attach = on_attach,
        capabilities = capabilities,
        apex_enable_semantic_errors = true,
        apex_enable_completion_statistics = true,
        filetypes = { "apex" },
      })

      lspconfig.tsserver.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript" },
        cmd = { "typescript-language-server", "--stdio" },
      })

      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
          },
        },
      })

      lspconfig.jsonls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { "vscode-json-language-server", "--stdio" },
        filetypes = { "json", "jsonc" },
        sing_file_support = true,
      })

      lspconfig.cssls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { "vscode-css-language-server", "--stdio" },
        filetypes = { "css", "scss", "less" },
        sing_file_support = true,
        settings = {
          css = {
            validate = true,
          },
          less = {
            validate = true,
          },
          scss = {
            validate = true,
          },
        },
      })
    end,
  },
}
