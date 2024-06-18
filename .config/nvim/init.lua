-- Enable the experimental Lua module loader for faster startup
vim.loader.enable()

-- Set leader key early to ensure it's correct for all plugins and mappings
vim.g.mapleader = " "

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

-- Load Core Configuration
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Setup Plugins
require("lazy").setup("plugins", {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
