require("buffresize").setup({
	enabled = true, -- If false, the plugin is disabled
	notify = true, -- If false, notifications are disabled
	keymaps = {
		toggle_resize = "<leader>rw",
		toggle_plugin = "<leader>re",
		vertical_split = "<leader>wv",
		horizontal_split = "<leader>wh",
	},
	notification_icon = "\u{2f56}", -- Icon for notifications
	min_width = 25, -- Minimum width for collapsing (% of the window width)
	max_width = 70, -- Maximum width for expanding (% of the window width)
	start_width = 50, -- Initial width when creating a split (% of the window width)
})

-- vim.api.nvim_set_keymap("n", "<leader>wv", ":vsplit<CR>", {
-- 	noremap = true,
-- 	silent = true,
-- 	desc = "  Vertical Split",
-- })
--
-- vim.api.nvim_set_keymap("n", "<leader>ws", ":split<CR>", {
-- 	noremap = true,
-- 	silent = true,
-- 	desc = "  horizontal Split",
-- })
