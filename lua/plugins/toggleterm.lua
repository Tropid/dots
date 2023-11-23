return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require('toggleterm').setup({
                open_mapping = [[<c-_>]],
                terminal_mappings = true,
                direction = "float",
            })
        end
    }
}
