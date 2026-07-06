
vim.api.nvim_create_autocmd('TextYankPost',{
    desc = 'highlight when coping text',
    callback = function()
        vim.hl.on_yank()
    end,
})
