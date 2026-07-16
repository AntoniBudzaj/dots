vim.pack.add({
    { src = 'https://github.com/akinsho/bufferline.nvim' },

    "https://github.com/nvim-tree/nvim-web-devicons",
})

require("bufferline").setup({
    options = {
        mode = "buffers",                  -- set to "tabs" to only show tabpages instead
        themable = true,                   -- allows highlight groups to be overriden i.e. sets highlights as default
        numbers = "buffer_id",
        close_command = "bdelete! %d",     -- can be a string | function, | false see "Mouse actions"
    }
})
