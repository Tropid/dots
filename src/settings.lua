vim.cmd('colorscheme randomhue')

vim.g.mapleader     = ' '

-- General
vim.o.backup        = false
vim.o.mouse         = 'a'
vim.o.mousescroll   = 'ver:10,hor:6'
vim.o.switchbuf     = 'usetab'
vim.o.writebackup   = false
vim.o.undofile      = true

vim.o.shada         = "'100,<50,s10,:1000,/100,@100,h"

vim.cmd('filetype plugin indent on')

-- UI
vim.o.breakindent   = true
vim.o.colorcolumn   = '+1'
vim.o.cursorline    = true
vim.o.laststatus    = 2
vim.o.linebreak     = true
vim.o.list          = true
vim.o.number        = true
vim.o.pumblend      = 10
vim.o.pumheight     = 10
vim.o.ruler         = false
vim.o.shortmess     = 'aoOWFcS'
vim.o.showmode      = false
vim.o.showtabline   = 2
vim.o.signcolumn    = 'yes'
vim.o.splitbelow    = true
vim.o.splitright    = true
vim.o.termguicolors = true
vim.o.winblend      = 10
vim.o.wrap          = false

vim.o.fillchars = table.concat(
	{ 'eob: ', 'fold:╌', 'horiz:═', 'horizdown:╦', 'horizup:╩', 'vert:║', 'verthoriz:╬', 'vertleft:╣', 'vertright:╠' },
	','
)
vim.o.listchars = table.concat({ 'extends:…', 'nbsp:␣', 'precedes:…', 'tab:> ' }, ',')
vim.o.cursorlineopt = 'screenline,number'
vim.opt.shortmess:append('C')
vim.o.splitkeep = 'screen'

-- Colors
if vim.fn.exists('syntax_on') ~= 1 then vim.cmd('syntax enable') end

-- Editing
vim.o.autoindent    = true
vim.o.expandtab     = true
vim.o.formatoptions = 'rqnl1j'
vim.o.ignorecase    = true
vim.o.incsearch     = true
vim.o.infercase     = true
vim.o.shiftwidth    = 4
vim.o.smartcase     = true
vim.o.smartindent   = true
vim.o.tabstop       = 4
vim.o.virtualedit   = 'block'

vim.opt.iskeyword:append('-')

vim.o.formatlistpat = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]

-- Spelling
-- vim.o.spelllang = 'en,de'
-- vim.o.spelloptions = 'camel'
-- vim.opt.complete:append('kspell')
-- vim.opt.complete:remove('t')
--
-- vim.o.dictionary = vim.fn.stdpath('config') .. '/misc/dict/english.txt'

-- Folds
vim.o.foldmethod       = 'indent'
vim.o.foldlevel        = 10
vim.o.foldnestmax      = 10
vim.g.markdown_folding = 1
vim.o.foldtext = ''

-- Custom autocommands
local augroup = vim.api.nvim_create_augroup('CustomSettings', {})
vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  callback = function()
    -- Don't auto-wrap comments and don't insert comment leader after hitting 'o'
    -- If don't do this on `FileType`, this keeps reappearing due to being set in
    -- filetype plugins.
    vim.cmd('setlocal formatoptions-=c formatoptions-=o')
  end,
  desc = [[Ensure proper 'formatoptions']],
})
