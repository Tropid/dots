local all_snippets = {
    ['fn'] = 'function()\n\t$0\nend',
}

local get_snippet_at_cursor = function()
  local line = vim.api.nvim_get_current_line()
  local offset = vim.fn.mode() == 'i' and 0 or 1
  local col = vim.api.nvim_win_get_cursor(0)[2] + offset

  -- TODO: Probably make matching character configurable
  local prefix = line:sub(1, col):match('[%w_-.]*$')
  local res = all_snippets[prefix]
  if vim.is_callable(res) then return res(), prefix end
  return res, prefix
end

local jump_or_expand = function()
  if vim.snippet.active({ direction = 1 }) then return vim.snippet.jump(1) end

  local snippet, prefix = get_snippet_at_cursor()
  if type(snippet) ~= 'string' then return end

  vim.schedule(function()
    local lnum, col = unpack(vim.api.nvim_win_get_cursor(0))
    vim.api.nvim_buf_set_text(0, lnum - 1, col - #prefix, lnum - 1, col, {})
    vim.snippet.expand(snippet)
  end)
end

-- Make snippet keymaps
local go_right = function() jump_or_expand() end

local go_left = function()
  if vim.snippet.active({ direction = -1 }) then vim.snippet.jump(-1) end
end

vim.keymap.set({ 'i', 's' }, '<C-l>', go_right)
vim.keymap.set({ 'i', 's' }, '<C-h>', go_left)

-- Tweak to stop snippet session while exiting into Normal mode
-- -- NOTE: autocommand doesn't work because currently tabstop selection in
-- -- `vim.snippet` itself exits into Normal mode
-- -- (see https://github.com/neovim/neovim/issues/26449#issuecomment-1845843529)
-- local augroup = vim.api.nvim_create_augroup('my_snippets', {})
-- local opts = {
--   pattern = '*:n',
--   group = augroup,
--   callback = function() vim.snippet.stop() end,
--   desc = 'Stop snippet session and exit to Normal mode',
-- }
-- vim.api.nvim_create_autocmd('ModeChanged', opts)

vim.keymap.set({ 'i', 's' }, '<C-e>', function()
  vim.snippet.stop()
  vim.fn.feedkeys('\27', 'n')
end, { desc = 'Stop snippet session' })
