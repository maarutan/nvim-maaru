require("possession").setup({
	commands = {
		save = "SSave", -- Команда для сохранения сессии
		load = "SLoad", -- Команда для загрузки сессии
		delete = "SDelete", -- Команда для удаления сессии
		list = "SList", -- Команда для отображения списка сессий
		save_cwd = "SSaveCwd", -- Команда для сохранения сессии текущего каталога
		load_cwd = "SLoadCwd", -- Команда для загрузки сессии текущего каталога
	},
	hooks = {
		before_save = function(name)
			vim.notify("Saving session: " .. name, vim.log.levels.WARN) -- Уведомление перед сохранением
		end,
	},
	session_dir = vim.fn.stdpath("data") .. "/possession", -- Директория для хранения сессий
	silent = false, -- Показывать вывод при работе
	load_silent = false, -- Показывать вывод при загрузке
	autosave = {
		current = true, -- Автосохранение текущей сессии
		on_load = true, -- Автосохранение при загрузке новой сессии
		on_quit = true, -- Автосохранение при выходе из Neovim
	},
})

-- Настройка горячих клавиш
vim.keymap.set("n", "<leader>ss", ":SSave<CR>", { desc = "Save Possession Session" })
vim.keymap.set("n", "<leader>sl", ":SLoad<CR>", { desc = "Load Possession Session" })
vim.keymap.set("n", "<leader>sd", ":SDelete<CR>", { desc = "Delete Possession Session" })
vim.keymap.set("n", "<leader>sS", ":SSaveCwd<CR>", { desc = "Save CWD Session" })
vim.keymap.set("n", "<leader>sL", ":SLoadCwd<CR>", { desc = "Load CWD Session" })
