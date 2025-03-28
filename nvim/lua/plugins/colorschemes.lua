return {
	--tokyonight
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("tokyonight").setup({
				transparent = true,
			})
		end,
	},
	--monochrome
	{
		"jesseleite/nvim-noirbuddy",
		dependencies = {
			{ "tjdevries/colorbuddy.nvim" },
		},
		lazy = false,
		priority = 1000,
		opts = {
			-- All of your `setup(opts)` will go here
		},
		config = function()
			require("noirbuddy").setup({
				preset = "miami-nights",
			})
		end,
	},
	--synthwave
	{
		"maxmx03/fluoromachine.nvim",
		config = function()
			local fm = require("fluoromachine")

			fm.setup({
				brightness = 0.5,
				glow = false,
				theme = "retrowave",
				transparent = true,
			})
		end,
	},
	--gruvbox
	{
		"morhetz/gruvbox",
		config = function() end,
	},
	--rose-pine
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "moon",
			})
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavor = "frappe",
				transparent_background = true,
			})
		end,
	},
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = false,
		},
	},
	{
		"andrew-george/telescope-themes",
		config = function()
			require("telescope").load_extension("themes")
		end,
	},
}
