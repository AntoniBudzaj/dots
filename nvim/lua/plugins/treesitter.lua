vim.pack.add({
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter' }
})

require('nvim-treesitter').setup {
    -- Use system-installed parsers if available
    ensure_installed = { 'lua', 'javascript', 'typescript', 'html', 'css' },
    auto_install = true, -- Automatically install missing parsers
    install = {
        -- Don't compile from source, use pre-built
        -- This may still require the CLI but with different behavior
    },
    -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
    install_dir = vim.fn.stdpath('data') .. '/site'
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'rust', 'python', 'typescript' },
  callback = function()
    vim.treesitter.start()                                    -- highlighting
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'     -- folds
    vim.wo.foldmethod = 'expr'
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- indentation
  end,
})
