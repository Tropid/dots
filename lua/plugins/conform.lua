return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					cpp = { "clang-format" },
					json = { "jq" },
					lua = { "stylua" },
					python = { "black" },
					zig = { "zigfmt" },
				},
			})
		end,
	},
}
