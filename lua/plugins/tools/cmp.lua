local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- Use LuaSnip for snippets
		end,
	},

	mapping = {
		-- C-Space: Open or close autocomplete menu
		["<C-Space>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.close() -- Close the autocomplete menu
			else
				cmp.complete() -- Open the autocomplete menu
			end
		end, { "i", "c" }),

		-- C-e: Close autocomplete menu
		["<C-e>"] = cmp.mapping.close(),

		-- Tab / Shift-Tab: Navigate in the autocomplete menu or move through snippets
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.confirm({ select = false }) -- Confirm the selected item manually
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump() -- Expand snippet or jump forward
			else
				fallback() -- Default behavior
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1) -- Jump backward in snippet
			else
				fallback() -- Default behavior
			end
		end, { "i", "s" }),

		-- C-j / C-k: Navigate through autocomplete suggestions
		["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),

		-- Confirm: Enter, C-l, or C-Return
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-l>"] = cmp.mapping.confirm({ select = true }),
		["<C-Return>"] = cmp.mapping.confirm({ select = true }),

		-- Scroll through documentation
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
	},

	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- Source: LSP server
		{ name = "luasnip" }, -- Source: Snippets
		{ name = "buffer" }, -- Source: Current buffer text
		{ name = "path" }, -- Source: File paths
	}),

	window = {
		-- UI settings for the autocomplete menu
		completion = {
			border = "rounded", -- Rounded borders
			winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
			col_offset = 4, -- Offset to prevent overlapping with the cursor
		},
		-- UI settings for the documentation popup
		documentation = {
			border = "rounded", -- Rounded borders
			winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
		},
	},

	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text", -- Show both symbol and text
			maxwidth = 50, -- Max width of text in the menu
			ellipsis_char = "...", -- Add ellipsis if text is too long
			menu = {
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[Snippet]",
				path = "[Path]",
			},
		}),
	},

	experimental = {
		ghost_text = false, -- Disable ghost text under the cursor
	},
})
