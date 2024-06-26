return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        config = function()
            local wk = require('which-key')
            wk.setup({})

            wk.register({
                f = { name = 'Finder' },
                l = { name = 'LSP' },
                i = { name = 'DAP' },
                c = { name = 'Compiler' },
                e = { name = 'Explorer' },
                g = { name = 'Git' },
                s = { name = 'Snippets' },
                h = { name = 'Git Signs' },
            }, { prefix = '<leader>' })
        end,
    },
}
