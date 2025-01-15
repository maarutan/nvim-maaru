require("code-runner").setup({
	-- keymap = "<A-S-r>",
	interrupt_keymap = "<F2>",
	terminal_mode = "float", -- Default terminal mode
	commands = {
		python = "python3 -u $dir/$fileName",
		lua = "lua $dir/$fileName",
	},
	extensions = {
		python = { "py" },
		lua = { "lua" },
	},
	debug = false, -- Debug mode flag
})
