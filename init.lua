local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

vim.opt.number = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.wrap = false

vim.opt.guifont = "JetBrainsMono Nerd Font:h14"
-- vim.opt.guifont = "Victor Mono:h11"
-- vim.opt.guifont = "ComicShannsMono Nerd Font:h11"

-- vim.keymap.set("n", "ü", "[")
-- vim.keymap.set("n", "+", "]")

vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("i", "kj", "<esc>")
vim.keymap.set("n", "<leader>w", ":w<esc>", { desc = 'Write File' })

vim.keymap.set("n", "<leader>Lc", ":e $MYVIMRC<cr>", { desc = 'Edit init.lua' })

vim.keymap.set("n", "<M-o>", ":b#<cr>", { desc = 'Alternate Buffer' })

vim.keymap.set("n", "üq", ":cprev<cr>", { desc = 'Next quickfix' })
vim.keymap.set("n", "+q", ":cnext<cr>", { desc = 'Previous quickfix' })

vim.keymap.set("n", "<leader>ff", ":Telescope find_files<cr>", { desc = 'Files' })
vim.keymap.set("n", "<leader>b", ":Telescope buffers<cr>", { desc = 'Buffers' })
vim.keymap.set("n", "<leader>fp", ":Telescope projects<cr>", { desc = 'Projects' })
vim.keymap.set("n", "<leader>fB", ":Telescope builtin<cr>", { desc = 'Builtin' })
vim.keymap.set("n", "<leader>fw", ":Telescope live_grep<cr>", { desc = 'Live Grep' })
vim.keymap.set("n", "<leader>fc", ":Telescope grep_string<cr>", { desc = 'Grep Word' })
vim.keymap.set("n", "<leader>f<cr>", ":Telescope resume<cr>", { desc = 'Resume' })

vim.keymap.set("n", "<leader>D", ":Telescope diagnostics<cr>", { desc = 'Diagnostics' })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = 'Float Diagnostic' })

vim.keymap.set("n", "<leader>lS", ":Telescope lsp_dynamic_workspace_symbols<cr>", { desc = 'Workspace Symbols' })
vim.keymap.set("n", "<leader>ls", ":Telescope lsp_document_symbols<cr>", { desc = 'Document Symbols' })
vim.keymap.set("n", "<leader>li", ":Telescope lsp_incoming_calls<cr>", { desc = 'Incoming Calls' })
vim.keymap.set("n", "<leader>lo", ":Telescope lsp_outgoing_calls<cr>", { desc = 'Outgoing Calls' })

vim.keymap.set("n", "<leader>cr", ":lua require('toggleterm').exec('cargo run')<cr>", { desc = 'Run' })
vim.keymap.set("n", "<leader>cc", ":lua require('toggleterm').exec('cargo check')<cr>", { desc = 'Check' })
vim.keymap.set("n", "<leader>cb", ":lua require('toggleterm').exec('cargo build')<cr>", { desc = 'Build' })
vim.keymap.set("n", "<leader>cl", ":lua require('toggleterm').exec('cargo clippy')<cr>", { desc = 'Lint' })
-- vim.keymap.set("n", "<leader>zr", ":lua require('toggleterm').exec('zig build run')<cr>")

vim.keymap.set("n", "<leader>ee", ":NvimTreeToggle<cr>", { desc = 'Nvim Tree' })
vim.keymap.set("n", "<leader>ef", ":NvimTreeFindFile<cr>", { desc = 'Nvim Sync' })
vim.keymap.set("n", "<leader>eo", ":Oil<cr>", { desc = 'Oil' })

vim.keymap.set("n", "<leader>G", ":Neogit<cr>")
vim.keymap.set("n", "<leader>gb", ":Telescope git_branches<cr>", { desc = 'Branches' })

vim.keymap.set("n", "<leader>se", function() require("scissors").editSnippet() end, { desc = 'Edit' })
vim.keymap.set({ "n", "x" }, "<leader>sa", function() require("scissors").addNewSnippet() end, { desc = 'Add' })

require("lazy").setup("plugins")
