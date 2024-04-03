local status, packer = pcall(require, 'packer')
if (not status) then
  print('Packer is not installed')
  return
end


vim.cmd [[packadd packer.nvim]]
packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'navarasu/onedark.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use { 'L3MON4D3/LuaSnip' }
  use { 'hoob3rt/lualine.nvim' }
  use { 'onsails/lspkind-nvim' }
  use { 'hrsh7th/cmp-buffer' }
  use 'hrsh7th/cmp-nvim-lsp'
  use { 'hrsh7th/nvim-cmp' }
  use { 'neovim/nvim-lspconfig' }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use { 'windwp/nvim-autopairs' }
  use { 'windwp/nvim-ts-autotag' }

  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-telescope/telescope-file-browser.nvim' }
  use { 'kyazdani42/nvim-web-devicons' }

  use { 'akinsho/nvim-bufferline.lua' }
  use { 'norcalli/nvim-colorizer.lua' }
  use { 'glepnir/lspsaga.nvim' }
  use { 'jose-elias-alvarez/null-ls.nvim' }
  use { 'MunifTanjim/prettier.nvim' }
  use { 'lewis6991/gitsigns.nvim' }
  use { 'dinhhuy258/git.nvim' }
  use { 'williamboman/mason.nvim' }
  use { 'williamboman/mason-lspconfig.nvim' }
  use { 'MunifTanjim/nui.nvim' }
  -- Obsidian
  use({
    "epwalsh/obsidian.nvim",
    config = function()
      require("obsidian").setup({
        use_advanced_uri = true,
        dir = "~/obsidian/main",
        daily_notes = {
          folder = "dailies",
        },
        completion = {
          nvim_cmp = true,
          min_chars = 2,
        },
        note_id_func = function(title)
          local sane_name = ""
          if title ~= nil then
            -- If title is given, transform it into valid file name.
            sane_name = title:gsub(" ", "_"):gsub("[^A-Za-z0-9-]", ""):lower()
          else
            -- If title is nil, just add 4 random uppercase letters to the suffix.
            for _ in 1, 4 do
              sane_name = sane_name .. string.char(math.random(65, 90))
            end
          end
          return sane_name
        end,
      })
    end,
  })
  -- Custom Plugins
  use { '~/Developer/ForFun/nvim-plugins/sf-menu.nvim' }
end)
