vim.pack.add({
    { src = 'https://github.com/saghen/blink.cmp' },
    'https://github.com/saghen/blink.lib',
    'https://github.com/rafamadriz/friendly-snippets',
})

local cmp = require('blink.cmp')
cmp.setup({
    keymap = {
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide', 'fallback' },

        ['<Tab>'] = {
            function(cmp)
                if cmp.snippet_active() then
                    return cmp.accept()
                else
                    return cmp.select_and_accept()
                end
            end,
            'snippet_forward',
            'fallback'
        },

        ['<S-Tab>'] = {

            function(cmp)
                if cmp.snippet_active() then
                    return cmp.snippet_backward()
                end
            end,
            'snippet_backward', 'fallback'
        },

        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
        ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

        ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
    }, -- Vim-style keymaps
})
cmp.build():pwait()
cmp.setup()
