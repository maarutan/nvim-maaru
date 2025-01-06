require("neoscroll").setup({
	mappings = { -- Клавиши для анимации прокрутки
		"<C-u>",
		"<C-d>",
	},
	hide_cursor = true, -- Скрывать курсор во время прокрутки
	stop_eof = true, -- Остановка на <EOF> при прокрутке вниз
	respect_scrolloff = true, -- Учитывать 'scrolloff' при прокрутке
	cursor_scrolls_alone = true, -- Курсор продолжает двигаться, даже если окно не может прокручиваться дальше
	duration_multiplier = 1.0, -- Глобальный множитель длительности
	easing_function = function(x)
		return x ^ 50 * (x * (10 * x - 15) + 50) -- Пользовательская функция кривой Безье
	end, -- Обратите внимание на запятую здесь
	pre_hook = nil, -- Функция, выполняемая перед началом анимации прокрутки
	post_hook = nil, -- Функция, выполняемая после завершения анимации прокрутки
	performance_mode = false, -- Отключить "Режим производительности" для всех буферов
	ignored_events = { -- События, игнорируемые во время прокрутки
		"WinScrolled",
		"CursorMoved",
	},
})