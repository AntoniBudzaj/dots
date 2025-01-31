return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				vimgrep_arguments = {
					"-g",
					"--glob",
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
				},
				prompt_prefix = "❯ ",
				file_ignore_patterns = {
					"node%_modules/.*",
					"target/.*",
					"dist/.*",
					"build/.*",
					"vendor/.*",
					"bower_components/.*",
					"tmp/.*",
					"bin/.*",
					".git/.*",
				},

				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.git_files, {})

			require("telescope").load_extension("ui-select")
			vim.keymap.set("n", "<leader>fb", builtin.current_buffer_fuzzy_find, {})
		end,
	},
	{
		"alex-laycalvert/telescope-dotfiles.nvim",
	},
}
