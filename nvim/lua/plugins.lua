function start(use) 
	use('wbthomason/packer.nvim')
	use("tpope/vim-repeat")
	use("tpope/vim-surround")
	use("tpope/vim-unimpaired")
	use("tpope/vim-commentary")
	use("itchyny/lightline.vim")
	use("andweeb/presence.nvim")
	use("kshenoy/vim-signature")
	use("preservim/nerdtree")
	use("norcalli/nvim-terminal.lua")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim", { tag = "0.1.0" }) 
	use("nvim-treesitter/nvim-treesitter")
	use("neovim/nvim-lspconfig")
	use('neovim/nvim-lspconfig')
	use('hrsh7th/cmp-nvim-lsp')
	use('hrsh7th/cmp-buffer')
	use('hrsh7th/cmp-path')
	use('hrsh7th/cmp-cmdline')
	use('hrsh7th/nvim-cmp')
end

return require("packer").startup( st )
