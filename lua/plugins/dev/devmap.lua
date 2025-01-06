local keymap = vim.keymap.set

local on_attach = function(client, bufnr)
	print("LSP attached to buffer " .. bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	keymap("n", "<leader>lD", vim.lsp.buf.declaration, opts)
	keymap("n", "<leader>ld", vim.lsp.buf.definition, opts)
	-- vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, opts)
end

require("lspconfig").pyright.setup({
	on_attach = on_attach,
})

keymap("n", "<leader>lr", ":LspRestart<CR>", { noremap = true, silent = true })
keymap("n", "<leader>li", ":LspInfo<CR>", { noremap = true, silent = true })
keymap("n", "<leader>lo", ":LspLog<CR>", { noremap = true, silent = true })
keymap("n", "<leader>lh", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
keymap("n", "<leader>dl", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
keymap("n", "<leader>lf", "<cmd>Lspsaga finder<CR>", { silent = true })
keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
-- keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true })
keymap("n", "<leader>ds", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
