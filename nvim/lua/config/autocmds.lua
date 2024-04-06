-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.filetype.add({
  extension = {
    cmp = "html",
  },
})

--Salesforce filetypes

vim.filetype.add({
  extension = {
    design = "html",
  },
})

vim.filetype.add({
  extension = {
    auradoc = "html",
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "st",
  callback = function()
    vim.cmd("set filetype=apex")
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "mallard",
  callback = function()
    vim.cmd("set filetype=html")
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.trigger" },
  callback = function()
    vim.cmd("set filetype=apex")
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.apex" },
  callback = function()
    vim.cmd("set filetype=apex")
  end,
})
