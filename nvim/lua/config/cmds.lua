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
--
vim.api.nvim_create_user_command('ReloadNvim', reload_config, {})


