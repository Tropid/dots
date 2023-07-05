return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { buffer = bufnr })
            vim.keymap.set("n", "<leader>hb", function() gs.blame_line{full=true} end, { buffer = bufnr })
            vim.keymap.set('n', '<leader>hd', gs.toggle_deleted, { buffer = bufnr })
        end
    }
}
