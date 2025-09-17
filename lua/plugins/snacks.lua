return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    dashboard = {
      preset = {
        header = [[
╔═══╗           ╔═══╗ ╔╗ ╔╗ ╔╗
║╔═╗║           ║╔═╗║╔╝║ ║║ ║║
║╚══╗╔══╗╔══╗╔═╗║╚═╝║╚╗║ ║╚═╝║
╚══╗║║╔═╝║╔╗║║╔╝║╔══╝ ║║ ╚══╗║
║╚═╝║║╚═╗║╚╝║║║ ║║   ╔╝╚╗   ║║
╚═══╝╚══╝╚══╝╚╝ ╚╝   ╚══╝   ╚╝
      ]],
      },
    },                              -- ok
    scroll = { enabled = true },    -- OK

    bufdelete = { enabled = true }, -- Надо продумать хот-кей Snacks.bufdelete()
    -- debug = { enabled = true },
    -- git = { enabled = true },
    -- lazygit = { enabled = true },
    -- gitbrowse = { enabled = true },
    -- image = { enabled = false },
    picker = { enabled = true },
    notify = { -- OK +-
      enabled = true,
      timeout = 3000,
    },
    notifier = {
      -- Уведомления +- Ок, Надо добавить хот-кей для Истории Snacks.notifier.show_history()
      enabled = true
    },
    -- toggle = { enabled = true }, -- Вкл/Выкл функций(можно вкл\откл lsp)
    -- explorer = {
    --   -- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md#explorer
    --   layout = { position = "right" },
    -- },
    indent = {
      -- Не понятно, надо или нет
      enabled = false,
      -- char = "-",
    },
    input = {
      enabled = true,
    },
  },
}
