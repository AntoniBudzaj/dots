vim.pack.add({
	{ src = "https://github.com/willothy/nvim-cokeline" },
})


require('cokeline').setup({
  buffers ={
    focus_on_delete = 'prev',
  },
})
