return {
  'stevearc/conform.nvim',
  lazy = false,
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_organize_imports", "ruff_format" },
    },
    format_on_save = {
      lsp_format = "fallback",
      timeout_ms = 500,
    },
    notify_on_error = true,
  },
}
