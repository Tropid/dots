local keymap = function(mode, keys, cmd, opts)
  opts = opts or {}
  if opts.silent == nil then opts.silent = true end
  vim.keymap.set(mode, keys, cmd, opts)
end

keymap('i', 'jk', [[<esc>]])
keymap('i', 'kj', [[<esc>]])

vim.cmd[[
    nmap ü [
    nmap + ]
]]

keymap('t', [[<C-h>]], [[<C-\><C-N><C-w>h]])

keymap('i', [[<Tab>]], [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
keymap('i', [[<S-Tab>]], [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })

keymap('s', [[<BS>]], [[<BS>i]])

keymap('c', '<C-p>', '<Up>', { silent = false })
keymap('c', '<C-n>', '<Down>', { silent = false })

keymap({ 'n', 'x' }, '[p', '<Cmd>exe "put! " . v:register<CR>', { desc = 'Paste Above' })
keymap({ 'n', 'x' }, ']p', '<Cmd>exe "put "  . v:register<CR>', { desc = 'Paste Below' })
