local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

vim.treesitter.language.register('java', 'apex')

ts.setup {
  highlight = {
    enable = true,
    disable = {}
  },
  indent = {
    enable = true,
    disable = {},
  },
  ignore_install = {},
  sync_install = false,
  auto_install = true,
  modules = {},
  ensure_installed = {
    'tsx',
    'lua',
    'json',
    'css',
    "apex"
  },
  autotag = {
    enable = true,
  }
}
