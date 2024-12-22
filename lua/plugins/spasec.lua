require("specs").setup({
	show_jumps = true,
	min_jump = 10,
	popup = {
		delay_ms = 0, -- Задержка отображения (в миллисекундах)
		inc_ms = 10, -- Скорость затухания
		blend = 30, -- Прозрачность
		width = 10,
		winhl = "PMenu",
		fader = require("specs").pulse_fader,
		resizer = require("specs").shrink_resizer,
	},
	ignore_filetypes = {},
	ignore_buftypes = { nofile = true },
})
