vim.pack.add({
    { src = 'https://github.com/saghen/blink.cmp' },
    { src = 'https://github.com/saghen/blink.lib' }
})

local cmp = require('blink.cmp')
cmp.setup({
    keymap = {
        preset = 'super-tab',
        ['<C-space>'] = { 'show' },
        ['<C-space>S'] = { function(cmp) return cmp.show({ providers = { 'snippets' } }) end },
        ['<Tab>'] = { 'select_next' },
        -- Chained commands
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<C-x><C-o>'] = { 'show', 'fallback' },
        ['jk'] = { 'hide' },
        -- Key equivalences (for terminals that support them)
        ['<CR>'] = { 'accept', 'snippet_forward', 'fallback' },

    }, -- Vim-style keymaps
})
cmp.build():pwait()
cmp.setup()
