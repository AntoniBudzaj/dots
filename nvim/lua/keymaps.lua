-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")
vim.api.nvim_set_keymap("n", "<Leader>sv", ":vsplit<CR>", { noremap = true, silent = true })
--copilot keymaps
vim.keymap.set("n", "<leader>c", "<cmd>lua print('hello')<CR>", {})
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
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {}) -- code action
--diagnostics
vim.keymap.set(
	"n",
	"di",
	"<CMD>lua vim.diagnostic.open_float(nil, { focus = false })<CR>",
	{ desc = "Open diagnostics floating inspection" }
)

--picker
vim.keymap.set("n", "<M-1>", "<CMD>lua Snacks.picker.explorer()<CR>", { desc = "Open file picker" })
