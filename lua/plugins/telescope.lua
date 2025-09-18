return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<S-Up>"] = "preview_scrolling_up",
            ["<S-Left>"] = "preview_scrolling_left",
            ["<S-Right>"] = "preview_scrolling_right",
            ["<S-Down>"] = "preview_scrolling_down",
          },
          n = {
            ["D"] = "delete_buffer",
          },
        },
      },
    },
  },
}
