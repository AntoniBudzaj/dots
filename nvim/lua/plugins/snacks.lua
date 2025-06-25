return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = false },
		dashboard = require("plugins.snacks.dashboard"),
		indent = { enabled = true },
		input = { enabled = true },
		picker = require("plugins.snacks.picker"),
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scroll = require("plugins.snacks.scroll"),
		statuscolumn = { enabled = true },
		words = { enabled = true },
		terminal = { enabled = true },
		image = { enabled = true },
		lazygit = require("plugins.snacks.lazygit"),
	},
	keys = {
		{
			"<C-w>",
			function()
				Snacks.bufdelete()
			end,
			desc = "Delete Buffer",
		},
	},
}
