return {
  "stevearc/conform.nvim",
  lazy = false,
  opts = {
    formatters = {
      djlint = { append_args = { "--indent", "2" } },
      prettier = { append_args = { "--print-width", "120" } },
    },
    formatters_by_ft = {
      python     = { "ruff_organize_imports", "ruff_format" },

      jinja      = { "djlint" },
      htmldjango = { "djlint" },
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
