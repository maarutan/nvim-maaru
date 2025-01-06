require("lspsaga").setup({
	ui = {
		border = "rounded",
		title = true,
	},
	symbol_in_winbar = {
		enable = true,
		separator = "  ",
		hide_keyword = true,
		show_file = false,
		folder_level = 2,
	},
	lightbulb = {
		enable = true,
		sign = true,
		virtual_text = true,
	},
	finder = {
		max_height = 0.5,
		min_width = 30,
	},
})
