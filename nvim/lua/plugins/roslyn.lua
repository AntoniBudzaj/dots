vim.pack.add({
	"https://github.com/seblyng/roslyn.nvim",
})

require("roslyn").setup({})

vim.lsp.config("roslyn", {
	settings = {
		["csharp|inlay_hints"] = {
			csharp_enable_inlay_hints_for_implicit_object_creation = true,
			csharp_enable_inlay_hints_for_implicit_variable_types = true,
			csharp_enable_inlay_hints_for_lambda_parameter_types = true,
			csharp_enable_inlay_hints_for_types = true,
			dotnet_enable_inlay_hints_for_parameters = true,
		},
		["csharp|background_analysis"] = {
			dotnet_analyzer_diagnostics_scope = "openFiles",
			dotnet_compiler_diagnostics_scope = "fullSolution",
		},
	},
})
