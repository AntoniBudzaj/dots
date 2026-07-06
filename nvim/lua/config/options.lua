vim.g.mapleader = " "

vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.wrap = false
vim.opt.smartindent = true
vim.opt.inccommand = 'split'
vim.opt.encoding = 'utf-8'


vim.opt.shell = 'zsh' -- or bash, fish, etc.
vim.opt.shellcmdflag = '-c'
vim.opt.shellredir = '2>&1 | tee'

vim.opt.splitbelow = true
vim.opt.splitright= true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.laststatus = 3

vim.opt.swapfile = false
vim.opt.backup = flase
vim.opt.undodir = vim.fn.stdpath('data') .. '/undodir'
vim.opt.undofile = true

vim.opt.clipboard:append('unnamedplus')
vim.opt.isfname:append('@-@')
vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'

vim.o.cmdheight = 0


