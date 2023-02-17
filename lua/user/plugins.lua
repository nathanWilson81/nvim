local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use({ "wbthomason/packer.nvim", commit = "dac4088c70f4337c6c40d1a2751266a324765797" }) -- Have packer manage itself
	use({ "nvim-lua/popup.nvim", commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac" }) -- An implementation of the Popup API from vim in Neovim
	use({ "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" }) -- Useful lua functions used ny lots of plugins
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })

	--Commenting
	use({ "numToStr/Comment.nvim", commit = "5f01c1a89adafc52bf34e3bf690f80d9d726715d" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "32d9627123321db65a4f158b72b757bcaef1a3f4" })

	-- Colorschemes
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
	use({ "lunarvim/darkplus.nvim", commit = "d308e9538f0e50cc3e80afc4ed904ab8b8e10fe6" })
	use({ "navarasu/onedark.nvim", commit = "89dde4963ad198c9b6144dee3d5e8bcbb7559ddc" })

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp", commit = "8bbaeda725d5db6e4e1be2867a64b43bf547cf06" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }) -- buffer completions
	use({ "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }) -- path completions
	use({ "hrsh7th/cmp-cmdline", commit = "23c51b2a3c00f6abc4e922dbd7c3b9aca6992063" }) -- cmdline completions
	use({ "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp", commit = "59224771f91b86d1de12570b4070fe4ad7cd1eeb" })
	use({ "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" })

	-- snippets
	use({ "L3MON4D3/LuaSnip", commit = "8b25e74761eead3dc47ce04b5e017fd23da7ad7e" }) --snippet engine
	use({ "rafamadriz/friendly-snippets", commit = "1a6a02350568d6830bcfa167c72f9b6e75e454ae" }) -- a bunch of snippets to use

	-- LSP
	use({ "neovim/nvim-lspconfig", commit = "973aa14d0992df82ff82f714d978a3eb8d676600" }) -- enable LSP
	use({ "williamboman/nvim-lsp-installer", commit = "17e0bfa5f2c8854d1636fcd036dc8284db136baa" }) -- simple to use language server installer
	use({ "tamago324/nlsp-settings.nvim", commit = "5e32ebb900a2b441621892172886287cb6f23672" }) -- language server settings defined in json for
	use({ "jose-elias-alvarez/null-ls.nvim", commit = "5d8e925d31d8ef8462832308c016ac4ace17597a" })
	use({ "jose-elias-alvarez/typescript.nvim", commit = "447a16d392652a792e45475ef6c75f297951c271" }) -- Typescript specific helper functions

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", commit = "cabf991b1d3996fa6f3232327fc649bbdf676496" })
	use({ "nvim-telescope/telescope-ui-select.nvim", commit = "62ea5e58c7bbe191297b983a9e7e89420f581369" })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		commit = "ee095abeac5842943a94a27c0ca75c61e7c614a2",
	})
	use({ "p00f/nvim-ts-rainbow", commit = "064fd6c0a15fae7f876c2c6dd4524ca3fad96750" })
	use({ "nvim-treesitter/playground", commit = "3421bbbfec25a7c54ee041ffb9cb226b69b2b995" })
	use({ "windwp/nvim-autopairs", commit = "b5994e6547d64f781cfca853a1aa6174d238fe0e" })
	use({ "kylechui/nvim-surround", commit = "6cc6b54d3728a17e34bb5c9b9db05c7e5690813d" })

	use({ "lewis6991/impatient.nvim", commit = "9f7eed8133d62457f7ad2ca250eb9b837a4adeb7" })

	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		commit = "29788cc32a153e42b2fe48344d315da8367fc6fa",
	})

	use({ "christoomey/vim-tmux-navigator", commit = "41ea9d23b814014c8d8daf8b44fa0cd827a0e5f4" })

	use("simrat39/rust-tools.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
