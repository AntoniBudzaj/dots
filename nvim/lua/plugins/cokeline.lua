vim.pack.add({
	{ src = "https://github.com/willothy/nvim-cokeline" },
})

local colors = require("tokyonight.colors.night")

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		vim.api.nvim_set_hl(0, "TabLineFill", {
			bg = colors.bg,
		})
	end,
})

require("cokeline").setup({
	buffers = {
		focus_on_delete = "prev",
	},

	default_hl = {
		bg = function(buffer)
			return buffer.is_focused and colors.blue -- focused buffer
				or colors.bg -- unfocused buffer
		end,

		fg = function(buffer)
			return buffer.is_focused and colors.fg_gutter -- focused buffer
				or colors.fg-- unfocused buffer
		end,
	},

	fill_hl = "TabLineFill",
})
