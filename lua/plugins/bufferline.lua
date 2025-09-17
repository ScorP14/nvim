return {
	"akinsho/bufferline.nvim",
	version = "*",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			-- mode = "buffer", -- buffer, tabs
			-- diagnostics = "nvim_lsp",
			numbers = "none",
			close_command = "bdelete! %d",
			right_mouse_command = nil,
			left_mouse_command = "buffer %d",
			middle_mouse_command = nil,
			indicator = {
				icon = "▎", -- this should be omitted if indicator style is not 'icon'
				style = "icon",
			},
			buffer_close_icon = "",
			modified_icon = "●",
			close_icon = "",
			left_trunc_marker = "",
			right_trunc_marker = "",
			max_name_length = 18,
			max_prefix_length = 15,
			tab_size = 10,
			diagnostics = false,
			show_buffer_icons = false,
			show_buffer_close_icons = true,
			show_close_icon = true,
			show_tab_indicators = true,
			persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
			separator_style = "bar",
			enforce_regular_tabs = false,
			always_show_bufferline = true,
			sort_by = "id",
		},
	},
}
