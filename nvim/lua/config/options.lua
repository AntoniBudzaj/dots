local opt = vim.opt

vim.g.mapleader = " "

opt.number = true
opt.termguicolors = true
opt.relativenumber = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.laststatus = 3
opt.cursorline = true -- Highlight current line

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true


opt.pumheight = 10 -- Popup menu height
opt.pumblend = 10 -- Popup menu transparency

opt.wrap = false
opt.smartindent = true
opt.inccommand = 'split'
opt.encoding = 'utf-8'


opt.shell = 'zsh' -- or bash, fish, etc.
opt.shellcmdflag = '-c'
opt.shellredir = '2>&1 | tee'

opt.splitbelow = true
opt.splitright= true

opt.backup = false -- Don't create backup files
opt.writebackup = false -- Don't create backup before writing
opt.swapfile = false -- Don't create swap files
opt.undofile = true -- Persistent undo
opt.undolevels = 10000
opt.undodir = vim.fn.stdpath('data') .. '/undodir'
opt.undofile = true

opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
opt.isfname:append('@-@')
opt.scrolloff = 16
opt.signcolumn = 'yes'

vim.o.cmdheight = 1


