-- save session and exit
local function reload_config()
    -- Save current session
    vim.cmd('mksession! ~/.nvim-session.vim')
    -- Restart Neovim
    vim.cmd('qa!')
end



-- Create command

-- Commands for quick terminals
vim.api.nvim_create_user_command('HTerm', 'split | terminal', {})
vim.api.nvim_create_user_command('VTerm', 'vsplit | terminal', {})
vim.api.nvim_create_user_command('Term', 'terminal', {})
-- Reload config
vim.api.nvim_create_user_command('ReloadNvim', reload_config, {})
-- git commands
vim.api.nvim_create_user_command('Gitb', 'Telescope git_branches', {})
vim.api.nvim_create_user_command('Gitc', 'Telescope git_commits', {})
vim.api.nvim_create_user_command('Gitcb', 'Telescope git_bcommits', {})



