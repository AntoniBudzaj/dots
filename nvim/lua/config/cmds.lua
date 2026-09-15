-- save session and exit
local function reload_config()
	for _, picker in ipairs(Snacks.picker.get({ source = "explorer" })) do
		picker:close()
	end
	vim.defer_fn(function()
		vim.cmd("mksession! ~/.nvim-session.vim")
		vim.cmd("qa!")
	end, 100)
	-- Restart Neovim
end

-- Create command

-- Commands for quick terminals
vim.api.nvim_create_user_command("HTerm", "split | terminal", {})
vim.api.nvim_create_user_command("VTerm", "vsplit | terminal", {})
vim.api.nvim_create_user_command("Term", "terminal", {})
-- Reload config
vim.api.nvim_create_user_command("Nvims", reload_config, {})
