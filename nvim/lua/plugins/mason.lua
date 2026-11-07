vim.pack.add({
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
})

require("mason").setup({
	registries = {
		"github:mason-org/mason-registry",
		"github:Crashdummyy/mason-registry",
	},
})

require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "vtsls", "vue_ls", "html", "cssls", "svelte", "gopls", "jsonls" },
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
	-- roslyn_ls (lspconfig) is excluded: C# is handled by seblyng/roslyn.nvim
	automatic_enable = { exclude = { "roslyn_ls" } },
})
