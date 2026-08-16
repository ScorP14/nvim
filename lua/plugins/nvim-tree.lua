return {
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>e", '<cmd>NvimTreeFocus<cr>', { desc = "Открыть/Закрыть/Выбрать NvimTree" } },
      { "<Left>", function() require("nvim-tree.api").node.navigate.parent_close() end, { desc = "Close Folder" } },
      { "h", function() require("nvim-tree.api").node.navigate.parent_close() end, { desc = "Close Folder" } },
      { "<Right>", function() require("nvim-tree.api").node.open.edit() end, { desc = "Open Folder or File" } },
      { "l", function() require("nvim-tree.api").node.open.edit() end, { desc = "Open Folder or File" } },
    },
    opts = {
      filters = {
        dotfiles = false,
        custom = {
          "__pycache__",
        },
      },
      disable_netrw = true,
      hijack_cursor = true,
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      view = {
        side = "right",
        width = 30,
        preserve_window_proportions = true,
      },
      renderer = {
        root_folder_label = false,
        highlight_git = true,
        indent_markers = { enable = true },
        icons = {
          glyphs = {
            default = "󰈚",
            folder = {
              default = "",
              empty = "",
              empty_open = "",
              open = "",
              symlink = "",
            },
            git = { unmerged = "", },
          },
        },
      },
    },
  },
}
