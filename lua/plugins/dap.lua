return {
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            'mfussenegger/nvim-dap',
            'nvim-neotest/nvim-nio',
        },
        config = function()
            local dap = require('dap')
            local dapui = require('dapui')
            dapui.setup()

            vim.keymap.set("n", "<leader>ib", dap.toggle_breakpoint)
            vim.keymap.set("n", "<leader>ic", dap.continue)
            vim.keymap.set("n", "<leader>in", dap.step_over)
            vim.keymap.set("n", "<leader>is", dap.step_into)

            vim.keymap.set("n", "<leader>iu", dapui.toggle)
            vim.keymap.set("n", "<leader>ie", dapui.eval)
        end
    }
}
