--   TODO: Refactoring snippets

--   " For vsnip users.
--   Plug 'hrsh7th/cmp-vsnip'
--   Plug 'hrsh7th/vim-vsnip'
--
--   " For luasnip users.
--   " Plug 'L3MON4D3/LuaSnip'
--   " Plug 'saadparwaiz1/cmp_luasnip'
--
--   " For mini.snippets users.
--   " Plug 'echasnovski/mini.snippets'
--   " Plug 'abeldekat/cmp-mini-snippets'
--
--   " For snippy users.
--   " Plug 'dcampos/nvim-snippy'
--   " Plug 'dcampos/cmp-snippy'
--
--   " For ultisnips users.
--   " Plug 'SirVer/ultisnips'
--   " Plug 'quangnguyen30192/cmp-nvim-ultisnips'

return {
  {
    'hrsh7th/nvim-cmp',
    event = "VeryLazy",
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',

      'L3MON4D3/LuaSnip',

      "rafamadriz/friendly-snippets",
      'saadparwaiz1/cmp_luasnip',

      "onsails/lspkind.nvim",

    },
    config = function()
      local cmp = require('cmp')
      local lspkind = require('lspkind')
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        completion = {
          keyword_length = 1,
          completeopt = "menu,noselect", -- menuone
          -- completeopt = "menu",
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp', max_item_count = 10 },
          { name = 'buffer',   max_item_count = 5, keyword_length = 2 },
          { name = "path",     max_item_count = 3, keyword_length = 2 },
          { name = 'luasnip',  max_item_count = 10 },
          { name = "nvim_lua", max_item_count = 5 },
          { name = "cmdline",  max_item_count = 3 },
        }),
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            menu = ({
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              luasnip = "[LuaSnip]",
              nvim_lua = "[Lua]",
              path = "[Path]",
              latex_symbols = "[Latex]",
            })
          }),
        },
      })
    end,
  },
}
