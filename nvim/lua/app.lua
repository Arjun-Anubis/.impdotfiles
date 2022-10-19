-- Apperance definitions
--

vim.cmd( [[
hi Pmenu ctermfg=250 ctermbg=235 
hi PmenuSel ctermfg=235 ctermbg=green
hi IncSearch ctermbg=242 guibg=DarkGrey
hi Search ctermfg=14 ctermbg=242 guifg=Cyan guibg=Grey
hi clear SignColumn 
]] )

vim.cmd([[
set guifont=JetBrains\ Mono:h9
colorscheme carbonfox
if exists("g:neovide")
	set pumblend=50
	set winblend=20
endif
]])
-- Todo, different colour for selected search and inc search, also no vim.cmd
-- vim.highlight.create apparently
-- The TODO Group exists (highlight)
