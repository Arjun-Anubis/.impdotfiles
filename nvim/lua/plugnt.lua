local ld = vim.fn["plug#"]
local Plug = ld
vim.call("plug#begin")

ld("tpope/vim-repeat")
ld("tpope/vim-surround")
ld("tpope/vim-unimpaired")
ld("tpope/vim-commentary")
-- ld("itchyny/lightline.vim")
ld("nvim-lualine/lualine.nvim")
ld("andweeb/presence.nvim")
ld("kshenoy/vim-signature")
ld("preservim/nerdtree")
ld("norcalli/nvim-terminal.lua")
ld("nvim-lua/plenary.nvim")
ld("nvim-telescope/telescope.nvim", { tag = "0.1.0" }) 
ld("nvim-treesitter/nvim-treesitter")
ld("neovim/nvim-lspconfig")
ld('neovim/nvim-lspconfig')
ld('hrsh7th/cmp-nvim-lsp')
ld('hrsh7th/cmp-buffer')
ld('hrsh7th/cmp-path')
ld('hrsh7th/cmp-cmdline')
ld('hrsh7th/nvim-cmp')
ld('jvgrootveld/telescope-zoxide')
ld('EdenEast/nightfox.nvim')
Plug 'nanotee/zoxide.vim'

vim.call("plug#end")


-- Initializations not large enough to credit their own file


require("lualine").setup {
	options = {
		theme = "horizon"
	}
}
