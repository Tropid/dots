return {
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local fzf = require('fzf-lua')
            fzf.setup({})
        end,
    }
}
