return {
  {
    'catppuccin/nvim',
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "macchiato", -- "latte", "frappe", "macchiato", "mocha"
      background = {         -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false, -- Отключить прозрачный фон
      show_end_of_buffer = false,     -- Показывать символы в конце буфера
      term_colors = false,            -- Установить цвета терминала
      dim_inactive = {
        enabled = false,              -- затемнение неактивных окон
        shade = "dark",
        percentage = 0.15,            -- процент затемнения
      },
      no_italic = false,              -- Принудительно отключить курсив
      no_bold = false,                -- Принудительно отключить жирный шрифт
      no_underline = false,           -- Принудительно отключить подчеркивание
      styles = {                      -- Стили для различных синтаксических элементов
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = { "bold" },
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},
      custom_highlights = {},
      default_integrations = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = true,
        mini = {
          enabled = true,
          indentscope_color = "", -- имя цвета для indentscope
        },
        -- Для полного списка интеграций смотрите :h catppuccin-integrations
      },
    }
  }
}
