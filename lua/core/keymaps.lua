-- leader key
vim.g.mapleader = " "
-- Delete a word backwards
vim.keymap.set("n", "dw", 'vb"_d', {
	noremap = true,
	silent = true,
	desc = "   Delete word ",
})

vim.keymap.set("n", "<A-e>", "<cmd>:Neotree toggle<CR>", {
	noremap = true,
	silent = true,
	desc = "   Toggle Neotree",
})
vim.keymap.set("n", "<leader>e", "<cmd>:Neotree toggle<CR>", {
	noremap = true,
	silent = true,
	desc = "   Toggle Neotree",
})
vim.keymap.set("n", "<A-S-e>", "<cmd>:Neotree focus filesystem<CR>", {
	noremap = true,
	silent = true,
	desc = "  Fucus Filesystem Neotree",
})
vim.keymap.set("n", "<A-S-f>", "<cmd>:Neotree focus<CR>", {
	noremap = true,
	silent = true,
	desc = "   Fucus Neotree",
})

vim.keymap.set("i", "<A-e>", "<cmd>:Neotree toggle<CR>", {
	noremap = true,
	silent = true,
	desc = "   Toggle Neotree",
})
vim.keymap.set("i", "<A-S-e>", "<cmd>:Neotree focus filesystem<CR>", {
	noremap = true,
	silent = true,
	desc = "  Fucus Filesystem Neotree",
})
vim.keymap.set("i", "<A-S-f>", "<cmd>:Neotree focus<CR>", {
	noremap = true,
	silent = true,
	desc = "   Fucus Neotree",
})

vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {
	noremap = true,
	silent = true,
	desc = "  left focus",
}) -- Фокус на левое окно
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {
	noremap = true,
	silent = true,
	desc = "  down focus",
}) -- Фокус на нижнее окно
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {
	noremap = true,
	silent = true,
	desc = "  up focus",
}) -- Фокус на верхнее окно
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {
	noremap = true,
	silent = true,
	desc = "  right focus",
}) -- Фокус на правое окно

--
vim.api.nvim_set_keymap("n", "<leader>wv", ":vsplit<CR>", {
	noremap = true,
	silent = true,
	desc = "  Vertical Split",
})

vim.api.nvim_set_keymap("n", "<leader>ws", ":split<CR>", {
	noremap = true,
	silent = true,
	desc = "  horizontal Split",
})
vim.api.nvim_set_keymap("n", "<A-s-h>", ":vertical resize -5<cr>", {
	noremap = true,
	silent = true,
	desc = " 󰶢 Left resize",
}) -- уменьшить ширину окна
vim.api.nvim_set_keymap("n", "<A-s-l>", ":vertical resize +5<cr>", {
	noremap = true,
	silent = true,
	desc = " 󰔰 Right resize ",
}) -- увеличить ширину окна
vim.api.nvim_set_keymap("n", "<A-s-k>", ":resize -5<cr>", {
	noremap = true,
	silent = true,
	desc = " 󰶣 Up resize",
}) -- уменьшить высоту окна
vim.api.nvim_set_keymap("n", "<A-s-j>", ":resize +5<cr>", {
	noremap = true,
	silent = true,
	desc = " 󰶡 Down resize",
}) -- увеличить высоту окна

-- перемещение строки вверх ввниз
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<cr>==", {
	noremap = true,
	silent = true,
	desc = " upmove",
})
vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<cr>==", {
	noremap = true,
	silent = true,
	desc = "   downmove",
})
-- перемещение строк вверх в visual mode
vim.api.nvim_set_keymap("v", "<A-k>", ":m '<-2<cr>gv=gv", {
	noremap = true,
	silent = true,
	desc = "  Upmove",
})
vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<cr>gv=gv", {
	noremap = true,
	silent = true,
	desc = "  Downmove",
})

-- перемещение строки вправо с alt + h/l
vim.api.nvim_set_keymap("n", "<A-l>", "<cmd>normal!>><cr>", {
	noremap = true,
	silent = true,
	desc = "  Move line right",
})
vim.api.nvim_set_keymap("n", "<A-h>", "<cmd>normal!<<<cr>", {
	noremap = true,
	silent = true,
	desc = "  Move line left",
})

vim.api.nvim_set_keymap("v", "<A-l>", "<cmd>normal!>gv<cr>", {
	noremap = true,
	silent = true,
	desc = "  Move line right",
})
vim.api.nvim_set_keymap("v", "<A-h>", "<cmd>normal!<gv<cr>", {
	noremap = true,
	silent = true,
	desc = "  Move line left",
})

vim.api.nvim_set_keymap("n", "<S-j>", ":BufferLineCycleNext<CR>", {
	noremap = true,
	silent = true,
	desc = " 󱚃 Buffer Left",
})
vim.api.nvim_set_keymap("n", "<S-k>", ":BufferLineCyclePrev<CR>", {
	noremap = true,
	silent = true,
	desc = " 󱚀 Buffer Right",
})

-- Terminal
vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>", {
	noremap = true,
	silent = true,
	desc = " term: Float",
})
vim.keymap.set("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>", {
	noremap = true,
	silent = true,
	desc = "  term: Horizontal",
})
vim.keymap.set("n", "<leader>tv", ":ToggleTerm direction=vertical size=40<CR>", {
	noremap = true,
	silent = true,
	desc = "  term: Vertical",
})

-- Горячая клавиша для закрытия буфера или окна: <C-w>
vim.api.nvim_set_keymap("n", "<leader>bd", ":Bdelete<CR>", {
	noremap = true,
	silent = true,
	desc = " 󰩈  Delete buffer",
})
vim.api.nvim_set_keymap("n", "<leader>bbd", ":q<CR>", {
	noremap = true,
	silent = true,
	desc = " 󰩈  Delete buffer",
})
vim.api.nvim_set_keymap("n", "<A-q>", ":close<CR>", {
	noremap = true,
	silent = true,
	desc = " 󰩈  Delete buffer",
})

-- Key mappings customization with proper descriptions and icons from Nerd Font

-- Nerd Font icon usage for better visibility and aesthetic coding experience
vim.keymap.set("n", "<A-y>", ":Yazi<CR>", {
	noremap = true,
	silent = true,
	desc = "󰍩 Yazi command",
})

-- Clear search highlight
vim.keymap.set("n", "<S-C-n>", ":nohl<CR>", {
	noremap = true,
	silent = true,
	desc = "󰜤 Clear search highlight",
})

-- Tab management
vim.keymap.set("n", "<leader>tt", ":tabnew<CR>", {
	noremap = true,
	silent = true,
	desc = " Open new tab",
})
vim.keymap.set("n", "<S-l>", ":tabNext<CR>", {
	noremap = true,
	silent = true,
	desc = " Next tab",
})
vim.keymap.set("n", "<S-h>", ":tabprevious<CR>", {
	noremap = true,
	silent = true,
	desc = " Previous tab",
})
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", {
	noremap = true,
	silent = true,
	desc = " Close tab",
})

-- Select all text
vim.keymap.set("n", "<C-a>", "ggVG", {
	noremap = true,
	silent = true,
	desc = " Select all in normal mode",
})
vim.keymap.set("n", "<C-q>", "GVgg", {
	noremap = true,
	silent = true,
	desc = "󰎓 Inverse select all in normal mode",
})
vim.keymap.set("i", "<C-q>", "<Esc>GVggi", {
	noremap = true,
	silent = true,
	desc = "󰎓 Inverse select all in insert mode",
})
vim.keymap.set("i", "<C-a>", "<Esc>ggVGi", {
	noremap = true,
	silent = true,
	desc = " Select all in insert mode",
})

-- Delete backward word
vim.keymap.set("i", "<C-BS>", "<Esc>vbdi", {
	noremap = true,
	silent = true,
	desc = "󰂄 Delete word backwards",
})

-- Delete forward word
vim.keymap.set("i", "<C-Del>", "<Esc>vedi", {
	noremap = true,
	silent = true,
	desc = "󰂅 Delete word forwards",
})

-- Replace `x` functionality
vim.keymap.set("n", "x", "d", {
	noremap = true,
	silent = true,
	desc = "󰄌 Replace x with d",
})
vim.keymap.set("v", "x", "d", {
	noremap = true,
	silent = true,
	desc = "󰄌 Replace x with d in visual mode",
})

-- Replace `xx` functionality
vim.keymap.set("n", "xx", "dd", {
	noremap = true,
	silent = true,
	desc = "󰄍 Replace xx with dd",
})

-- Tab terminal creation
vim.keymap.set("n", "<leader>tT", ":tabnew | terminal<CR>", {
	noremap = true,
	silent = true,
	desc = " Open new tab with terminal",
})
vim.keymap.set("n", "<leader>T", ":term<CR>", {
	noremap = true,
	silent = true,
	desc = " Open terminal",
})

-- Reload NVIM configuration
vim.keymap.set("n", "<C-S-r>", ":so $MYVIMRC<CR>", {
	noremap = true,
	silent = true,
	desc = "󰑓 Reload NVIM configuration",
})

-- System command mappings commented to show possible integration
-- Example for copy-paste between system clipboard
--[[
vim.keymap.set("n", "<C-c>", '"+y', {
    noremap = true,
    silent = true,
    desc = "󰄎 Copy to clipboard",
})
vim.keymap.set("n", "<C-v>", '"+p', {
    noremap = true,
    silent = true,
    desc = "󰄏 Paste from clipboard",
})
]]
--

-- Custom commands for quick access to init.lua
vim.keymap.set("n", "<leader>oc", function()
	vim.cmd("edit ~/.config/nvim/init.lua")
end, {
	noremap = true,
	silent = true,
	desc = " Open init.lua for editing",
})

--commands
vim.cmd([[
    cnoremap <C-j> <C-n>
    cnoremap <C-k> <C-p>
]])

-- Безопасное удаление привязок
pcall(vim.keymap.del, "n", "<CR>")
pcall(vim.keymap.del, "i", "<CR>")
pcall(vim.keymap.del, "c", "<CR>")

-- Восстановление стандартного поведения
vim.keymap.set("n", "<CR>", "o<Esc>", { noremap = true, silent = true }) -- Normal mode
vim.keymap.set("i", "<CR>", "<CR>", { noremap = true, silent = true }) -- Insert mode
vim.keymap.set("c", "<CR>", "<CR>", { noremap = true, silent = true }) -- Command mode
