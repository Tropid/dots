return {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

    {
	    'nvim-telescope/telescope.nvim', tag = '0.1.2',
	    dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local telescope = require('telescope')
            local builtin = require('telescope.builtin')

            vim.keymap.set("n", "<leader>s", function() builtin.find_files({ cwd = vim.fn.stdpath("config") .. "/snippets" }) end)

            telescope.setup({})
        end
    },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },

    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup({
                manual_mode = true,
                patterns = { "Cargo.toml" }
            })
        end
    },
}
