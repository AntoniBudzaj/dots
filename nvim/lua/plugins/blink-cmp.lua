vim.pack.add({
  { src = 'https://github.com/saghen/blink.cmp' },
  'https://github.com/saghen/blink.lib',
  'https://github.com/rafamadriz/friendly-snippets',
})

local cmp = require('blink.cmp')
cmp.setup({
  sources = {
    providers = {
      lsp = {
        override = {
          get_completions = function(self, context, callback)
            if vim.bo[context.bufnr].filetype == 'svelte'
              and context.trigger.kind == 'trigger_character'
              and context.trigger.character == '$'
            then
              -- Svelte advertises `$`, but its TS provider rejects that trigger.
              -- Request runes as ordinary completion while keeping auto-show.
              context = vim.deepcopy(context)
              context.trigger.kind = 'manual'
              context.trigger.character = nil
            end
            return self:get_completions(context, callback)
          end,
        },
      },
    },
  },
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
  completion = {
    accept = {
      auto_brackets = {
        default_brackets = { '(', ')' },
        override_brackets_for_filetypes = {},
        kind_resolution = {
          enabled = true,
        },
        semantic_token_resolution = {
          enabled = true,
          timeout_ms = 400,
        },
      }
    }
  }
})
cmp.build():pwait()
cmp.setup()
