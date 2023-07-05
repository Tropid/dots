return {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

    {
	    'nvim-telescope/telescope.nvim', tag = '0.1.2',
	    dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },

    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup()
        end
    },
}
