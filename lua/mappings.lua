local map = vim.api.nvim_set_keymap

map('i', 'jk', '<esc>', {})
map('i', 'kj', '<esc>', {})

vim.cmd[[
  nmap ü [
  nmap + ]
]]
