local fn = vim.fn

-- Automatically install Lazy
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

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

-- Install your plugins here
return lazy.setup({
	{ "nvim-lua/popup.nvim", pin = true },
	{ "nvim-lua/plenary.nvim", pin = true },
	{
		"williamboman/mason.nvim",
		pin = true,
		cmd = "Mason",
		dependencies = {
			{ "williamboman/mason-lspconfig.nvim", pin = true },
		},
	},
	{ "numToStr/Comment.nvim", pin = true },
	{ "JoosepAlviste/nvim-ts-context-commentstring", pin = true },
	{ "lunarvim/darkplus.nvim", pin = true },
	{ "navarasu/onedark.nvim", pin = true },
	{
		"hrsh7th/nvim-cmp",
		pin = true,
		event = "InsertEnter",
		dependencies = {
			{ "hrsh7th/cmp-buffer", pin = true },
			{ "hrsh7th/cmp-path", pin = true },
			{ "hrsh7th/cmp-cmdline", pin = true },
			{ "saadparwaiz1/cmp_luasnip", pin = true },
			{ "hrsh7th/cmp-nvim-lsp", pin = true },
			{ "hrsh7th/cmp-nvim-lua", pin = true },
			{ "L3MON4D3/LuaSnip", pin = true },
			{ "rafamadriz/friendly-snippets", pin = true },
		},
	},
	{ "neovim/nvim-lspconfig", pin = true },
	{ "williamboman/nvim-lsp-installer", pin = true },
	{ "tamago324/nlsp-settings.nvim", pin = true },
	{ "jose-elias-alvarez/null-ls.nvim", pin = true },
	{ "jose-elias-alvarez/typescript.nvim", pin = true },
	{ "ibhagwan/fzf-lua", pin = true },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		pin = true,
	},
	{ "p00f/nvim-ts-rainbow", pin = true },
	{ "nvim-treesitter/playground", pin = true },
	{ "windwp/nvim-autopairs", pin = true },
	{ "kylechui/nvim-surround", pin = true },
	{
		"nvim-tree/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons", pin = true },
		},
		pin = true,
	},
	{ "christoomey/vim-tmux-navigator", pin = true },
	{ "simrat39/rust-tools.nvim", pin = true },
})
