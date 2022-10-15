local set = vim.o

set.tabstop = 4
set.shiftwidth = 4
set.autoindent = false

-- Show the true line number at the line
set.number = true

-- And the relative line number everywhere else
set.relativenumber = true
set.cp = false

-- Look ma, no commands
set.showcmd = false

-- Tbh I don't know what I'm hiding
set.hidden = true

--Enable wildmenu, when tabbing through options
set.wildmenu = true

-- Encoding is utf-8, not ascii
set.encoding = "utf8"

-- Add **, to path, taht is, recursive searching
set.path = vim.o.path .. "**"

-- Also look in the #deprecated, snippets directory
set.path = vim.o.path .. "~/.vim/snippets"

-- Set the cursor, when possible, to block cursor, in normal, visual, and insert modes
set.guicursor = "n-v-c:block-Cursor"

-- Enable folding, but dont autofold, and maximum of 99 folds, fold by indent
set.foldmethod = "indent"
set.foldenable = false
set.foldlevel = 99

-- Hightlight searches, and find all of them
set.hlsearch = true
set.incsearch = true

-- Set the window sperator to a managable unicode charachter
set.fillchars = vim.o.fillchars .. "vert:│"



