local opts = { noremap = true, silent = true }
local builtin = require('telescope.builtin')
-- ============================================================
--                      TELESCOPE
-- ============================================================
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n','<leader>t','<cmd>Telescope<cr>')
vim.keymap.set('n','<leader>tb','<cmd>Telescope<cr>')
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n','<leader>fo',builtin.oldfiles,{desc='List old files'})
-- ============================================================
--                         PANES
-- ============================================================
vim.keymap.set('n', '<C-S-l>', '<cmd>vsplit<CR>', { desc = 'split buffer rigth' })
vim.keymap.set('n', '<C-S-j>', '<cmd>split<CR>', { desc = 'split buffer down' })
-- navigation
 vim.keymap.set('n', '<C-l>', '<cmd>wincmd l<CR>', { desc = 'move to rigth pane' })
 vim.keymap.set('n', '<C-k>', '<cmd>wincmd k<CR>', { desc = 'move to upper pane' })
 vim.keymap.set('n', '<C-j>', '<cmd>wincmd j<CR>', { desc = 'move to down pane' })
 vim.keymap.set('n', '<C-h>', '<cmd>wincmd h<CR>', { desc = 'move to left pane' })
 vim.keymap.set('n', '<leader>pw', '<C-w>p', { desc = 'Go to previous window' })
-- pane position
vim.keymap.set('n', '<C-w>l', '<C-w>L', { desc = 'move pane to right' })
vim.keymap.set('n', '<C-w>k', '<C-w>K', { desc = 'move pane to top' })
vim.keymap.set('n', '<C-w>j', '<C-w>J', { desc = 'move pane to bottom' })
vim.keymap.set('n', '<C-w>h', '<C-w>H', { desc = 'move pane to left' })
-- pane resize
vim.keymap.set('n', '<C-Up>', '<cmd>resize -2<CR>', { desc = 'increase height' })
vim.keymap.set('n', '<c-down>', '<cmd>resize +2<cr>', { desc = 'decrease height' })
vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize +2<CR>', { desc = 'decrease width' })
vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize -2<CR>', { desc = 'increase width' })


-- ============================================================
--                         LSP
-- ============================================================

vim.keymap.set('n', '<leader>di', vim.diagnostic.open_float, { desc = 'opens floatind diagnostics' })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Code Rename" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover (alt)" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
vim.keymap.set('n', '<C-A-Enter>', function()
    vim.lsp.buf.format({ async = true })
end, { desc = 'Format buffer with LSP' })
vim.keymap.set('i', '<CR>', function()
    if vim.fn.pumvisible() == 1 then
        return '<C-y>'
    else
        return '<CR>'
    end
end, { expr = true })



-- ============================================================
--                         TERMINAL
-- ============================================================

-- navigate terminal
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
vim.keymap.set('t', '<C-q>', '<C-\\><C-n><cmd>bd!<CR>', { desc = 'Close terminal pane' })
-- Navigate between splits from terminal mode
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', { desc = 'Move to left pane' })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', { desc = 'Move to down pane' })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', { desc = 'Move to up pane' })
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', { desc = 'Move to right pane' })


-- ============================================================
--                         NVIM-TREE
-- ============================================================
vim.keymap.set('n', '<A-1>', '<cmd>Neotree toggle<CR>', { desc = 'toggle nvim tree' })



-- ============================================================
--                    SMART TEXT EDITING
-- ============================================================

-- smart paste dosent copy the deleted text
vim.keymap.set("v", "p", '"_dP', opts)

-- autoclose without plugin
vim.keymap.set("i", "`", "``<left>")
vim.keymap.set("i", '"', '""<left>')
vim.keymap.set("i", "(", "()<left>")
vim.keymap.set("i", "[", "[]<left>")
vim.keymap.set("i", "{", "{}<left>")
vim.keymap.set("i", "<", "<><left>")

-- ============================================================
--                         BUFFER
-- ============================================================

vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
vim.keymap.set("n","<leader>bd","<cmd>bd<CR>",{desc="close buffer"})

-- ============================================================
--                         GIT
-- ============================================================
vim.keymap.set('n','<leader>gc',builtin.git_commits,{desc='list previous commits in project'})
vim.keymap.set('n','<leader>gb',builtin.git_bcommits,{desc='list previous commits in project'})

