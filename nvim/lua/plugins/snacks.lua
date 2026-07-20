vim.pack.add({
  { src = 'https://github.com/folke/snacks.nvim' }
})

require('snacks').setup({
  ---@type snacks.Config
  opts = {
    dashboard = { enabled = true },
    explorer = require('plugins.snacks.explorer'),
    picker = require('plugins.snacks.picker'),
    lazygit = { enabled = true },
    notifier = { enabled = true },
    scroll = { enabled = true },
  }
})
