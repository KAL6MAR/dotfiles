return {
  "nvim-neo-tree/neo-tree.nvim",
  required = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      window = {
        position = "right",
        width = 40,
        mappint_options = {
          noremap = true,
          nowait = true,
        },
      },
    })
  end,
}
