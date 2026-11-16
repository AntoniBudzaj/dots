vim.diagnostic.config({
	-- the most severe diagnostic wins the sign column and comes first in the float
	severity_sort = true,
	float = { border = "rounded", source = true },
})
