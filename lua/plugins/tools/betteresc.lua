require("better_escape").setup({
	timeout = 200,
	mappings = {
		i = {
			j = {
				k = function()
					-- Escape insert mode when jk is pressed
					if vim.bo.filetype == "toggleterm" then
						-- Type 'jk' normally when inside filetype 'Yourfiletype'
						-- <c-v> is used to avoid mappings
						return "<c-v>j<c-v>k"
					end
					return "<esc>"
				end,
			},
		},
	},
})

-- vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
