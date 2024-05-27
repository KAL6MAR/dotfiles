return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "prettierd")
    end,
    config = function()
      require("mason").setup()
    end,
  },

  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = opts.sources or {}
      table.insert(opts.sources, nls.builtins.formatting.prettier)
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
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      -- local apex_jar_path = vim.fn.stdpath("config") .. "/lspserver" .. "apex-jorje-lsp.jar"
      vim.keymap.set(
        "n",
        "<leader>p",
        require("telescope.builtin").lsp_document_symbols,
        { desc = "LSP: Document Symbols" }
      )

      local on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_command([[augroup Format]])
          vim.api.nvim_command([[autocmd! * <buffer>]])
          vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
          vim.api.nvim_command([[augroup END]])
        end
      end

      lspconfig.apex_ls.setup({
        -- apex_jar_path = apex_jar_path,
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

      vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, {})
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-cmdline" },
    config = function()
      vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#222436" })
      vim.api.nvim_set_hl(0, "CmpNormalSelect", { bg = "#82aaff" })
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      vim.opt.completeopt = { "menu", "menuone", "noselect" }
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()
      cmp.setup({
        window = {
          completion = cmp.config.window.bordered({
            border = "single",
            winhighlight = "Normal:CmpNormal,FloatBorder:CmpNormal,CursorLine:CmpNormalSelect",
          }),
          documentation = cmp.config.window.bordered({
            border = "single",
            winhighlight = "Normal:CmpNormal,FloatBorder:CmpNormal",
          }),
          completeopt = "menu,menuone, noisert",
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<S-CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<C-CR>"] = function(fallback)
            cmp.abort()
            fallback()
          end,
        }),
        formatting = {
          fields = { "menu", "abbr", "kind" },
          format = function(_, item)
            local icons = require("lazyvim.config").icons.kinds
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end
            return item
          end,
        },
        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
        },
        sorting = defaults.sorting,
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "luasnip" }, -- For luasnip users.
          { name = "copilot" },
          { name = "obsidian" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
        snippet = {
          expand = function(args)
            local luasnip = require("luasnip")
            luasnip.lsp_expand(args.body)
          end,
        },
      })
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline({
          ["<Down>"] = { c = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }) },
          ["<Up>"] = { c = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }) },
        }),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
        matching = { disallow_symbol_nonprefix_matching = false },
      })
    end,
  },
}
