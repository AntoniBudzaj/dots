vim.lsp.config("svelte", {
	cmd = { "svelteserver", "--stdio" },
	filetypes = { "svelte" },
	root_dir = vim.fs.root(0, { "package.json", ".git" }),
})
vim.lsp.enable("svelte")
