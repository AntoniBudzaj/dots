vim.pack.add({
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter' }
})

require('nvim-treesitter').setup {
    -- Use system-installed parsers if available
    ensure_installed = {
        "vue",
        "typescript",
        "tsx",
        "javascript",
        "html",
        "css",
    },
    auto_install = true, -- Automatically install missing parsers
    highlight = {
        enable = true,
    },
    indent={
      enable = true
    },
}
