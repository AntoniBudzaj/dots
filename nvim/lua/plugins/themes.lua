vim.pack.add({
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/rebelot/kanagawa.nvim",
})

require("tokyonight").setup({
	plugins = {
		bufferline = true,
	},
})
require("kanagawa").setup({})
