local M = {}
-- Function to create a new buffer
function M.create_new_buffer()
	local new_name = vim.fn.input("New file name: ", "")
	if new_name == "" then
		vim.notify("creation canceled.", vim.log.levels.WARN, {
			icon = "ℹ️",
			title = "NewBuffer",
		})
		return
	end

	if vim.fn.filereadable(new_name) == 1 then
		vim.notify("Error: File exists.", vim.log.levels.ERROR, {
			icon = "🚨",
			title = "NewBuffer",
		})
		return
	end

	local ok, err = pcall(function()
		vim.cmd("edit " .. new_name)
		vim.cmd("setlocal buftype=")
	end)

	if not ok then
		vim.notify("Error creating: " .. err, vim.log.levels.ERROR, {
			icon = "🚨",
			title = "NewBuffer",
		})
		return
	end

	vim.notify("New buffer created: " .. new_name, vim.log.levels.WARN, {
		icon = "😄",
		title = "NewBuffer",
	})
end

local function default_header()
	return {
		"",
		"",
		"",
		"",
	}
end

require("dashboard").setup({
	theme = "doom",
	config = {
		header = default_header(),
		center = {
			{
				icon = "󰉖    ",
				icon_hl = "Title",
				desc = "Open Directory",
				desc_hl = "String",
				key = "d",
				keymap = "              SPC w d",
				key_hl = "Number",
				action = function()
					require("telescope").extensions.file_browser.file_browser({
						prompt_title = "Select Directory",
						cwd = "~", -- Initial directory
						attach_mappings = function(_, map)
							local actions = require("telescope.actions")
							map("i", "<CR>", function(prompt_bufnr)
								local selected_path = require("telescope.actions.state").get_selected_entry().path
								actions.close(prompt_bufnr)
								vim.cmd("cd " .. selected_path)
								vim.cmd("edit .")
							end)
							return true
						end,
					})
				end,
			},

			{
				icon = "󰈞    ",
				icon_hl = "Title",
				desc = "Find and open file",
				desc_hl = "String",
				key = "f",
				keymap = "SPC f f",
				key_hl = "Number",
				action = function()
					require("telescope.builtin").find_files({
						find_command = { "fd", "--type", "f" },
						attach_mappings = function(_, map)
							local actions = require("telescope.actions")
							local action_state = require("telescope.actions.state")

							map("i", "<CR>", function(prompt_bufnr)
								local selected_entry = action_state.get_selected_entry()

								if not selected_entry then
									print("No file selected!")
									return
								end

								local filepath = selected_entry.path
								local file_dir = vim.fn.fnamemodify(filepath, ":p:h") -- Get the file directory

								actions.close(prompt_bufnr)

								-- Change the current directory to the file's directory
								vim.cmd("cd " .. file_dir)

								-- Open the file
								vim.cmd("edit " .. vim.fn.fnameescape(filepath))
							end)
							return true
						end,
					})
				end,
			},

			{
				icon = "    ",
				icon_hl = "Title",
				desc = "Git Branches",
				desc_hl = "String",
				key = "b",
				keymap = "              SPC g b",
				key_hl = "Number",
				action = function()
					if vim.fn.isdirectory(".git") == 1 then
						require("telescope.builtin").git_branches()
					else
						vim.notify("No Git repository found.", vim.log.levels.WARN, {
							title = "Git",
							icon = "󰊢",
						})
					end
				end,
			},
			{
				icon = "    ",
				icon_hl = "Title",
				desc = "Recent files",
				desc_hl = "String",
				key = "r",
				keymap = "              SPC f r",
				key_hl = "Number",
				action = function()
					local action_state = require("telescope.actions.state")
					local telescope = require("telescope.builtin")

					telescope.oldfiles({
						attach_mappings = function(prompt_bufnr, map)
							local function open_and_change_dir()
								local selection = action_state.get_selected_entry()
								if not selection then
									print("[Telescope] No selection")
									return
								end
								-- Извлекаем путь к выбранному файлу
								local filepath = selection.path or selection.filename
								if filepath then
									-- Меняем рабочую директорию
									local dir = vim.fn.fnamemodify(filepath, ":h")
									vim.cmd("cd " .. dir)
									-- Принудительно открываем файл
									vim.cmd("e! " .. filepath)
								end
								-- Используем команду Bdelete для закрытия буфера
								vim.cmd("Bdelete " .. prompt_bufnr)
							end

							-- Привязываем действие к Enter
							map("i", "<CR>", open_and_change_dir)
							map("n", "<CR>", open_and_change_dir)
							return true
						end,
					})
				end,
			},
			{
				icon = "    ",
				icon_hl = "Title",
				desc = "New file",
				desc_hl = "String",
				key = "n",
				keymap = "            SPC b n",
				key_hl = "Number",
				action = M.create_new_buffer,
			},

			{
				icon = "    ",
				icon_hl = "Title",
				desc = "Open Neovim Config",
				desc_hl = "String",
				key = "o",
				keymap = "              SPC o c",
				key_hl = "Number",
				action = ":cd ~/.config/nvim | edit init.lua",
			},
			-- Quit Button [q]
			{
				desc = "                    󰩈 Quit [q]", -- Centered text
				desc_hl = "String",
				key = "q",
				keymap = "            SPC q _",
				key_hl = "Number",
				action = ":qa", -- Quit Neovim command
			},
		},
		-- Footer animation
		footer = function()
			local pacman = require("pacman").get_pacman_text()
			local space = " "
			local text = "Welcome to neovim 🚀 "
			return { space, space, text }
		end,
	},
})
return M
