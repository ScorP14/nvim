return {
  "mason-org/mason.nvim",
  lazy = false,
  dependencies = {
    { "mason-org/mason-lspconfig.nvim" },
  },
  opts = {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  },
}
