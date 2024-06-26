vim.cmd("set tabstop=2")
vim.cmd("set number")
vim.cmd("set shiftwidth=2")
vim.cmd("set cc=+1")
vim.cmd("set textwidth=80")
--vim.cmd("set softtabstop=4")
--vim.cmd("set noautoindent")

vim.g.mapleader = " "

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
vim.keymap.set("v", "<Tab>", ">gv", {})
vim.keymap.set("v", "<S-Tab>", "<gv", {})

require("lazy").setup("plugins")
