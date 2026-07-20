vim.pack.add({
  { src = 'https://github.com/nvzone/floaterm' },
'https://github.com/nvzone/volt'
})


require('floaterm').setup({
  border = false,
  size = { h = 60, w = 70 },

  -- to use, make this func(buf)
  mappings = { sidebar = nil, term = nil },

  -- Default sets of terminals you'd like to open
  terminals = {
    { name = "Terminal" },
    -- cmd can be function too
    { name = "Terminal", cmd = "neofetch" },
    -- More terminals
  },
})
