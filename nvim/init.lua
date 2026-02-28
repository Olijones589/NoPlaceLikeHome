vim.cmd(":set rnu")
vim.g.mapleader = " "

vim.lsp.enable('pyright')
vim.lsp.enable('clangd')

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

local plugins = {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
	    'nvim-telescope/telescope.nvim', version = '*',
	    dependencies = {
		'nvim-lua/plenary.nvim',
		-- optional but recommended
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	    }
	},
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }
}
local opts = {}

require("lazy").setup(plugins, opts)

require("catppuccin").setup()
vim.cmd.colorscheme("catppuccin")

local telescope_builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, {})

local config = require("nvim-treesitter.config")
config.setup({
	defaults = {
		file_ignore_patterns = {
			"%.i", 
			"%.o", 
			"%.s", 
			"%.jpg", 
			"%.png", 
			"%.webp", 
			"%.pdf", 
			"%.odt", 
			"__pycache", 
			"venv"
		}
	},
	ensure_installed = {
		"c", 
		"lua", 
		"nvim", 
		"vimdoc", 
		"query", 
		"elixir", 
		"heex", 
		"javascript", 
		"html", 
		"css", 
		"ruby", 
		"python"
	},
	highlight = { enable = true },
	indent = { enable = true },
})
