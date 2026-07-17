vim.pack.add({
    { src = 'https://github.com/nvim-telescope/telescope.nvim' },
    'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-tree/nvim-web-devicons'
})

require('telescope').setup({
defaults = {
   file_ignore_patterns = {
     "node_modules", "build", "dist", "yarn.lock"
   },
   initial_mode = "normal"
  }
})
