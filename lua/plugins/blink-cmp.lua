return {
  'saghen/blink.cmp',
  lazy = false,
  dependencies = {
    'rafamadriz/friendly-snippets',
  },
  version = '1.*',

  opts = {
    appearance = {
      nerd_font_variant = 'mono'
    },
    keymap = {
      preset = 'enter',
      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
    },
    completion = {
      accept = { auto_brackets = { enabled = true }, }, -- Авто ()
      trigger = { show_on_trigger_character = true },
      keyword = { range = 'full' },
      menu = {
        border = 'single',
        draw = { treesitter = { "lsp" } },
      },
      ghost_text = {
        enabled = true,
        show_with_menu = false,
      },
      documentation = {
        window = { border = 'single' },
        auto_show = true,
        auto_show_delay_ms = 500
      },
    },
    sources = {
      default = { 'lsp', 'path', 'buffer', 'snippets' },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  -- opts_extend = { "sources.default" }
}
