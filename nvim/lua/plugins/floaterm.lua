vim.pack.add({
  { src = 'https://github.com/nvzone/floaterm' },
  'https://github.com/nvzone/volt'
})

local function disable_esc(buf)
  pcall(vim.keymap.del, 'n', '<Esc>', {
    buffer = buf,
  })
end

require('floaterm').setup({
  border = false,

  size = {
    h = 60,
    w = 70,
  },

  mappings = {
    -- Terminal window
    term = function(buf)
      disable_esc(buf)
    end,

    -- Floaterm sidebar
    sidebar = function(buf)
      disable_esc(buf)
    end,
  },

  terminals = {
    {
      name = 'Terminal',
    },
  },
})
