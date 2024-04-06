vim.cmd('autocmd!')

vim.scriptendcoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = false
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = 'zsh'
vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.ai = true            -- Auto indent
vim.opt.si = true            -- Smart indent
vim.opt.wrap = false         -- Disable line wrap
vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append { '**' } -- Search in subdirectories
vim.opt.wildignore:append { '*/node_modules/*', '*/.git/*', '*/.DS_Store' }
vim.opt.relativenumber = true


vim.filetype.add({
  extension = {
    cmp = "html"
  }
})

--Salesforce filetypes

vim.filetype.add({
  extension = {
    design = "html"
  }
})

vim.filetype.add({
  extension = {
    auradoc = "html"
  }
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
  pattern = { '*.trigger' },
  callback = function()
    vim.cmd("set filetype=apex")
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { '*.apex' },
  callback = function()
    vim.cmd("set filetype=apex")
  end,
})

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

vim.opt.formatoptions:append { 'r' }
