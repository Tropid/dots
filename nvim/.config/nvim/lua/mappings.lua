local map = vim.api.nvim_set_keymap

map("i", "jk", "<esc>", {})
map("i", "kj", "<esc>", {})

vim.cmd([[
  nmap ü [
  nmap + ]
]])

map("n", "[q", "<cmd>cprevious<cr>", {})
map("n", "]q", "<cmd>cnext<cr>", {})

map("n", "<Esc>", "<cmd>nohlsearch<cr>", {})

map("t", "<C-h>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
