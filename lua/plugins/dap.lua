return {
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            'mfussenegger/nvim-dap'
        },
        config = function()
            local dap = require('dap')
            local dapui = require('dapui')
            dapui.setup()

            vim.keymap.set("n", "<leader>wb", dap.toggle_breakpoint)
            vim.keymap.set("n", "<leader>wc", dap.continue)
            vim.keymap.set("n", "<leader>wn", dap.step_over)
            vim.keymap.set("n", "<leader>ws", dap.step_into)

            vim.keymap.set("n", "<leader>wu", dapui.toggle)
            vim.keymap.set("n", "<leader>we", dapui.eval)
        end
    }
}
