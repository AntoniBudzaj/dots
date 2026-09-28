vim.pack.add({
    { src = 'https://github.com/akinsho/bufferline.nvim' },

    "https://github.com/nvim-tree/nvim-web-devicons",
})

require("bufferline").setup({
    options = {
        themable = true,                   -- allows highlight groups to be overriden i.e. sets highlights as default
        numbers = "buffer_id",
        close_command = "bd",     -- can be a string | function, | false see "Mouse actions"
    },
})
