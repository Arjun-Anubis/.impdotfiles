local ld = vim.fn["plug#"]
local Plug = ld
vim.call("plug#begin")

Plug ("tpope/vim-repeat")
Plug ("tpope/vim-surround")
Plug ("tpope/vim-unimpaired")
Plug ("tpope/vim-commentary")
-- Plug ("itchyny/lightline.vim")
Plug ("nvim-lualine/lualine.nvim")
Plug ("andweeb/presence.nvim")
Plug ("kshenoy/vim-signature")
Plug ("preservim/nerdtree")
Plug ("norcalli/nvim-terminal.lua")
Plug ("nvim-lua/plenary.nvim")
Plug ("nvim-telescope/telescope.nvim", { tag = "0.1.0" }) 
Plug ("nvim-treesitter/nvim-treesitter")
Plug ("neovim/nvim-lspconfig")
Plug ('neovim/nvim-lspconfig')
Plug ('hrsh7th/cmp-nvim-lsp')
Plug ('hrsh7th/cmp-buffer')
Plug ('hrsh7th/cmp-path')
Plug ('hrsh7th/cmp-cmdline')
Plug ('hrsh7th/nvim-cmp')
Plug ('jvgrootveld/telescope-zoxide')
Plug ('EdenEast/nightfox.nvim')
Plug 'nanotee/zoxide.vim'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'gpanders/nvim-parinfer'
Plug 'elkowar/yuck.vim'

vim.cmd([[
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
]])

vim.call("plug#end")


-- Initializations not large enough to credit their own file


require("lualine").setup {
	options = {
		theme = "horizon"
	}
}

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = "all",

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
	  enable = true,
	  keymaps = {
		  init_selection = "gnn",
		  node_incremental = "grn",
		  scope_incremental = "grc",
		  node_decremental = "grm",
	  },
  },
}

vim.cmd([[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
]])

require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        -- You can optionally set descriptions to the mappings (used in the desc parameter of
        -- nvim_buf_set_keymap) which plugins like which-key display
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding or succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * selection_mode: eg 'v'
      -- and should return true of false
      include_surrounding_whitespace = true,
    },
  },
}
