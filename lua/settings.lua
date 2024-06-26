vim.g.mapleader = " "

local uname = vim.loop.os_uname()

if uname.sysname:find("Windows") and true or false then
	vim.opt.shellslash = true
	vim.opt.shell = "bash"
	vim.opt.shellcmdflag = "-c"
	vim.opt.shellredir = ">%s 2>&1"
	vim.opt.shellquote = ""
	vim.opt.shellxescape = ""
	vim.opt.shellxquote = ""
	vim.opt.shellpipe = "2>&1| tee"
end

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.inccommand = "split"

vim.opt.cursorline = true
vim.opt.scrolloff = 3

vim.opt.hlsearch = true

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
