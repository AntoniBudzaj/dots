
vim.pack.add({
'https://github.com/coc-extensions/coc-svelte'
})



vim.lsp.config("svelte", {
  filetypes = { "svelte" },

  on_attach = function(client, bufnr)
    -- Svelte language server can restart vtsls when
    -- Svelte files change.
  end,
})
