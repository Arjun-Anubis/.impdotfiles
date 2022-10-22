function map(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

-- Leader

vim.g.mapleader = " "

-- Emacs Mappings

-- Terminal mappings --
-- vim.keymap.set( "t", "jj", "", {} )
vim.cmd([[
tnoremap jj <C-\><C-n>
]])
nmap( "<C-a>", "<Home>" )
imap( "<C-a>", "<Home>" )
nmap( "<C-e>", "<End>" )
imap( "<C-e>", "<End>" )


-- Telescope Mappings, #TODO, move to telescope import, or move to packer

-- require("cd")
-- vim.keymap.set('n', '<leader>c', cd.Cdz, {})

-- vim.keymap.set('n', '<leader>', builtin.help_tags, {})

-- Window moving

nmap( "<C-h>", "<C-w>h" )
nmap( "<C-j>", "<C-w>j" )
nmap( "<C-k>", "<C-w>k" )
nmap( "<C-l>", "<C-w>l" )


-- Leader Bindings
--
nmap( "<leader>w", "<C-w>" )
nmap( "<leader>v", ":vsplit" )
nmap( "<leader>s", ":split" )
-- Too hard to do in lua
vim.cmd([[
nnoremap <Leader>cd :Z 
]])
-- Add nerd tree toggling


--Quick Access files

vim.cmd([[ 
" Open i3
nnoremap <Leader>fi :edit ~/.config/i3/config<CR>

" open virmc
nnoremap <Leader>fv :Z nvim<CR>


nnoremap <Leader>fe :edit ~/.emacs.d/init.el<CR>

nnoremap <Leader>fz :edit ~/.config/zathura/zathurarc<CR>

nnoremap <Leader>fn :edit ~/.config/nvim/init.vim<CR>

nnoremap <Leader>fq :edit ~/.config/qutebrowser/config.py<CR>

nnoremap <Leader>fd :edit ~/.config/dunst/dunstrc<CR>

nnoremap <Leader>fb :edit ~/.bashrc<CR>

nnoremap <Leader>fs :edit ~/.config/sway/config<CR>
]])


