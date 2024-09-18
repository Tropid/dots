_G.Config = {}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local source = function(f) dofile(vim.fn.stdpath('config')..'/lua/'..f) end

source('settings.lua')
source('mappings.lua')
source('leader-mappings.lua')

require('lazy').setup('plugins')
