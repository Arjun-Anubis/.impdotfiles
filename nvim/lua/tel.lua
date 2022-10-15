local z_utils = require("telescope._extensions.zoxide.utils")

require('telescope').setup{
  -- (other Telescope configuration...)
  extensions = {
    zoxide = {
      prompt_title = "[ Walking on the shoulders of TJ ]",
      mappings = {
        default = {
			action = function(selection) 
				vim.cmd( "cd" .. selection.path )
			end
        },
        ["<C-s>"] = {
          before_action = function(selection) print("before C-s") end,
          action = function(selection)
            vim.cmd("edit " .. selection.path)
          end
        },
        -- Opens the selected entry in a new split
        ["<C-q>"] = { action = z_utils.create_basic_command("split") },
      },
    }
  }
}
local builtin = require("telescope.builtin")
vim.keymap.set( "n",  "<leader> ", builtin.find_files, {} )
vim.keymap.set('n', '<leader>/', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>:', builtin.commands, {})

require("telescope").load_extension('zoxide')
