-- cmd / filetypes / root_dir come from nvim-lspconfig; only settings are overridden here.
-- The server itself is installed and enabled by mason-lspconfig (see plugins/mason.lua).

-- rustc repeats every note/help of a diagnostic as a separate HINT pointing back at the
-- "original diagnostic". They are already listed inside the original one, so drop the copies.
local function is_related_copy(d)
	if d.severity ~= vim.lsp.protocol.DiagnosticSeverity.Hint then
		return false
	end
	for _, info in ipairs(d.relatedInformation or {}) do
		if info.message == "original diagnostic" then
			return true
		end
	end
	return false
end

vim.lsp.config("rust_analyzer", {
	handlers = {
		["textDocument/publishDiagnostics"] = function(err, result, ctx)
			if result and result.diagnostics then
				result.diagnostics = vim.tbl_filter(function(d)
					return not is_related_copy(d)
				end, result.diagnostics)
			end
			return vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx)
		end,
	},
	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
				buildScripts = { enable = true },
			},
			procMacro = { enable = true },
			-- run clippy instead of plain `cargo check` on save
			check = { command = "clippy" },
			completion = {
				postfix = { enable = true },
				callable = { snippets = "fill_arguments" },
			},
			inlayHints = {
				chainingHints = { enable = true },
				closingBraceHints = { minLines = 20 },
				closureReturnTypeHints = { enable = "with_block" },
				lifetimeElisionHints = { enable = "skip_trivial" },
				parameterHints = { enable = true },
				typeHints = { enable = true },
			},
		},
	},
})
