-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")
vim.api.nvim_set_keymap("n", "<Leader>sv", ":vsplit<CR>", { noremap = true, silent = true })
--bufferline keymaps
vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<C-w>", "<Cmd>lua Snacks.bufdelete()<CR>", { desc = "Delete buffer" })

-- oil keymaps
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- diagnostics
vim.keymap.set("n", "<Space>td", "<CMD>Telescope diagnostics<CR>", { desc = "Telescope diagnostics" })

--dashboard
vim.keymap.set("n", "<C-d>", "<CMD>lua Snacks.dashboard.open()<CR>", { desc = "Open dashoard" })

--lsp
vim.keymap.set("n", "K", vim.lsp.buf.hover, {}) -- inspect
vim.keymap.set("n", "<F12>", vim.lsp.buf.definition, {}) -- go to definition
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {}) -- go to references
vim.keymap.set("n", "<M-CR>", vim.lsp.buf.code_action, {}) -- code action
vim.keymap.set("n", "<C-M-CR>", vim.lsp.buf.format, {})
--diagnostics
vim.keymap.set(
	"n",
	"di",
	"<CMD>lua vim.diagnostic.open_float(nil, { focus = false })<CR>",
	{ desc = "Open diagnostics floating inspection" }
)

--picker
vim.keymap.set("n", "<M-1>", "<CMD>lua Snacks.picker.explorer()<CR>", { desc = "Open file picker" })
vim.keymap.set("n", "<leader>p", "<CMD>lua Snacks.picker()<CR>", { desc = "Open picker" })
vim.keymap.set("n", "<leader>pg", "<CMD>lua Snacks.picker.grep()<CR>", { desc = "Open grep picker" })
-- git keymaps
vim.keymap.set("n", "<leader>gs", "<CMD>lua Snacks.picker.git_status<CR>", { desc = "open git status" })
vim.keymap.set("n", "<leader>gd", "<CMD>lua Snacks.picker.git_diff()<CR>", { desc = "open git commits" })
vim.keymap.set("n", "<leader>gl", "<CMD>lua Snacks.picker.git_log()<CR>", { desc = "open git log" })
vim.keymap.set(
	"n",
	"<leader>gL",
	"<CMD>lua Snacks.picker.git_log_file()<CR>",
	{ desc = "open git logs on current file" }
)
vim.keymap.set("n", "<leader>gb", "<CMD>lua Snacks.picker.git_branches()<CR>", { desc = "open git branches" })

vim.keymap.set("n", "<leader>pn", "<CMD>lua Snacks.picker.notifications()<CR>", { desc = "open notification history" })
