return {
  "mason-org/mason.nvim",
  lazy = false,
  --  "basedpyright",
  --  "ruff",
  --  "prettier",
  --  "typescript-language-server",
  --  "lua-language-server"
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
