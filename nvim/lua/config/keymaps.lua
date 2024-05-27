-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps herew
local discipline = require("derhachov.discipline")
-- discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("i", "jk", "<ESC>")
keymap.set("i", "kj", "<ESC>")

keymap.set("n", "x", '"_x')

keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Move Between Splits with CTRL + h/j/k/l -
keymap.set("n", "dw", 'vb"_d')

keymap.set("n", "<C-a>", "gg<S-v>G")

keymap.set("n", "te", ":tabedit<Return>", opts)
keymap.set("n", "sv", ":split<Return><C-w>W", opts)
keymap.set("n", "ss", ":vsplit<Return><C-w>W", opts)
keymap.set("n", "K", vim.lsp.buf.hover, opts)

keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
keymap.set("n", "<leader>ut", ":UndotreeToggle<CR>", { desc = "Toggle undotree" })
keymap.set("n", "<leader>ch", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })

-- Git Worktree
keymap.set(
  "n",
  "<leader>gw",
  ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
  { desc = "Toggle git worktree" }
)
keymap.set(
  "n",
  "<leader>gW",
  ":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
  { desc = "Toggle git worktree" }
)
