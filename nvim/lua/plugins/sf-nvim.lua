return {
  dir = "~/.config/nvim/lua/derhachov/local_plugins/sf.nvim",
  branch = "dev",

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
  },

  config = function()
    require("sf").setup({
      -- Hotkeys and user commands are enabled for these filetypes
      hotkeys_in_filetypes = {
        "apex",
        "Apex",
        "sosl",
        "soql",
        "javascript",
        "html",
      },

      -- When set to `false`(default), filetypes defined in `hotkeys_in_filetypes` have
      -- hotkeys and user commands enabled.
      -- When set to `true`, hotkeys and user commands are only enabled when the file also
      -- resides in a sf project folder (i.e. has `.forceignore` or `sfdx-project.json` in the root path)
      enable_hotkeys_only_in_sf_project_folder = true,

      -- Define what metadata file names to be listed in `list_md_to_retrieve()` (<leader>ml)
      types_to_retrieve = {
        "ApexClass",
        "ApexTrigger",
        "StaticResource",
        "LightningComponentBundle",
      },
    }) -- important to call setup() to init the plugin!
  end,
}
