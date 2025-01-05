vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })

local on_attach = function(client, bufnr)
	print("LSP attached to buffer " .. bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, opts)
end

require("lspconfig").pyright.setup({
	on_attach = on_attach,
})

vim.keymap.set("n", "<leader>lr", ":LspRestart<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>li", ":LspInfo<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>lo", ":LspLog<CR>", { noremap = true, silent = true })
