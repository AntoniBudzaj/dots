return {
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "svelte", "html", "css", "javascript", "typescript" },
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				autotag = { enable = true },
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"luckasRanarison/tailwind-tools.nvim",
		name = "tailwind-tools",
		build = ":UpdateRemotePlugins",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim", -- optional
			"neovim/nvim-lspconfig", -- optional
		},
		opts = {}, -- your configuration
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
			ensure_installed = {
				"ts_ls",
				"html",
				"lua_ls",
				"clangd",
				"gopls",
				"tailwindcss",
				"cssls",
				"pyright",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function() end,
	},
}
