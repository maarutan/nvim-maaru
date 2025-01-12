local function enable_minimap()
	vim.cmd("Minimap")
end

local function disable_minimap()
	vim.cmd("MinimapClose")
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "dashboard", "NvimTree", "alpha" },
	callback = function()
		disable_minimap()
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		local filetype = vim.bo.filetype
		if filetype ~= "dashboard" and filetype ~= "NvimTree" and filetype ~= "alpha" then
			enable_minimap()
		end
	end,
})
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("n", "<Leader>mm", ":MinimapToggle<CR>", opts)
keymap("n", "<Leader>mc", ":MinimapClose<CR>", opts)
keymap("n", "<Leader>mr", ":MinimapRefresh<CR>", opts)
keymap("n", "<Leader>ms", ":MinimapRescan<CR>", opts)
keymap("n", "<Leader>mu", ":MinimapUpdateHighlight<CR>", opts)
