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

    }, -- Vim-style keymaps
})
cmp.build():pwait()
cmp.setup()
