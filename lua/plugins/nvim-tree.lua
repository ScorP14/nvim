return {
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
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
            git = { unmerged = "" },
          },
        },
      },
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        local function opts(desc)
          return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
          }
        end
        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set("n", "<Left>", api.node.navigate.parent_close, opts("Close Folder"))
        vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Folder"))
        vim.keymap.set("n", "<Right>", api.node.open.edit, opts("Open Folder or File"))
        vim.keymap.set("n", "l", api.node.open.edit, opts("Open Folder or File"))
      end,
    },
  },
}
