vim.pack.add({
	{ src = "https://github.com/folke/snacks.nvim" },
})

require("snacks").setup({
	---@type snacks.Config
	explorer = { enabled = true },
	picker = require("plugins.snacks.picker"),
	lazygit = { enabled = true },
	notifier = { enabled = true },
	scroll = { enabled = true },
})
