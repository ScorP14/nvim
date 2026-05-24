return {
  "stevearc/conform.nvim",
  lazy = false,
  opts = {
    formatters_by_ft = {
      python     = { "ruff_organize_imports", "ruff_format" },

      jinja      = { "prettier" },
      htmldjango = { "prettier" },
      html       = { "prettier" },

      css        = { "prettier" },
      less       = { "prettier" },
      scss       = { "prettier" },

      json       = { "prettier" },
    },
    format_on_save = {
      lsp_format = "fallback",
      timeout_ms = 500,
    },
    notify_on_error = true,
  },
}
