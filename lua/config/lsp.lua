vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function()
    require("config.keymaps").for_lsp()
  end,
})

local capabilities = {
  textDocument = {
    foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    },
  },
}

-- Подсветка ошибок Lsp в линию
vim.diagnostic.config({
  virtual_text = {
    source = "if_meny",
    -- TODO: Установить иконку для prefix
    prefix = "*",
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  virtual_lines = false,
  -- signs = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
  },
  float = {
    source = true,
    header = "Diagnostics:",
    prefix = " ",
    border = "single",
    max_height = 10,
    max_width = 130,
    close_events = { "CursorMoved" },
    focusable = true,
  },
})

vim.lsp.set_log_level("error")

vim.lsp.config("*", {
  capabilities = require('blink.cmp').get_lsp_capabilities(capabilities),
  -- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities),
  root_markers = { ".git" },
})

vim.lsp.enable({
  "lua-language-server",
  "basedpyright",
  -- "ty",
  "ruff",
})
