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
    }
  }
}
vim.lsp.config("*", {
  -- capabilities = require('blink.cmp').get_lsp_capabilities(capabilities),
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities),
  root_markers = { ".git" }
})

vim.lsp.enable({
  "lua-language-server",
  "basedpyright",
  "ruff",
})
