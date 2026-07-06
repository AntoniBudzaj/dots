require("lsp.lua_ls")
require("lsp.ts_ls")

vim.pack.add {
    { src = 'https://github.com/neovim/nvim-lspconfig' },
}


local function augroup(name)
    return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
end


-- ============================================================
--                         TYPESCRIPT
-- ============================================================

local completion = "blink" -- or 'native' for built-in completion
vim.api.nvim_create_autocmd("LspAttach", {
    group = augroup("lsp_attach"),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local buf = args.buf

        if not client then
            return
        end

        -- Built-in completion (only if using native)
        if completion == "native" and client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, args.buf, {
                min_chars = 2,
                debounce = 100
            })
        end

        -- Inlay hints
        if client:supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
        end

        -- Document colors
        if client:supports_method("textDocument/documentColor") then
            vim.lsp.document_color.enable(true, { bufnr = buf }, {
                style = "virtual",
            })
        end
    end,
})

vim.opt.completeopt = { 'menuone', 'noselect' }

local ts_server = vim.g.lsp_typescript_server or "vtsls"

vim.lsp.enable({
    ts_server,
    'lua_ls',
    'vtsls'
})
