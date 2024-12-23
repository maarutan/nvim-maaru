local M = {}

-- Настройки по умолчанию
local options = {
	paragraph_length = 50, -- Количество слов в одном параграфе
	complete_mappings = { "<Tab>", "<CR>" }, -- Клавиши для автозаполнения
	lorem_text = [[
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque tempus vel nisl eget facilisis. Phasellus consectetur bibendum nulla. Vivamus euismod id orci dictum facilisis. Ut eget nisi at orci rhoncus mollis. Aenean pulvinar massa a luctus molestie. Donec tortor libero, pharetra ut urna sit amet, iaculis dignissim sem. Duis id elit id dolor volutpat vulputate.
]],
	default_lorem_length = 5, -- Длина текста для lorem по умолчанию
}

-- Генерация Lorem Ipsum текста
local function generate_lorem(length)
	local lorem_words = {}
	for word in options.lorem_text:gmatch("%S+") do
		table.insert(lorem_words, word)
	end

	local result = {}
	for i = 1, length do
		table.insert(result, lorem_words[(i - 1) % #lorem_words + 1])
	end
	return table.concat(result, " ")
end

-- Генерация параграфов Lorem Ipsum
local function generate_paragraphs(count, length)
	local paragraphs = {}
	for _ = 1, count do
		table.insert(paragraphs, generate_lorem(length))
	end
	return paragraphs -- возвращаем массив параграфов
end

-- Основное действие при вводе lorem или plorem
local function on_keyword_action()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0)) -- текущая позиция курсора
	local line = vim.api.nvim_get_current_line()

	-- Обработка "ploremX"
	local keyword, count = line:match("(plorem)(%d*)$")

	if keyword then
		count = tonumber(count) or 1 -- Если число не указано, используем 1 параграф
		local paragraphs = generate_paragraphs(count, options.paragraph_length)

		-- Удаляем текущую строку с ключевым словом
		vim.api.nvim_buf_set_lines(0, row - 1, row, false, {})

		-- Вставляем текст параграфов построчно
		local new_lines = {}
		for _, paragraph in ipairs(paragraphs) do
			table.insert(new_lines, paragraph)
			table.insert(new_lines, "") -- Пустая строка между параграфами
		end

		-- Убираем последнюю пустую строку (если не нужна)
		if #new_lines > 0 and new_lines[#new_lines] == "" then
			table.remove(new_lines)
		end

		-- Добавляем все параграфы в буфер
		vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, new_lines)
		return
	end

	-- Обработка "loremX"
	keyword, count = line:match("(lorem)(%d*)$")
	if keyword then
		count = tonumber(count) or options.default_lorem_length -- Если длина не указана, используем длину по умолчанию
		local result = generate_lorem(count)
		-- Заменяем "loremX" на текст
		local new_line = line:gsub("lorem%d*", result)
		vim.api.nvim_buf_set_lines(0, row - 1, row, false, { new_line })
		vim.api.nvim_win_set_cursor(0, { row, #new_line }) -- перемещаем курсор в конец строки
	end
end

-- Настройка клавиш
local function setup_mappings()
	local function map_complete(keys)
		for _, key in ipairs(keys) do
			vim.keymap.set("i", key, function()
				local line = vim.api.nvim_get_current_line()
				if line:match("plorem%d*$") or line:match("lorem%d*$") then
					on_keyword_action()
				else
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n", true)
				end
			end, { buffer = true })
		end
	end

	map_complete(options.complete_mappings)
end

function M.setup(user_options)
	options = vim.tbl_extend("force", options, user_options or {})
	vim.api.nvim_create_autocmd("BufEnter", {
		callback = function()
			setup_mappings()
		end,
	})
end

-- Позволяет пользователю задавать длину параграфа
function M.set_paragraph_length(length)
	options.paragraph_length = tonumber(length) or options.paragraph_length
end

-- Позволяет задать произвольный текст Lorem Ipsum
function M.set_lorem_text(text)
	options.lorem_text = text or options.lorem_text
end

return M
