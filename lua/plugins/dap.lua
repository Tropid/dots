return {
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            'mfussenegger/nvim-dap'
        },
        config = function()
            local dap = require('dap')
            require("dapui").setup()
        end
    }
}
