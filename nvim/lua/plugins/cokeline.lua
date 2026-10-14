vim.pack.add({
	{ src = "https://github.com/willothy/nvim-cokeline" },
})

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		vim.api.nvim_set_hl(0, "TabLineFill", {
			bg = "#191B29",
		})
	end,
})

require("cokeline").setup({
	buffers = {
		focus_on_delete = "prev",
	},

	default_hl = {
		bg = function(buffer)
			return buffer.is_focused and "#2f334d" -- focused buffer
				or "#191B29" -- unfocused buffer
		end,
	},

	fill_hl = "TabLineFill",
})
