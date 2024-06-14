vim.keymap.set("n", "<leader>rb", ':1TermExec cmd="cls & zig build"<cr>', { desc = 'Build' })
vim.keymap.set("n", "<leader>rs", ':1TermExec cmd="cls & zig build run"<cr>', { desc = 'Run' })
vim.keymap.set("n", "<leader>ra", function()
    vim.cmd[[
    :1TermExec cmd=".\\zig-out\\bin\\zig-game.exe"<cr>
    :2TermExec cmd=".\\zig-out\\bin\\zig-game.exe --client"<cr>
    ]]
end, { desc = 'Run All' })
