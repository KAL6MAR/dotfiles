-- find root of the project
local root = vim.fn.getcwd()

return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters = {
      prettier = {
        args = function(self, ctx)
          if
              vim.endswith(ctx.filename, ".cls")
              or vim.endswith(ctx.filename, ".trigger" or vim.endswith(ctx.filename, ".apex"))
          then
            return {
              "--stdin-filepath",
              "$FILENAME",
              "--plugin",
              "prettier-plugin-apex",
            }
          end
          return { "--stdin-filepath", "$FILENAME", "--plugin", "prettier-plugin-tailwindcss" }
        end,
      },
    },
    formatters_by_ft = {
      ["javascript"] = { "prettierd" },
      ["javascriptreact"] = { "prettier" },
      ["typescript"] = { "prettier" },
      ["typescriptreact"] = { "prettier" },
      ["vue"] = { "prettier" },
      ["css"] = { "prettier" },
      ["scss"] = { "prettier" },
      ["less"] = { "prettier" },
      ["html"] = { "prettier" },
      ["json"] = { "prettier" },
      ["jsonc"] = { "prettier" },
      ["yaml"] = { "prettier" },
      ["markdown"] = { "prettier" },
      ["markdown.mdx"] = { "prettier" },
      ["graphql"] = { "prettier" },
      ["handlebars"] = { "prettier" },
      ["apex"] = { "prettier" },
    },
    ext_parsers = {
      apex = "html",
    },
    format = {
      -- async = true,
      lsp_fallback = true,
    },
  },
}
