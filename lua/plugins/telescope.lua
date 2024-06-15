return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",

		"nvim-telescope/telescope-ui-select.nvim",

		"fdschmidt93/telescope-egrepify.nvim",
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})
		telescope.load_extension("ui-select")
		telescope.load_extension("egrepify")
	end,
}
