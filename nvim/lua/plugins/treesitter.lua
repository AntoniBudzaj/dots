vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

local langs = { "javascript", "html", "typescript", "vue", "svelte", "scss", "c_sharp", "tsx", "jsx","yaml","json","python" }

require("nvim-treesitter").setup({
	-- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
	install_dir = vim.fn.stdpath("data") .. "/site",
})

require("nvim-treesitter.config").setup({
	highlight = {
		enabled = true,
	},
})

require("nvim-treesitter").install(langs)

local filetypes = vim.list_extend({}, langs) -- Make a copy
vim.list_extend(filetypes, { "javascriptreact", "typescriptreact" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = filetypes,
	callback = function()
		-- syntax highlighting, provided by Neovim
		vim.treesitter.start()
		-- indentation, provided by nvim-treesitter
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
