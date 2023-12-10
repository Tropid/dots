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

-- vim.opt.guifont = "JetBrainsMono Nerd Font:h11"
vim.opt.guifont = "Victor Mono:h11"

-- vim.keymap.set("n", "ü", "[")
-- vim.keymap.set("n", "+", "]")

vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("i", "kj", "<esc>")

vim.keymap.set("n", "<leader>Lc", ":e $MYVIMRC<cr>")

vim.keymap.set("n", "<M-o>", ":b#<cr>")

vim.keymap.set("n", "üq", ":cprev<cr>")
vim.keymap.set("n", "+q", ":cnext<cr>")

--local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", ":Telescope find_files<cr>")
vim.keymap.set("n", "<leader>b", ":Telescope buffers<cr>")
vim.keymap.set("n", "<leader>tp", ":Telescope projects<cr>")
vim.keymap.set("n", "<leader>O", ":Telescope lsp_dynamic_workspace_symbols<cr>")
vim.keymap.set("n", "<leader>o", ":Telescope lsp_document_symbols<cr>")
vim.keymap.set("n", "<leader>D", ":Telescope diagnostics<cr>")
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>ti", ":Telescope lsp_incoming_calls<cr>")
vim.keymap.set("n", "<leader>to", ":Telescope lsp_outgoing_calls<cr>")
vim.keymap.set("n", "<leader>tb", ":Telescope builtin<cr>")
vim.keymap.set("n", "<leader>tg", ":Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>g", ":Telescope grep_string<cr>")

vim.keymap.set("n", "<leader>cr", ":lua require('toggleterm').exec('cargo run')<cr>")
vim.keymap.set("n", "<leader>cc", ":lua require('toggleterm').exec('cargo check')<cr>")
vim.keymap.set("n", "<leader>zr", ":lua require('toggleterm').exec('zig build run')<cr>")

vim.keymap.set("n", "<leader>ee", ":NvimTreeToggle<cr>")
vim.keymap.set("n", "<leader>ef", ":NvimTreeFindFile<cr>")
vim.keymap.set("n", "<leader>eo", ":Oil<cr>")

vim.keymap.set("n", "<leader>G", ":LazyGit<cr>")

require("lazy").setup("plugins")

vim.cmd [[ colorscheme gruvbox-material ]]
