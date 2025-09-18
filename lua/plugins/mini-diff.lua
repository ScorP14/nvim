return {
  "echasnovski/mini.diff",
  version = "*",
  lazy = false,
  opts = {
    view = {
      diff_preview = false,
      hl_lines = false,
      status_indicator = false,
    },
    options = {
      use_single_sign_column = true,
    },
    colors = {
      added = "#50fa7b", -- Зеленый
      changed = "#f1fa8c", -- Желтый
      removed = "#ff5555", -- Красный
    },
    mappings = {
      apply = "",
      reset = "",
      diff = "",
      change_view = "",
      goto_first = "",
      goto_prev = "",
      goto_next = "",
      goto_last = "",
    },
  },
}
